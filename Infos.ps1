Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$NomUtilisateur = [System.Environment]::UserName
$NomPC = [System.Environment]::MachineName
$SerialPC = WMIC Bios get serialnumber
$RAM = (Get-CimInstance win32_computersystem).TotalPhysicalMemory / 1GB
$VersionSysteme = [System.Environment]::OSVersion
$AdresseIP = (Get-NetIPAddress -AddressFamily IPv4).IPAddress
$AdresseMAC = (Get-NetAdapter).MacAddress
$Connectivity = Test-Connection google.fr, vokto.com, 8.8.8.8 -Count 1 | foreach {$_.Status}
$TailleTexte = New-Object System.Drawing.Font("Arial", 10, [System.Drawing.FontStyle]::Bold)

$Fenetre = New-Object System.Windows.Forms.Form

$Fenetre.Width = "500"
$Fenetre.Height = "300"
$Fenetre.text = "Informations Système"
$Fenetre.MaximizeBox = $False

$LabelInfoSystem = New-Object System.windows.Forms.Label
$LabelInfoSystem.Location = New-Object System.Drawing.Point(10,10)
$LabelInfoSystem.Autosize = $True
$LabelInfoSystem.Text = "Informations Système"
$LabelInfoSystem.Font = $TailleTexte
$Fenetre.controls.Add($LabelInfoSystem)

$LabelNomUtilisateur = New-Object System.windows.Forms.Label
$LabelNomUtilisateur.Location = New-Object System.Drawing.Point(20,40)
$LabelNomUtilisateur.Autosize = $True
$LabelNomUtilisateur.Text = "Nom d'utilisateur  $($NomUtilisateur)"
$Fenetre.controls.Add($LabelNomUtilisateur)

$LabelNomPC = New-Object System.windows.Forms.Label
$LabelNomPC.Location = New-Object System.Drawing.Point(20,70)
$LabelNomPC.Autosize = $True
$LabelNomPC.Text = "Nom du PC  $($NomPC)"
$Fenetre.controls.Add($LabelNomPC)

$LabelSerial = New-Object System.windows.Forms.Label
$LabelSerial.Location = New-Object System.Drawing.Point(20,100)
$LabelSerial.Autosize = $True
$LabelSerial.Text = "$($SerialPC)"
$Fenetre.controls.Add($LabelSerial)

$LabelRAM = New-Object System.windows.Forms.Label
$LabelRAM.Location = New-Object System.Drawing.Point(20,130)
$LabelRAM.Autosize = $True
$LabelRAM.Text = "Mémoire Installée  $([Math]::Round($RAM)) Go"
$Fenetre.controls.Add($LabelRAM)

$LabelVersionSysteme = New-Object System.windows.Forms.Label
$LabelVersionSysteme.Location = New-Object System.Drawing.Point(20,160)
$LabelVersionSysteme.Autosize = $True
$LabelVersionSysteme.Text = "Version du système  $($VersionSysteme.Version)"
$Fenetre.controls.Add($LabelVersionSysteme)

$InfosReseau = New-Object System.windows.Forms.Label
$InfosReseau.Location = New-Object System.Drawing.Point(10,190)
$InfosReseau.Autosize = $True
$InfosReseau.Text = "Informations Réseau"
$InfosReseau.Font = $TailleTexte
$Fenetre.controls.Add($InfosReseau)

$LabelAdresseIP = New-Object System.windows.Forms.Label
$LabelAdresseIP.Location = New-Object System.Drawing.Point(20,220)
$LabelAdresseIP.Autosize = $True
$LabelAdresseIP.Text = "Adresses IP  $($AdresseIP)"
$Fenetre.controls.Add($LabelAdresseIP)

$LabelAdresseMAC = New-Object System.windows.Forms.Label
$LabelAdresseMAC.Location = New-Object System.Drawing.Point(20,250)
$LabelAdresseMAC.Autosize = $True
$LabelAdresseMAC.Text = "Adresse MAC  $($AdresseMAC)"
$Fenetre.controls.Add($LabelAdresseMAC)

$LabelConnectivity = New-Object System.windows.Forms.Label
$LabelConnectivity.Location = New-Object System.Drawing.Point(20,280)
$LabelConnectivity.Autosize = $True
$LabelConnectivity.Text = "Connectivité Internet  $($Connectivity)"
$Fenetre.controls.Add($LabelConnectivity)   




$Fenetre.ShowDialog()

