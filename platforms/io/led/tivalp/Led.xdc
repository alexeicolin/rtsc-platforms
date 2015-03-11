package platforms.io.led.tivalp;

module Led {
    metaonly config Any gpioPorts = [
        {port: 'F', pin: 1}, // 0: RED
        {port: 'F', pin: 2}, // 1: BLUE
        {port: 'F', pin: 3}, // 2: GREEN
    ];

    // Indexes into gpioPorts array
    enum Led {
        Led_RED = 0,
        Led_BLUE = 1,
        Led_GREEN = 2
    };
}
