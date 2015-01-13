var PlatformInfo;
var GpioPort;

function module$meta$init()
{
    PlatformInfo = xdc.useModule('platforms.tiva.hw.PlatformInfo');
    GpioPort = xdc.useModule('platforms.tiva.hw.GpioPort');
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
        intNum:      PlatformInfo['INT_UART' + portIdx],
        udmaChanTx:  PlatformInfo['UDMA_CHANNEL_UART' + portIdx + 'TX'],
        udmaChanRx:  PlatformInfo['UDMA_CHANNEL_UART' + portIdx + 'RX'],
        rxPin: GpioPort.create(gpioPort.letter, gpioPort.rxPin),
        txPin: GpioPort.create(gpioPort.letter, gpioPort.txPin),
        pinAssignRx: PlatformInfo['GPIO_P' + gpioPort.letter + gpioPort.rxPin +
                                  '_U' + portIdx + 'RX'],
        pinAssignTx: PlatformInfo['GPIO_P' + gpioPort.letter + gpioPort.txPin +
                                  '_U' + portIdx + 'TX'],
    };
}
