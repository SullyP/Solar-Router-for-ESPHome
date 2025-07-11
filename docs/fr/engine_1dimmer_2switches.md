# Engine 1 x dimmer + 2 x switches + 1 x bypass

Ce paquet met en �uvre le moteur du routeur solaire qui d�termine quand et combien d'�nergie doit �tre d�tourn�e vers trois charges utilisant trois canaux, ou une seule charge avec trois canaux comme un chauffe-eau avec trois r�sistances de chauffage.

Le moteur utilise 2 relais pour contr�ler les diff�rentes charges et d'un r�gulateur suppl�mentaire pour un contr�le fin de la puissance. Les charges sont activ�es de mani�re s�quentielle au fur et � mesure que la puissance devient disponible :
1. 1er canal : Relay 1 (On/Off)
2. 2�me canal: Relay 2 (On/Off)
3. 3�me canal: R�gulateur TRIAC ou SSR (Contr�l variable)

Lorsque les besoins en �nergie augmentent :

- Tout d'abord, le r�gulateur du canal 3 augmente progressivement la puissance.
- Lorsque le r�gulateur atteint 33,33 %, le relais 1 s'active
- Lorsque le r�gulateur atteint 66,66 %, le relais 2 s'active

**Le moteur 1 x variateur + 2 x interrupteurs + 1 x bypass** appelle toutes les secondes le compteur �lectrique pour obtenir l'�nergie r�elle �chang�e avec le r�seau. Si l'�nergie produite est sup�rieure � l'�nergie consomm�e et d�passe l'objectif d'�change d�fini, le moteur d�terminera la combinaison appropri�e de relais et d'ouverture du r�gulateur pour atteindre l'objectif.

La r�gulation automatique du moteur peut �tre activ�e ou d�sactiv�e � l'aide de du switch d'activation.

## Comment c�bler les relais (canaux 1 et 2)

- Ligne sur le relais Commun (COM)
- Normalement ouvert (NO) du relais de la charge d'entr�e directement � la charge

## Comment c�bler le relais de bypass (Canal 3)

- Phase sur le Commun (COM) du relais de bypass et sur le relais vers l'entr�e Phase du r�gulateur
- Normalement Ferm� (NC) flottant
- Normalement Ouvert (NO) du relais vers la sortie Charge du r�gulateur (ou directement vers la charge)

!!! Danger "Suivez les instructions de c�blage"
    Ne branchez pas l'entr�e Phase du r�gulateur au Normalement Ferm� (NC) du relais ! Votre charge serait mise hors tension lors de la commutation du relais, cr�ant potentiellement des arcs � l'int�rieur du relais.
    Plus d'informations dans cette [discussion](https://github.com/XavierBerger/Solar-Router-for-ESPHome/pull/51#issuecomment-2625724543).

## Wiring schema example

![Wiring schema example for water heater](images/3ResistorsWaterHeaterExample.svg)

## Configuration

Pour utiliser ce package, ajoutez les lignes suivantes � votre fichier de configuration :

```yaml linenums="1"
packages:
  engine:
    url: https://github.com/XavierBerger/Solar-Router-for-ESPHome/
    files:
      - path: solar_router/engine_1dimmer_2switches.yaml
        vars:
          green_led_pin: GPIO1
          green_led_inverted: 'False'
          yellow_led_pin: GPIO2
          yellow_led_inverted: 'False'
          hide_regulators: 'True'
          hide_leds: 'True'
```
Il est necessaire de d�finir `green_led_pin` et `yellow_led_pin` dans la section `vars` comme montr� dans l'exemple ci-dessus.
 
 * * Le param�tre `xxx_led_inverted` permet de d�finir si la LED est active sur niveau haut ou bas. Ce param�tre est optionnel.
 * Le param�tre `hide_regulators` permet de d�finir si le capteur de r�gulateur est affich� dans HA. Ce param�tre est optionnel.
 * Le param�tre `hide_leds` permet de d�finir si les valeurs des leds sont affich�es dans HA. Ce param�tre est optionnel.

!!! tip "Ajustement du Bypass tempo"
    Le `Bypass tempo` d�termine combien de r�gulations cons�cutives � 33.33% ou 66.66% sont n�cessaires avant d'activer le relais de bypass. Une valeur plus basse rendra le bypass plus r�actif mais pourrait causer des commutations plus fr�quentes (scintillement). Comme il y a environ 1 r�gulation par seconde, `Bypass tempo` peut �tre approxim� comme le temps en secondes avec le r�gulateur � 33.33% ou 66.66% avant que le relais de bypass ne soit activ�.

Ce paquet n�cessite l'utilisation du package Relais r�gulateur ET d'un package r�gulateur (TRIAC ou SSR). N'oubliez pas de les inclure �galement.

Vous trouverez ci-dessous l'exemple de configuration pour les relais :

```yaml linenums="1"
packages:
  relay1_regulator:
    url: https://github.com/XavierBerger/Solar-Router-for-ESPHome/
    files:
      - path: solar_router/regulator_mecanical_relay.yaml
        vars:
          relay_regulator_gate_pin: GPIO17
          relay_unique_id: "1"
  relay2_regulator:
    url: https://github.com/XavierBerger/Solar-Router-for-ESPHome/
    files:
      - path: solar_router/regulator_mecanical_relay.yaml
        vars:
          relay_regulator_gate_pin: GPIO18
          relay_unique_id: "2"
```

!!! note "Relay Ids"
    Les identifiants uniques des relais ne peuvent pas �tre modifi�s pour utiliser ce moteur.