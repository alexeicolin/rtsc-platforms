package platforms.tiva;

module AdcSeq {

    struct Info {
        Void *dataAddr;
        UInt32 dmaInt;
        UInt32 dmaChanNum;
        UInt32 dmaChanAssign;
    };

    // TODO: add max-sequence length info

  instance:
    create(UInt8 adcIdx, UInt8 seqIdx);

    @DirectCall
    /* const */ Info *getInfo();

  internal:
    struct Instance_State {
        /* const */ Info info;
    };
}
