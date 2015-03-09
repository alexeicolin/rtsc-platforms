package platforms.hw.tiva;

module UartPort {
    metaonly readonly config UInt NUM_PORTS = 2;

    // Human-readable map used in constructing UartPort state (datasheet p892)
    metaonly readonly config Any uartGpioPorts = [
        {letter: 'A', rxPin: 0, txPin: 1}, // UART 0
        {letter: 'B', rxPin: 0, txPin: 1}, // UART 1
        {letter: 'D', rxPin: 6, txPin: 7}, // UART 2
        {letter: 'C', rxPin: 6, txPin: 7}, // UART 3
        {letter: 'C', rxPin: 4, txPin: 5}, // UART 4
        {letter: 'E', rxPin: 4, txPin: 5}, // UART 5
        {letter: 'D', rxPin: 4, txPin: 5}, // UART 6
        {letter: 'E', rxPin: 0, txPin: 1}, // UART 7
    ];

    struct Info {
        UInt32 base;
        UInt32 periph;
        UInt32 intNum;
        GpioPort.Handle txPin;
        GpioPort.Handle rxPin;
        UInt32 pinAssignRx;
        UInt32 pinAssignTx;
        UInt32 udmaChanTx;
        UInt32 udmaChanRx;
    };

  instance:
    create(UInt portIdx);

    @DirectCall
    /* const */ Info *getInfo();

  internal:

    struct Instance_State {
        /* const */ Info info;
    };
}
