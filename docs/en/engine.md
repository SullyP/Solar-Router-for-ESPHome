# Solar router engine

An engine is designed to define how many and when energy has to be diverted.

Different kind of engine exists whach can progressively divert energy to a load and manage an ON/OFF switch.


### User feedback LEDS

The yellow LED is reflecting the network connection:

- ***OFF*** : solar router is not connected to power supply.
- ***ON*** : solar router is connected to the network.
- ***blink*** : solar router is not connected to the network and is trying to reconnect.
- ***fast blink*** : An error occurs during the reading of energy exchanged with the grid.

The green LED is reflecting the actual configuration of regulation:

- ***OFF*** : automatic regulation is deactivated.
- ***ON*** : automatic regulation is active and is not diverting energy to the load.
- ***blink*** : solar router is currently sending energy to the load.

The configuration of LED are performed on `substitution` section as show in the example bellow:

```yaml linenums="1"
substitutions:
  # LEDs -------------------------------------------------------------------------
  # Green LED is reflecting regulation status
  # Yellow LED is reflecting power meter status
  green_led_pin: GPIO19
  yellow_led_pin: GPIO18
```