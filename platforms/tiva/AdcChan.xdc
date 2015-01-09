package platforms.tiva;

import platforms.tiva.GpioPort;

module AdcChan {

    enum Type {
        Type_ANALOG,
        Type_TEMPERATURE
    };

    struct Info {
        Type type;
        UInt32 ctlValue;
        GpioPort.Handle gpioPort;
    };

    // Map: ADC channel -> GPIO port, pin (datasheet p798)
    metaonly readonly config Any gpioPorts[] = [
         {port: 'E', pin: 3}, // CH 0
         {port: 'E', pin: 2}, // CH 1
         {port: 'E', pin: 1}, // CH 2
         {port: 'E', pin: 0}, // CH 3
         {port: 'D', pin: 3}, // CH 4
         {port: 'D', pin: 2}, // CH 5
         {port: 'D', pin: 1}, // CH 6
         {port: 'D', pin: 0}, // CH 7
         {port: 'E', pin: 5}, // CH 8
         {port: 'E', pin: 4}, // CH 9
         {port: 'B', pin: 4}, // CH 10
         {port: 'B', pin: 5}, // CH 11
    ];

  instance:
    create(Type type, UInt8 idx);

    @DirectCall
    /* const */ Info *getInfo();

  internal:
    struct Instance_State {
        /* const */ Info info;
    };
}
