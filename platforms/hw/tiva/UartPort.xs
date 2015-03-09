var HwAttrs;
var GpioPort;

function module$meta$init()
{
    HwAttrs = xdc.useModule('platforms.hw.tiva.HwAttrs');
    GpioPort = xdc.useModule('platforms.hw.tiva.GpioPort');
}

function instance$static$init(obj, portIdx, params, mod)
{
    if (portIdx < 0 || portIdx >= mod.NUM_PORTS)
        throw "Port index (" + portIdx + ") " +
              "is outside of range of number of ports (" + mod.NUM_PORTS + ")";

    var gpioPort = mod.uartGpioPorts[portIdx];
    obj.info = {
        base:        HwAttrs['UART' + portIdx + '_BASE'],
        periph:      HwAttrs['SYSCTL_PERIPH_UART' + portIdx],
        intNum:      HwAttrs['INT_UART' + portIdx],
        udmaChanTx:  HwAttrs['UDMA_CHANNEL_UART' + portIdx + 'TX'],
        udmaChanRx:  HwAttrs['UDMA_CHANNEL_UART' + portIdx + 'RX'],
        rxPin: GpioPort.create(gpioPort.letter, gpioPort.rxPin),
        txPin: GpioPort.create(gpioPort.letter, gpioPort.txPin),
        pinAssignRx: HwAttrs['GPIO_P' + gpioPort.letter + gpioPort.rxPin +
                                  '_U' + portIdx + 'RX'],
        pinAssignTx: HwAttrs['GPIO_P' + gpioPort.letter + gpioPort.txPin +
                                  '_U' + portIdx + 'TX'],
    };
}
