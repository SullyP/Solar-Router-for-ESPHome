# Régulateur avec Bypass

Ce package implémente le moteur du routeur solaire qui détermine quand et quelle quantité d'énergie doit être déviée vers la charge, avec une fonction de bypass pour une efficacité maximale.

Lorsque le régulateur est utilisé intensivement pendant une période prolongée, il aura tendance à surchauffer. Ce moteur est conçu pour éviter ce problème en activant un relais de bypass et en éteignant le régulateur lorsque celui-ci est ouvert à 100% pendant une période prolongée. Pour éviter le scintillement, le relais de bypass n'est activé que lorsque le régulateur est ouvert à 100% pendant un nombre consécutif de régulations.

Le **régulateur avec bypass** interroge chaque seconde le compteur d'énergie pour obtenir l'énergie réelle échangée avec le réseau. Si l'énergie produite est supérieure à l'énergie consommée et dépasse l'objectif d'échange défini, le moteur déterminera le **pourcentage d'ouverture du régulateur** et l'ajustera dynamiquement pour atteindre l'objectif. Lorsque le régulateur atteint 100% pendant une période prolongée, le relais de bypass est activé pour une efficacité maximale.

La régulation automatique du moteur peut être activée ou désactivée avec l'interrupteur d'activation.

## Comment câbler le relais de bypass

- Phase sur le Commun (COM) du relais de bypass et sur le relais vers l'entrée Phase du régulateur
- Normalement Fermé (NC) flottant
- Normalement Ouvert (NO) du relais vers la sortie Charge du régulateur (ou directement vers la charge)

!!! Danger "Suivez les instructions de câblage"
    Ne branchez pas l'entrée Phase du régulateur au Normalement Fermé (NC) du relais ! Votre charge serait mise hors tension lors de la commutation du relais, créant potentiellement des arcs à l'intérieur du relais.
    Plus d'informations dans cette [discussion](https://github.com/XavierBerger/Solar-Router-for-ESPHome/pull/51#issuecomment-2625724543).

## LEDs de retour utilisateur

La LED jaune reflète la connexion réseau :

- ***ÉTEINTE*** : le routeur solaire n'est pas alimenté.
- ***ALLUMÉE*** : le routeur solaire est connecté au réseau.
- ***clignotement*** : le routeur solaire n'est pas connecté au réseau et tente de se reconnecter.
- ***clignotement rapide*** : Une erreur s'est produite lors de la lecture de l'énergie échangée avec le réseau.

La LED verte reflète la configuration actuelle de la régulation :

- ***ÉTEINTE*** : la régulation automatique est désactivée.
- ***ALLUMÉE*** : la régulation automatique est active et ne dévie pas d'énergie vers la charge.
- ***clignotement*** : le routeur solaire envoie actuellement de l'énergie vers la charge.

## Niveau du Routeur vs Ouverture du Régulateur

Le routeur solaire utilise trois contrôles de niveau distincts mais liés :

- **Niveau du Routeur** : C'est le contrôle principal du système (0-100%) qui représente l'état global du routage. Il contrôle les indicateurs LED et la logique du compteur d'énergie. Lorsque la régulation automatique est activée, ce niveau est ajusté dynamiquement en fonction des mesures de puissance.

- **Ouverture du Régulateur** : Cela représente le niveau d'ouverture réel (0-100%) du régulateur physique. Par défaut, il reflète le niveau du routeur puisqu'il n'y a qu'un seul régulateur. Bien qu'il puisse être contrôlé indépendamment, les changements de regulator_opening seuls n'affecteront pas le router_level ni ne déclencheront de changements d'état des LED.

- **Relais de Bypass** : Cela représente l'état réel (ON/OFF) du relais de bypass physique. Lorsque la régulation est activée, ce relais s'active automatiquement après la durée `bypass_timer_threshold` définie ci-dessous. Lorsque la régulation est désactivée, vous pouvez déclencher manuellement ce relais pour alimenter complètement votre charge, les LED et le compteur d'énergie (si activé) ne seront pas déclenchés. Vous pouvez également régler le *Niveau du Routeur* à 100, cela activera le relais, alimentera complètement votre charge, déclenchera les LED et le compteur d'énergie.

L'entité d'ouverture du régulateur est masquée de Home Assistant par défaut. Pour l'exposer, modifiez les paramètres `hide_regulators` comme indiqué ci-dessous.

Note : Il est recommandé d'ajuster le *Niveau du Routeur* plutôt que l'*Ouverture du Régulateur* ou le *Relais de Bypass* directement, car cela assure un retour système approprié via les LED et la surveillance de l'énergie. Utilisez l'*Ouverture du Régulateur* ou le *Relais de Bypass* directement, après avoir désactivé le *Routage Solaire* uniquement si vous voulez alimenter votre charge sans retour des LED ou surveillance de l'énergie.

## Configuration

Pour utiliser ce package, ajoutez les lignes suivantes à votre fichier de configuration :

```yaml linenums="1"
packages:
  engine_regulator_with_bypass:
    url: https://github.com/XavierBerger/Solar-Router-for-ESPHome/
    file: solar_router/engine_regulator_with_bypass.yaml
```

Lorsque ce package est utilisé, il est nécessaire de définir les paramètres suivants dans la section `substitution` comme montré dans l'exemple ci-dessous :

```yaml linenums="1"
substitutions:
  # LEDs -------------------------------------------------------------------------
  # La LED verte reflète l'état de la régulation
  # La LED jaune reflète l'état du compteur d'énergie
  green_led_pin: GPIO19
  yellow_led_pin: GPIO18
  # (Optionnel) Expose l'ouverture du régulateur à HA (masqué par défaut)
  hide_regulators: "False"
  # Paramètres de bypass ------------------------------------------------------
  bypass_timer_threshold: "30"  # Nombre de régulations consécutives à 100% avant d'activer le bypass
```

!!! tip "Ajustement du bypass_timer_threshold"
    Le `bypass_timer_threshold` détermine combien de régulations consécutives à 100% sont nécessaires avant d'activer le relais de bypass. Une valeur plus basse rendra le bypass plus réactif mais pourrait causer des commutations plus fréquentes (scintillement). Comme il y a environ 1 régulation par seconde, `bypass_timer_threshold` peut être approximé comme le temps en secondes avec le régulateur à 100% avant que le relais de bypass ne soit activé.