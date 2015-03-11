function module$meta$init()
{
    var Led = xdc.useModule('platforms.io.led.tiva.Led');
    Led.gpioPorts = this.gpioPorts;
}
