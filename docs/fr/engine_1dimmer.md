# Engine 1 x dimmer

Ce package implémente le moteur du routeur solaire qui détermine quand et quelle quantité d'énergie doit être déviée vers la charge.

L'**Engine 1 x dimmer** appelle toutes les secondes le compteur d'énergie pour obtenir l'énergie réelle échangée avec le réseau. Si l'énergie produite est supérieure à l'énergie consommée et dépasse la cible d'échange définie, le moteur déterminera le **pourcentage d'ouverture du régulateur** et l'ajustera dynamiquement pour atteindre la cible.

La régulation automatique du moteur peut être activée ou désactivée avec l'interrupteur d'activation.

## Configuration

Pour utiliser ce package, ajoutez les lignes suivantes à votre fichier de configuration :

```yaml linenums="1"
packages:
  solar_router:
    url: https://github.com/XavierBerger/Solar-Router-for-ESPHome/
    files:
      - path: solar_router/engine_1dimmer.yaml
        vars:
          green_led_pin: GPIO32
          green_led_inverted: 'False'
          yellow_led_pin: GPIO14
          yellow_led_inverted: 'False'
```

Il est necessaire de définir `green_led_pin` et `yellow_led_pin` dans la section `vars` comme mo,ntré dans l'exemple ci-dessus. Le paramètre `xxx_led_inverted` permet de définir si la LED est active sur niveau haut ou bas. Ce paramètre est optionnel.

