package platforms.io.led.tiva;

import platforms.hw.tiva.GpioPort;

@ModuleStartup
module Led {
    config UInt32 pulseDelayIters = 100000;


    Void setLed(UInt led, Bool on);
    Void pulseLed(UInt led);

    metaonly config Any gpioPorts;

  internal:

    struct Module_State {
        GpioPort.Handle gpioPorts[length];
    };
}
