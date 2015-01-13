package platforms.tiva.hw;

module GpioPort {

    struct Info {
        GpioPeriph.Handle periph;
        UInt8 pin;
    };

  instance:
    create(/* Char */ String portLetter, UInt8 pin);

    @DirectCall
    /* const */ Info *getInfo();

  internal:
    struct Instance_State {
        /* const */ Info info;
    };
}
