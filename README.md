# Network Informations (NI)

Au vu de mon alternance, j'ai créé ce script PowerShell qui permet d'afficher les informations réseau de la machine sous forme d'une interface graphique. Il fournit des détails tels que l'adresse IP, le masque de sous-réseau, l'adresse MAC, le DNS et les paramètres DHCP,
mais de manière beaucoup plus inituitive et facile que les commandes que l'on peut ne pas connaître lorsque nous sommes pas initié.

## Fonctionnalités

- Récupération des informations réseau :
  - Adresse IPv4 et IPv6
  - Masque de sous-réseau
  - Adresse MAC
  - Passerelle par défaut
  - Serveurs DNS
  - État et serveur DHCP

- Affichage des informations dans une interface graphique utilisant `System.Windows.Forms`

- Sauvegarde de la configuration réseau dans un fichier texte

- Affichage des informations matérielles de la machine :
  - Système d'exploitation
  - Processeur
  - Mémoire RAM
  - Disque dur (modèle)
  - Fabricant et modèle de l'ordinateur

## Utilisation

1. Exécute le script PowerShell.
2. Une fenêtre s'ouvre affichant les informations réseau de la machine.
3. Clique sur **"Enregistrer ma configuration"** pour sauvegarder les paramètres dans un fichier `.txt`.
4. Clique sur **"Voir La Configuration Hardware"** pour afficher les spécifications matérielles.

## Technologies utilisées

- PowerShell
- `System.Windows.Forms` pour l'interface graphique
- `Get-CimInstance` pour récupérer les informations système

## Prérequis

- Windows
- PowerShell installé
