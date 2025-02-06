# engine_1switch

Ce package implémente le moteur du routeur solaire qui détermine si l'énergie peut être détournée vers une charge locale ou non.

Le ***engine_1switch*** appelle chaque seconde le compteur d'énergie pour obtenir la puissance réelle consommée. Si l'énergie envoyée au réseau est supérieure au niveau de démarrage du détournement (en W) pendant le temps de démarrage (en s), le relais est fermé pour utiliser l'énergie localement. Lorsque l'énergie envoyée au réseau atteint le niveau défini (en W) pour arrêter le détournement pendant le temps d'arrêt (en s), le relais est ouvert et la consommation locale est arrêtée.

La régulation automatique du *engine_1switch* peut être activée ou désactivée avec l'interrupteur d'activation.

Le schéma suivant représente la consommation avec ce moteur activé :

![engine_1switch](images/engine_1switch.png)

**Légende :**

 * Vert : Énergie consommée provenant des panneaux solaires (autoconsommation)
 * Jaune : Énergie envoyée au réseau
 * Rouge : Énergie consommée provenant du réseau

**Comment ça fonctionne ?**

* **①** La partie jaune du graphique montre le niveau de démarrage. Lorsque l'énergie envoyée au réseau atteint le niveau de démarrage, l'énergie est détournée localement.
* **②** La partie jaune du graphique montre le niveau d'arrêt. Dans cet exemple, 0W.

!!! Danger "Définissez soigneusement les niveaux de démarrage et d'arrêt"
    Le niveau de démarrage doit être supérieur à la puissance de la charge branchée au routeur solaire. Sinon, dès que l'énergie sera détournée vers la charge, le niveau d'arrêt sera atteint et vous verrez le routeur basculer entre ON et OFF (en fonction de la temporisation que vous avez définie).

!!! Astuce "Ajustez finement les temps de démarrage et d'arrêt"
    Les temps de démarrage et d'arrêt déterminent la réactivité de la régulation. Ces délais doivent être finement ajustés pour éviter les oscillations. Par exemple, si vous avez une cuisinière électrique, faites attention aux délais de chauffe.

## Configuration

Pour utiliser ce package, ajoutez les lignes suivantes à votre fichier de configuration :

```yaml linenums="1"
packages:
  engine:
    url: https://github.com/XavierBerger/Solar-Router-for-ESPHome/
    file: solar_router/engine_1switch.yaml
```

