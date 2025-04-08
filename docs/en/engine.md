# Solar router engines

An engine is designed to define how many and when energy has to be diverted.

Different kind of engine exists whach can progressively divert energy to a load and manage an ON/OFF switch. See details into engine's dedicated pages.

!!! note "Engine naming"
    The name of engine is reflecting how energy divertion is performed:  
    **Example** : `engine_1dimmer_1bypass` will manage 1 dimmer managing a progressive regulation associated with a bypass relay. 


### User feedback LEDs

The yellow LED is reflecting the network connection:

- ***OFF*** : solar router is not connected to power supply.
- ***ON*** : solar router is connected to the network.
- ***blink*** : solar router is not connected to the network and is trying to reconnect.
- ***fast blink*** : An error occurs during the reading of energy exchanged with the grid.

The green LED is reflecting the actual configuration of regulation:

- ***OFF*** : automatic regulation is deactivated.
- ***ON*** : automatic regulation is active and is not diverting energy to the load.
- ***blink*** : solar router is currently sending energy to the load.

LEDs configuraton are done in engine configuration.