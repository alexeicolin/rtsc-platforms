package platforms.tiva.hw;

module Adc {

    struct Info {
        UInt32 base;
        UInt32 periph;
    };

  instance:
    create(UInt8 idx);

    @DirectCall
    /* const */ Info *getInfo();

  internal:
    struct Instance_State {
        /* const */ Info info;
    };
}
