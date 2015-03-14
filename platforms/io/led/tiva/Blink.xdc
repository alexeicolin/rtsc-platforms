package platforms.io.led.tiva;

module Blink {
    metaonly config UInt32 blinkTickPeriodMs = 500;

    Void blinkLed(UInt led, UInt32 rate);

  internal:

    struct LedState {
        Bool on;
        UInt32 blinkRate;
    };

    struct Module_State {
        LedState ledState[length];
        UInt32 blinkTicks;
    };
}
