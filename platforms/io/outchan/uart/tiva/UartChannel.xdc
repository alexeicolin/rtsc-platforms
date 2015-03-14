package platforms.io.outchan.uart.tiva;

import platforms.io.outchan.IOutputChannel;

@ModuleStartup
module UartChannel inherits IOutputChannel
{
    /* Same as UART.UART_DataMode, but UART.xdc is weird: when used,
     * it seems to get parsed ok, but fails to compile. */
    enum DataMode {
        DATA_MODE_TEXT,
        DATA_MODE_BINARY
    };

    config UInt sysUartIndex = 0;
    config UInt32 sysUartBaudRate = 115200;

    // Can be the same as sys
    config UInt eventUartIndex = 0;
    config UInt32 eventUartBaudRate = 115200;
    config DataMode eventUartDataMode = DATA_MODE_TEXT;

  internal:
    
    struct Module_State {
        // Note: UART_Handle is not an instance handle but a private typedef
        Void *sysUartPort;
        Void *eventUartPort;
    };
}
