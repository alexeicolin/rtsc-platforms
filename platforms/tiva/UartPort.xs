var PlatformInfo;

function module$meta$init()
{
    PlatformInfo = xdc.useModule('platforms.tiva.PlatformInfo');
}

function instance$static$init(obj, portIdx, params, mod)
{
    if (portIdx < 0 || portIdx >= mod.NUM_PORTS)
        throw "Port index (" + portIdx + ") " +
              "is outside of range of number of ports (" + mod.NUM_PORTS + ")";

    var gpioPort = mod.uartGpioPorts[portIdx];
    obj.info = {
        base:        PlatformInfo['UART' + portIdx + '_BASE'],
        periph:      PlatformInfo['SYSCTL_PERIPH_UART' + portIdx],
        udmaChanTx:  PlatformInfo['UDMA_CHANNEL_UART' + portIdx + 'TX'],
        udmaChanRx:  PlatformInfo['UDMA_CHANNEL_UART' + portIdx + 'RX'],
        gpioPeriph:  PlatformInfo['SYSCTL_PERIPH_GPIO' + gpioPort.letter],
        gpioBase:    PlatformInfo['GPIO_PORT' + gpioPort.letter + '_BASE'],
        gpioPins:    (PlatformInfo['GPIO_PIN_' + gpioPort.txPin] |
                      PlatformInfo['GPIO_PIN_' + gpioPort.rxPin]),
        pinAssignRx: PlatformInfo['GPIO_P' + gpioPort.letter + gpioPort.rxPin +
                                  '_U' + portIdx + 'RX'],
        pinAssignTx: PlatformInfo['GPIO_P' + gpioPort.letter + gpioPort.txPin +
                                  '_U' + portIdx + 'TX'],
    };
}
