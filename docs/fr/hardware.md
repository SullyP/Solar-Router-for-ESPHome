# Matériel

Le matériel utilisé pour le développement est celui proposé par [F1ATB.fr](https://f1atb.fr/fr/routeur-photovoltaique-realisation-materielle/) ![fr](images/france.png).

Sur les photos ci-dessous, le dissipateur thermique fourni par RobotDyn étant sous-dimensionné, le triac a été dessoudé de la carte et vissé sur un grand dissipateur thermique. Des fils ont été ajoutés pour relier le triac à la carte.

Une alimentation 12V est utilisée en plus d'un convertisseur buck pour alimenter le système. Le 12V peut être utilisé pour alimenter un ventilateur en cas de surchauffe.

![SolarRouteOpen](images/SolarRouterOpen.png){ width=360 }
![SolarRouteClose](images/SolarRouterClosed.png){ width=300 }

Le routeur a été conçu pour être connecté à un système de protection contre le gel et fournir ensuite des prises électriques standard.

## Utilisation d'un régulateur basé sur un triac

![connexion triac](images/hardware_triac.drawio.png)

Liste des composants :

* 1 x Carte de développement ESP32 (Wroom-32U avec antenne externe)
* 1 x LED verte
* 1 x LED jaune
* 1 x Triac RobotDyn 24A
* 2 x résistances 470 Ohms pour les LEDs

## Utilisation d'un régulateur basé sur un relais

![connexion relais](images/hardware_relais.drawio.png)

Liste des composants :

* 1 x Carte de développement ESP32 (Wroom-32U avec antenne externe)
* 1 x LED verte
* 1 x LED jaune
* 1 x Relais statique
* 2 x résistances 470 Ohms pour les LEDs

## Le plus petit routeur solaire

![petit routeur solaire](images/micro_power_router.png){ width=200 }

Liste des composants :

* 1 x Module relais ESP01
* 1 x ESP8266 (ou équivalent)

!!! Note "Ce routeur a quelques limitations"
    * Il doit être utilisé avec une regulation Tout ou Rien (engine_1switch.yaml) et n'est pas compatible avec une régulation progressive
    * En raison de l'espace mémoire limité, il ne prend pas en charge la mise à jour OTA
