# Network Informations (NI)

Au vu de mon alternance, j'ai créé ce script PowerShell qui permet d'afficher les informations réseau de la machine sous forme d'une interface graphique. Il fournit des détails réseau comme hardware mais de manière beaucoup plus inituitive et facile que les commandes que l'on peut ne pas connaître lorsque nous sommes pas initié.

## Prérequis

⚠ Assurez-vous d'avoir Powershell 5.1 ou 7 d'installé sur votre ordinateur

## Fonctionnalités

- Récupération des informations réseau :
  - Adresse IPv4 et IPv6
  - Masque de sous-réseau
  - Adresse MAC
  - Passerelle par défaut
  - Serveurs DNS
  - État et serveur DHCP

- Sauvegarde de la configuration réseau dans un fichier texte

- Affichage des informations matérielles de la machine :
  - Système d'exploitation
  - Processeur
  - Mémoire RAM
  - Disque dur (modèle)
  - Fabricant et modèle de l'ordinateur

## Utilisation

Une converstion en .exe est disponible afin de tester le script sans pour autant devoir gérer les politiques d'autorisations de PowerShell.

*Dans le cas où vous souhaitez éxécuter le script avec PowerShell, autoriser son éxécution de script au sein de votre infrastrcutre AD ou votre machine, puis cliquer sur NI.ps1*

Les fonctionnalités seront ensuite sous vos yeux. 😀

## Technologies utilisées

Les informations de votre machine sont récupéres depuis les instances CIM proposés par Windows.

