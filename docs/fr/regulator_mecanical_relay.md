# Mecanical Relay regulator

Ce régulateur effectue une **Régulation Tout ou Rien**.

![texte alternatif](images/Regulation_on_off.png)

Un relais est capable de laisser passer ou non le courant vers la charge.

Le schéma suivant représente le câblage du relais :

![relais](images/mecanical_relay.drawio.png)

!!! Attention "Soyez prudent lors du câblage et utilisez la broche Normalement Ouverte (NO)."

!!! Danger "AVERTISSEMENT : Ce type de relais n'est pas compatible avec les moteurs à vitesse progressive. Utilisez-le uniquement pour [moteur ON/OFF](engine_on_off.md)"

Pour utiliser ce package, ajoutez les lignes suivantes à votre fichier de configuration :

```yaml linenums="1"
packages:
  relay_regulator:
    url: https://github.com/XavierBerger/Solar-Router-for-ESPHome/
    file: solar_router/regulator_mecanical_relay.yaml
```

Ce package nécessite la définition de la broche connectée à la porte du relais : `relay_regulator_gate_pin`

```yaml linenums="1"
substitutions:
  # Regulator configuration ------------------------------------------------------
  # Define GPIO pin connected to the relay gate.
  relay_regulator_gate_pin: GPIO22
```
