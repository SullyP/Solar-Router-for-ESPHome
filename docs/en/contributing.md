# Contributing to development

**Solar Router for [ESPHome](http://esphome.io)** is design to be modular to make easy the customisation to various power meters and various regulators.  
You want to contribute? You are welcome and you will find bellow some recommendation to do so.

## Developing a **Hardware**

You can propose any hardware based on your needs. If this new hardware require to use GPIO, the pins used by your hardware have to be configuration into `vars` section of `packages`.

A documentation have be added describing this new hardware and its constraints (Ex: GPIO capabilities). See [update documentation](#update-documentation) chapter bellow.

## Developing a **Software package**

### Setup development environement

To contribute to **Solar Router for ESPHome** and develop a new feature on your computer and propose a *merge request*, you should:

- Fork [**Solar Router for ESPHome** repository](https://github.com/XavierBerger/Solar-Router-for-ESPHome) on Github
- Clone your forked repository on your PC
- Create a development branch starting from **main**
- [Create and activate a Python virtual environment](https://docs.python.org/3/library/venv.html) 
    ```shell
    python -m venv venv
    venv/bin/activate
    ```
- Install ESPHome CLI and other requirements:
    ```shell
    pip install -r requirements.txt
    ``` 
- Install and test your code on you device with `esphome` command line: 
    ```shell
    esphome run my_configuration.yaml
    ```
- Update the code and push update on your repository
- Propose a pull request from your fork to the official repository

### Developping a **Power Meter**

A **Power Meter** is a component designed to provide and periodically update a sensor named `real_power`.

```yaml linenums="1"
sensor:
  # Sensor showing the actual power consumption
  - id: real_power
    platform: template
    name: "Real Power"
    device_class: "power"
    unit_of_measurement: "W"
    update_interval: 1s
```

!!! tip "Tip: See already developped power meter for examples"

This sensor is used by **Engines** to get the value of power exchanged with the grid.

If this new power meter needs specific configuration, required parameters have to be added into `vars` section of `packages`.

A documentation have to be added describing the power meter and how to configure it. See [update documentation](#update-documentation) chapter bellow.

### Developping **Regulator**

A **Regulator** has to manage the percentage of energy sent to its load based on its regulator level sensor (e.g., `regulator_opening` for TRIAC/SSR). Each regulator's level can vary from 0 (where no energy is sent to the load) to 100 (where all possible energy is sent to the load).

The system's overall state is managed by the `router_level` sensor, which controls all regulators. When `router_level` is 0, all regulators should be off, and when it's 100, all regulators should be at maximum. For systems with a single regulator, the regulator's level typically mirrors the `router_level`, but they remain separate as `router_level` is used for LED indicators and energy counting logic.

Here's an example of a regulator implementation (extracted from [regulator_triac.yaml](https://github.com/XavierBerger/Solar-Router-for-ESPHome/blob/main/solar_router/regulator_triac.yaml)) using the `light` component's `brightness` to control energy diversion:

```yaml linenums="1"
script:
  # Apply regulation on triac using light component
  - id: regulation_control
    mode: single
    then:
      # Apply router_level to triac using light component
      - light.turn_on:
          id: dimmer_controller
          brightness: !lambda return id(regulator_opening).state/100.0;
```

!!! tip "Tip: See already developed regulators for examples"

You can develop one or multiple regulators to work together in the same system. Each regulator should:
- Have its own level sensor ranging from 0-100
- Respond to changes in the system-wide `router_level`
- Handle its specific hardware control logic

If this new power meter needs specific configuration, required parameters have to be added into `vars` section of `packages`.

A documentation have to be added describing the power meter and how to configure it. See [update documentation](#update-documentation) chapter bellow.

## Update **Documentation**

Documentation is written using [mkdocs](https://www.mkdocs.org/) and [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/).

To install `mkdocs`, you need to install [Python](https://python.org) and then :

- Create a virtual environment (see [Python documentation](https://docs.python.org/3/library/venv.html)).
- Install the required module with the following command `pip install -r requirements.txt`.

Documentation is stored in `docs` directory. To see you modification in real time in your browser, execute the command `mkdocs serve` and browse [http://127.0.0.1:8000](http://127.0.0.1:8000)

!!! note "Changelog update"
    ChangeLog is only available in officially published [documentation](https://xavierberger.github.io/Solar-Router-for-ESPHome/changelog/).  
    Changelog is updated manually after a new release is published.

    Changelog is generated using `git-cliff`.  
    Version are based on tags.  
    Lines added in changelog are based on *merge commit messages*.

    The script `tools\update_documentation.sh` is designed to update `changelog.md`, generate and publish `mkdocs` documentation on [github pages](https://xavierberger.github.io/Solar-Router-for-ESPHome/).  
    **The script updating the documentation is entented to be used by repository maintainer only.**
