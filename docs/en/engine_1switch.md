
# engine_1switch

This package is implementing the engine of the solar router which determines energy can be diverted to a local load or not.

**engine_1switch** calls every second the power meter to get the actual power consumed. If energy sent to the grid is greater than the divertion start level (in W) during start tempo (in s), the relay is closed to use the energy locally. When the energy sent to the grid reach the level (in W) defined to stop the divertion during stop tempo (in s), the relay is openned and local consomption is stopped.

engine_1switch's automatic regulation can be activated or deactivated with the activation switch.

The following schema is representing the consumption with this engine activated:

![engine_1switch](images/engine_1switch.png)

**Legend:**

 * Green: Energy consummed coming from solar pannel (self consumption)
 * Yellow: Energy sent to the grid
 * Red: Energy consummed coming from the grid

**How does it work?**

* **①** The yellow part of the graph is showing the start level. When the energy send to the grid reach the start level, energy is diverted locally.
* **②** The yellow part of the graph is showing the stop level. In this example 0W.

!!! Danger "Carefully set the start and stop levels"
    The start level has to be greater than the power of the load plugged to the solar router. If not, as soon as the energy will be diverted to the load, the stop level will be reached and you will see the router switching between ON and OFF (based on temporisation you defined).

!!! tips "finely adjust start and stop tempo"
    The start and stop tempo determine the responsiveness of the regulation. These delays must be finely adjusted to avoid oscillations. For example, if you have an electric stove, pay attention to the heating delays.

## Configuration

To use this package, add the following lines to your configuration file:

```yaml linenums="1"
packages:
  engine:
    url: https://github.com/XavierBerger/Solar-Router-for-ESPHome/
    files:
      - name: solar_router/engine_1switch.yaml
        vars:
          green_led_pin: GPIO19
          yellow_led_pin: GPIO18
```

When this package is used it is required to define `green_led_pin` and `green_led_pin` in `vars` section as show in the upper example.

