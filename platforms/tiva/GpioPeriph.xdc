package platforms.tiva;

module GpioPeriph {

    struct Info {
        UInt32 periph;
        UInt32 base;
    };

  instance:
    create(/* Char */ String portLetter);

    @DirectCall
    /* const */ Info *getInfo();

  internal:
    struct Instance_State {
        /* const */ Info info;
    };
}
