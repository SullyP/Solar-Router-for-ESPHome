
# engine_1dimmer

This package is implementing the engine of the solar router which determines when and how many energy has to be diverted to the load.

**engine_1dimmer** calls every second the power meter to get the actual energy exchanged with the grid. If energy produce is greater than energy consummed and exceed the define echange target, the engine will determine the **percentage of the regulator "opening"** and adjusts it dynamically to reach the target.

Engine's automatic regulation can be activated or deactivated with the activation switch.

## Router Level vs Regulator Opening

The solar router uses two distinct but related level controls:

- **Router Level**: This is the main system-wide control (0-100%) that represents the overall routing state. It controls the LED indicators and energy counter logic. When automatic regulation is enabled, this level is dynamically adjusted based on power measurements.

- **Regulator Opening**: This represents the actual opening level (0-100%) of the physical regulator. By default, it mirrors the router level since there is only one regulator. While it can be controlled independently, changes to regulator_opening alone won't affect the router_level or trigger LED state changes.

The regulator opening entity is hidden from Home Assistant by default. To expose it, add this to your substitutions:

Note: It's recommended to adjust the router_level rather than regulator_opening directly, as this ensures proper system feedback through LEDs and energy monitoring.

## Configuration

To use this package, add the following lines to your configuration file:

```yaml linenums="1"
packages:
  engine:
    url: https://github.com/XavierBerger/Solar-Router-for-ESPHome/
    file: solar_router/engine_1dimmer.yaml
```

