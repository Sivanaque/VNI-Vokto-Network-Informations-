##[Ps1 To Exe]
##
##NcDBCIWOCzWE8pGP3wFk4Fn9flsieMSVhZKi14qo8PrQjQvwCdIiRl9jmWnSAV+qVuAZFdwbst4DWBw+Jv0F8fvsK9SPTK4Pgd9WZeOBtfw5Bgu4
##Kd3HDZOFADWE8uO1
##Nc3NCtDXTlaDjofG5iZk2XjnVGklUuGeqr2zy5GAycTF+23vRpEARhRZkz3rC1m2GdscU/oHudAFXBIkPLs30oH2EuusVp4DkexxJeyNqdI=
##Kd3HFJGZHWLWoLaVvnQnhQ==
##LM/RF4eFHHGZ7/K1
##K8rLFtDXTiW5
##OsHQCZGeTiiZ4tI=
##OcrLFtDXTiW5
##LM/BD5WYTiiZ4tI=
##McvWDJ+OTiiZ4tI=
##OMvOC56PFnzN8u+Vs1Q=
##M9jHFoeYB2Hc8u+Vs1Q=
##PdrWFpmIG2HcofKIo2QX
##OMfRFJyLFzWE8uK1
##KsfMAp/KUzWJ0g==
##OsfOAYaPHGbQvbyVvnQX
##LNzNAIWJGmPcoKHc7Do3uAuO
##LNzNAIWJGnvYv7eVvnQX
##M9zLA5mED3nfu77Q7TV64AuzAgg=
##NcDWAYKED3nfu77Q7TV64AuzAgg=
##OMvRB4KDHmHQvbyVvnQX
##P8HPFJGEFzWE8tI=
##KNzDAJWHD2fS8u+Vgw==
##P8HSHYKDCX3N8u+Vgw==
##LNzLEpGeC3fMu77Ro2k3hQ==
##L97HB5mLAnfMu77Ro2k3hQ==
##P8HPCZWEGmaZ7/K1
##L8/UAdDXTlaDjofG5iZk2XjnVGklUuGeqr2zy5GAycTF+23vRpEARhRZkz3rC1m2GdscU/oHudAFXBIkPLs31Jz5W6+fSqkenaNRbvGZqaAiVXPW5Zzm3hiGxpLODUUsU0T6DA==
##Kc/BRM3KXhU=
##
##
##fd6a9f26a06ea3bc99616d4851b372ba
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
Add-Type -AssemblyName PresentationCore,PresentationFramework

# Network Variables
$fontBox = New-Object System.Drawing.Font ("Lucida Console", 10)
$fontBoxBold = New-Object System.Drawing.Font ("Lucida Console", 10, [System.Drawing.FontStyle]::Bold) 
$getIPv4 = (Get-CimInstance Win32_NetworkAdapterConfiguration | Where {$_.IPEnabled -eq $true}).IPAddress[0] 
$getIPv6 = (Get-CimInstance Win32_NetworkAdapterConfiguration | Where {$_.IPEnabled -eq $true}).IPAddress[1]
$getSubNet = (Get-CimInstance Win32_NetworkAdapterConfiguration | Where {$_.IPEnabled -eq $true}).IPSubnet[0]
$getIPv6Perma = (Get-CimInstance Win32_NetworkAdapterConfiguration | Where {$_.IPEnabled -eq $true}).MACAddress
$getPasserelle = (Get-CimInstance Win32_NetworkAdapterConfiguration | Where {$_.IPEnabled -eq $true}).DefaultIPGateway
$getDNSName = (Get-CimInstance Win32_NetworkAdapterConfiguration | Where {$_.IPEnabled -eq $true}).DNSDomain
$getDNSServers = (Get-CimInstance Win32_NetworkAdapterConfiguration | Where {$_.IPEnabled -eq $true}).DNSServerSearchOrder | Format-Table | Out-String
$getDHCPState = (Get-CimInstance Win32_NetworkAdapterConfiguration | Where {$_.IPEnabled -eq $true}).DHCPEnabled
$getDHCPServer = (Get-CimInstance Win32_NetworkAdapterConfiguration | Where {$_.IPEnabled -eq $true}).DHCPServer

# Replace Part

$hostMachine = [system.environment]::MachineName
$getDHCPState = $getDHCPState -replace "True", "Oui" -replace "False", "Non"
                                                           
$window = New-Object System.Windows.Forms.Form
$window.AutoSize = $true
$window.Text = "NI (Network Informations)"
$window.MinimizeBox = $false
$window.MaximizeBox = $false
$window.AutoSizeMode = "GrowandShrink"
$window.StartPosition = "CenterScreen"
$window.ShowInTaskbar = $true

$h1 = New-Object System.Windows.Forms.Label
$h1.Text = "Vos Informations Réseau :"
$h1.BackColor = "#6c42f5"
$h1.ForeColor = "White"
$h1.AutoSize = $true
$h1.Padding = New-Object System.Windows.Forms.Padding(5)
$h1.Location = New-Object System.Drawing.Point(0, 10)
$h1.Font = New-Object System.Drawing.Font ("Century Gothic", 16, [System.Drawing.FontStyle]::Bold)
$window.Controls.Add($h1)

$listPing = New-Object System.Windows.Forms.RichTextBox
$listPing.ReadOnly = $true
$listPing.WordWrap = $true
$listPing.Width = 420
$listPing.Height = 450
$listPing.Location = New-Object System.Drawing.Point(0, 60) 
$listPing.ForeColor = "Black"
$listPing.Font = $fontBox
$listPing.Text = "Informations Personnelles `n---------------------`nNom de la machine : $hostMachine `nAdresse IPv4 : $getIPv4 `nAdresse IPv6 : $getIPv6 `nAdresse Physique (MAC) : $getIPv6Perma `nMasque de sous-réseau : $getSubNet `nAdresse de la passerelle : $getPasserelle `n`n`nDNS`n---------------------`nSuffixe DNS : $getDNSName `nServeurs DNS : $getDNSServers `n`n`nDHCP`n---------------------`nDHCP activé : $getDHCPState `nServeur DHCP : $getDHCPServer"
$window.Controls.Add($listPing)

$btnTxt = New-Object System.Windows.Forms.Button
$btnTxt.FlatStyle = New-Object System.Windows.Forms.FlatStyle::Flat
$btnTxt.FlatAppearance.BorderSize = 0;
$btnTxt.BackColor = "#6c42f5"
$btnTxt.ForeColor = "White"
$btnTxt.Text = "Enregistrer ma configuration"
$btnTxt.Font = New-Object System.Drawing.Font ("Century Gothic", 10)
$btnTxt.AutoSize = $true
$btnTxt.Location = New-Object System.Drawing.Point(5, 515)
$btnTxt.Padding = New-Object System.Windows.Forms.Padding(8)
$btnTxt.Add_Click({
    $fileBrowser =
     New-Object System.Windows.Forms.FolderBrowserDialog
    $fileBrowser.Description = "Sélectionner le répertoire désiré."

    if ($fileBrowser.ShowDialog() -eq "OK") {
        New-Item -Path $fileBrowser.SelectedPath -Name "Configuration-IP.txt" -ItemType File -Value $listPing.Text
        $msgConfirm = [System.Windows.MessageBox]::Show("Votre configuration Internet a été enregistré !", "Fichier Configuration", 0, 64)
    }
    
})
$window.Controls.Add($btnTxt)

$btnHardware = New-Object System.Windows.Forms.Button
$btnHardware.FlatStyle = New-Object System.Windows.Forms.FlatStyle::Flat
$btnHardware.FlatAppearance.BorderSize = 0;
$btnHardware.BackColor = "#FFBC0A"
$btnHardware.ForeColor = "White"
$btnHardware.Text = "Voir La Configuration Hardware"
$btnHardware.Font = New-Object System.Drawing.Font ("Century Gothic", 10)
$btnHardware.AutoSize = $true
$btnHardware.Location = New-Object System.Drawing.Point(220, 515)
$btnHardware.Padding = New-Object System.Windows.Forms.Padding(8)

$btnHardware.Add_Click({
    # Hardware Informations
    $RAM = (Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory / 1GB
    $CPU = (Get-CimInstance Win32_Processor).Name | Out-String
    $HD = (Get-CimInstance Win32_DiskDrive).Model | Out-String
    $OSName = (Get-CimInstance Win32_OperatingSystem).Caption | Out-String
    $OSManu = (Get-CimInstance Win32_ComputerSystem).Manufacturer | Out-String 
    $OSModel = (Get-CimInstance Win32_ComputerSystem).Model | Out-String 
    
    $windowHW = New-Object System.Windows.Forms.Form
    $windowHW.AutoSize = $true
    $windowHW.Text = "NI (Network Information)"
    $windowHW.MinimizeBox = $false
    $windowHW.MaximizeBox = $false
    $windowHW.AutoSizeMode = "GrowandShrink"
    $windowHW.StartPosition = "Manual"
    $windowHW.ShowInTaskbar = $true

    $listHW = New-Object System.Windows.Forms.RichTextBox
    $listHW.ReadOnly = $true
    $listHW.WordWrap = $true
    $listHW.Width = 480
    $listHW.Height = 450
    $listHW.ForeColor = "Black"
    $listHW.Text = "Système d'exploitation : $($OSName) `nMémoire RAM : $([math]::Round($RAM))GB `nProcesseur : $($CPU) `nDisque Dur (Modèle) : $($HD) `nManuFacture : $($OSManu) `nModèle : $($OSModel)" 
    $listHW.Font = $fontBox
    $windowHW.Controls.Add($listHW)
    
    $windowHW.ShowDialog()   
})
$window.Controls.Add($btnHardware)

$window.ShowDialog()
