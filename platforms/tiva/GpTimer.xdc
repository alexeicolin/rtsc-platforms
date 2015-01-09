package platforms.tiva;

module GpTimer {

    enum Half {
        Half_A,
        Half_B
        // TODO: suppoort Half_BOTH
    };

    struct Info {
        UInt32 base;
        UInt32 periph;
        UInt32 half;
        UInt32 cfg;
    };

  instance:
    create(UInt8 idx, Half half);

    @DirectCall
    /* const */ Info *getInfo();

  internal:
    struct Instance_State {
        /* const */ Info info;
    };
}
