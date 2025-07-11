# Routeur Solaire

**Solar Router for [ESPHome](http://esphome.io)** a été conçu pour fonctionner avec [Home Assistant](http://home-assistant.io) et nécessite l'installation de l'[intégration ESPHome](https://www.home-assistant.io/integrations/esphome/).

## Régulation progressive

![HA](images/SolarRouterInHomeAssistant.png){ align=left }
!!! note ""
    **Contrôles**
    
    * ***Activer le routage solaire***  
      Contrôle si le routage solaire doit être activé ou non
    * ***Down Reactivity (Réactivité descendante)***  
      Vitesse du routage solaire utilisée lorsque la puissance réelle est supérieure à l'échange réseau cible.
      De 1 à 100. 1 est le plus lent, 100 est le plus rapide.
    * ***Up Reactivity (Réactivité ascendante)***  
      Vitesse du routage solaire utilisée lorsque la puissance réelle est inférieure à l'échange réseau cible.
      De 1 à 100. 1 est le plus lent, 100 est le plus rapide.
    * ***Ouverture du régulateur***  
      Pourcentage actuel d'ouverture de la porte pour envoyer de l'énergie à la charge 
    * ***Échange réseau cible***  
      Objectif d'énergie échangée avec le réseau.  
      &lt; 0 l'énergie est envoyée au réseau  
      &gt; 0 l'énergie est utilisée depuis le réseau
!!! note ""
    **Capteurs**
    
    * ***Puissance réelle***  
      Énergie effectivement échangée avec le réseau. Mise à jour toutes les secondes. 
  
<br>  
<br>  

!!! note 
    Lorsque le routage solaire est désactivé, le curseur d'ouverture du régulateur peut être modifié "manuellement".  
    Si vous modifiez l'état d'ouverture du triac alors que le routage solaire est activé, l'algorithme de routage modifiera immédiatement la valeur pour atteindre le niveau d'échange réseau cible.

## Régulation Tout ou Rien

![HA](images/SolarRouterONOFFInHomeAssistant.png){ align=left }
!!! note ""
    **Contrôles**
    
    * ***Activer le routage solaire***  
      Contrôle si le routage solaire doit être activé ou non
    * ***Dérivation d'énergie***  
      Active ou non la dérivation d'énergie 
    * ***Niveau de puissance de démarrage***  
      Définit le niveau d'énergie auquel la dérivation doit commencer  
    * ***Tempo de démarrage***  
      Durée pendant laquelle le niveau de démarrage doit être dépassé avant de dériver l'énergie  
    * ***Niveau de puissance d'arrêt***  
      Définit le niveau d'énergie auquel la dérivation doit s'arrêter  
    * ***Tempo d'arrêt***  
      Durée pendant laquelle le niveau d'arrêt doit être atteint avant d'arrêter la dérivation d'énergie
!!! note ""
    **Capteurs**
    
    * ***Puissance réelle***  
      Énergie effectivement échangée avec le réseau. Mise à jour toutes les secondes.
    * ***Tempo de démarrage***  
      Compteur définissant quand la dérivation d'énergie doit commencer 
    * ***Tempo d'arrêt***  
      Compteur définissant quand la dérivation d'énergie doit s'arrêter 

<br>
<br>

!!! note 
    Lorsque le routage solaire est désactivé, le curseur d'ouverture du régulateur peut être modifié "manuellement".  
    Si vous modifiez l'état d'ouverture du triac alors que le routage solaire est activé, l'algorithme de routage modifiera immédiatement la valeur pour atteindre le niveau d'échange réseau cible.
