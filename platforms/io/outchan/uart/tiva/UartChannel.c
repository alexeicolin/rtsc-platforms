#include <xdc/std.h>
#include <xdc/runtime/System.h>
#include <xdc/runtime/Startup.h>

#include <ti/drivers/UART.h>
#include <ti/drivers/uart/UARTTiva.h>

/* TivaWare */
#include <inc/hw_memmap.h>
#include <inc/hw_types.h>
#include <inc/hw_ints.h>
#include <inc/hw_gpio.h>

#include <driverlib/gpio.h>
#include <driverlib/sysctl.h>
#include <driverlib/pin_map.h>

#include "package/internal/UartChannel.xdc.h"

#define UART_COUNT 2

/* UART objects */
static UARTTiva_Object uartTivaObjects[UART_COUNT];

/* UART configuration structure */
static const UARTTiva_HWAttrs uartTivaHWAttrs[UART_COUNT] = {
    {UART0_BASE, INT_UART0}, /* EK_TM4C123GXL_UART0 */
    {UART1_BASE, INT_UART1}, /* EK_TM4C123GXL_UART1 */
};

/* Defining this is part of ti.drivers.UART interface */
const UART_Config UART_config[] = {
    {
        &UARTTiva_fxnTable,
        &uartTivaObjects[0],
        &uartTivaHWAttrs[0]
    },
    {
        &UARTTiva_fxnTable,
        &uartTivaObjects[1],
        &uartTivaHWAttrs[1]
    },
    {NULL, NULL, NULL}
};

Int UartChannel_Module_startup(Int state) {
    UART_Params uartParams;

    /* Initialize peripherals */

    SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOA);

    /* Enable and configure the peripherals used by the uart. */
    SysCtlPeripheralEnable(SYSCTL_PERIPH_UART0);
    SysCtlPeripheralSleepEnable(SYSCTL_PERIPH_UART0);
    SysCtlPeripheralDeepSleepEnable(SYSCTL_PERIPH_UART0);

    GPIOPinConfigure(GPIO_PA0_U0RX);
    GPIOPinConfigure(GPIO_PA1_U0TX);
    GPIOPinTypeUART(GPIO_PORTA_BASE, GPIO_PIN_0 | GPIO_PIN_1);

    /* Event UART */
    SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOB);
    SysCtlPeripheralEnable(SYSCTL_PERIPH_UART1);
    SysCtlPeripheralSleepEnable(SYSCTL_PERIPH_UART1);
    SysCtlPeripheralDeepSleepEnable(SYSCTL_PERIPH_UART1);
    GPIOPinConfigure(GPIO_PB0_U1RX);
    GPIOPinConfigure(GPIO_PB1_U1TX);
    GPIOPinTypeUART(GPIO_PORTB_BASE, GPIO_PIN_0 | GPIO_PIN_1);

    /* Initialize the UART driver */
    UART_init();

    /* Open ports */

    UART_Params_init(&uartParams);
    uartParams.baudRate = UartChannel_sysUartBaudRate;
    uartParams.readEcho = UART_ECHO_OFF;
    uartParams.writeDataMode = UART_DATA_TEXT;
    module->sysUartPort = UART_open(UartChannel_sysUartIndex, &uartParams);

    if (!module->sysUartPort)
        System_abort("Failed to open sys UART\n");

    if (UartChannel_eventUartIndex == UartChannel_sysUartIndex) {
        module->eventUartPort = module->sysUartPort;
    } else {

        UART_Params_init(&uartParams);
        uartParams.baudRate = UartChannel_eventUartBaudRate;
        uartParams.readEcho = UART_ECHO_OFF;

        /* This should be done statically, but, UART.xdc is weird:
         * it doesn't compile when used. */
        switch (UartChannel_eventUartDataMode) {
            case UartChannel_DATA_MODE_TEXT:
                uartParams.writeDataMode = UART_DATA_TEXT;
                break;
            case UartChannel_DATA_MODE_BINARY:
                uartParams.writeDataMode = UART_DATA_BINARY;
                break;
            default:
                System_abort("Invalid UART data mode\n");
        }

        module->eventUartPort = UART_open(UartChannel_eventUartIndex, &uartParams);

        if (!module->eventUartPort)
            System_abort("Failed to open event UART\n");
    }

    return Startup_DONE;
}

Void UartChannel_outputStdOut(const Char *buf, Int size) {
    if (UartChannel_Module_startupDone())
        UART_writePolling(module->sysUartPort, buf, size);
}

Void UartChannel_outputEventLog(const Char *buf, Int size) {
    if (UartChannel_Module_startupDone())
        UART_writePolling(module->eventUartPort, buf, size);
}
