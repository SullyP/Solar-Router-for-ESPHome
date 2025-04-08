# Home Assistant Power Meter

This power meter is designed get power consumption directly from Home Assistant sensor.

To use this package, add the following lines to your configuration file:

```yaml linenums="1"
packages:
  power_meter:
    url: https://github.com/XavierBerger/Solar-Router-for-ESPHome/
    files:
      - name: solar_router/power_meter_home_assistant.yaml
        vars:
          main_power_sensor: sensor.grid_exchange
```

This package needs to know which sensor to use to obtain the energy exchanged with the grid. It is expected that this sensor is in Watts (W), positive (>0) when electricity is consumed from the grid, and negative (<0) when electricity is sent to the grid.

!!! warning "Data availability and refresh rate"
    This power meter rely on Home Assistant to gather the value of energy exchanged with the grid. It also depends on the rate of sensor update. If a sensor is updated too slowly, the regulation may not work as expected.

    Contrary to Home Assistant power meter, native power meters are autonomous and can continue to regulate even is Home Assistant is offline. Some power meter can have a direct access to the measure and may even be independent to the network.
