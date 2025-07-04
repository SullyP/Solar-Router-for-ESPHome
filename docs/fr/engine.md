# Moteur de routeur solaire

Un moteur est conçu pour définir la quantité et le moment où l'énergie doit être détournée.

Différents types de moteurs existent, qui peuvent progressivement détourner l'énergie vers une charge et gérer un interrupteur ON/OFF.  
Pour plus de détails, référez vous aux pages dédiées des moteurs.

!!! note "Nommage des moteurs"
    Le nom du moteur reflète la façon dont le détournement d'énergie est effectué :  
    **Exemple** : `engine_1dimmer_1bypass` gérera 1 gradateur assurant une régulation progressive associée à un relais de dérivation.


### LEDs de retour utilisateur

La LED jaune reflète la connexion réseau :

- ***ÉTEINTE*** : le routeur solaire n'est pas connecté à l'alimentation.
- ***ALLUMÉE*** : le routeur solaire est connecté au réseau.
- ***CLIGNOTANTE*** : le routeur solaire n'est pas connecté au réseau et tente de se reconnecter.
- ***CLIGNOTEMENT RAPIDE*** : Une erreur se produit lors de la lecture de l'énergie échangée avec le réseau.

La LED verte reflète la configuration actuelle de la régulation :

- ***ÉTEINTE*** : la régulation automatique est désactivée.
- ***ALLUMÉE*** : la régulation automatique est active et ne détourne pas d'énergie vers la charge.
- ***CLIGNOTANTE*** : le routeur solaire envoie actuellement de l'énergie à la charge.

La configuration des LED est effectuée dans la configuration de l'`engine`.

### Afficher ou masquer les capteurs de régulateurs

Une variable optionnelle `hide_regulators` permet de changer la visibilité des capteurs de régulateurs dans HA (cachés par défaut).

Cette configuration est effectuée dans la configuration de l'`engine`.