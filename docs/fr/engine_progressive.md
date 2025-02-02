# Progressive Engine

Ce package implémente le moteur du routeur solaire qui détermine quand et quelle quantité d'énergie doit être déviée vers la charge.

Le **progressive engine** appelle toutes les secondes le compteur d'énergie pour obtenir l'énergie réelle échangée avec le réseau. Si l'énergie produite est supérieure à l'énergie consommée et dépasse la cible d'échange définie, le moteur déterminera le **pourcentage d'ouverture du régulateur** et l'ajustera dynamiquement pour atteindre la cible.

La régulation automatique du moteur peut être activée ou désactivée avec l'interrupteur d'activation.

## LEDs de retour utilisateur

La LED jaune reflète la connexion au réseau :

- ***ÉTEINTE*** : le routeur solaire n'est pas connecté à l'alimentation.
- ***ALLUMÉE*** : le routeur solaire est connecté au réseau.
- ***clignotement*** : le routeur solaire n'est pas connecté au réseau et essaie de se reconnecter.
- ***clignotement rapide*** : Une erreur s'est produite lors de la lecture de l'énergie échangée avec le réseau.

La LED verte reflète la configuration actuelle de la régulation :

- ***ÉTEINTE*** : la régulation automatique est désactivée.
- ***ALLUMÉE*** : la régulation automatique est active et ne dévie pas d'énergie vers la charge.
- ***clignotement*** : le routeur solaire envoie actuellement de l'énergie à la charge.

## Configuration

Pour utiliser ce package, ajoutez les lignes suivantes à votre fichier de configuration :

```yaml linenums="1"
packages:
  engine:
    url: https://github.com/XavierBerger/Solar-Router-for-ESPHome/
    file: solar_router/engine.yaml
```

Lorsque ce package est utilisé, il est nécessaire de définir les paramètres suivants dans la section `substitutions`, comme illustré dans l'exemple ci-dessous :

```yaml linenums="1"
substitutions:
  # LEDs -------------------------------------------------------------------------
  # Green LED is reflecting regulation status
  # Yellow LED is reflecting power meter status
  green_led_pin: GPIO19
  yellow_led_pin: GPIO18
```
