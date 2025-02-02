# Mecanical Relay Regulator

This regulator is performing an **All or Nothing Regulation**.

![alt text](images/Regulation_on_off.png)

A relay is able to let current pass to the load or not. 

The following schematic is representing the wiring of the relay:

![relay](images/mecanical_relay.drawio.png)

!!! Warning "Be carefull during wiring and use the Normally Open (NO) pin."

!!! Danger "WARNING : This kind of relay is not compatible with progressive engine. Only use it [engine ON/OFF](engine_on_off.md)"

To use this package, add the following lines to your configuration file:

```yaml linenums="1"
packages:
  relay_regulator:
    url: https://github.com/XavierBerger/Solar-Router-for-ESPHome/
    file: solar_router/regulator_mecanical_relay.yaml
```

This package require the definition of pin connected to the gate of the relay : `relay_regulator_gate_pin`

```yaml linenums="1"
substitutions:
  # Regulator configuration ------------------------------------------------------
  # Define GPIO pin connected to the relay gate.
  relay_regulator_gate_pin: GPIO22
```
