#!/bin/bash

# Paths to build dependencies
#
# Here most point to the bundle in TI-RTOS, but most are also available as
# independent distributions (see README.md for links)

XDCTOOLS_PATH="/opt/ti/xdctools/xdctools_3_30_04_52_core"

# Append only if it's not there already
if ! echo $PATH | grep -q $XDCTOOLS_PATH
then
    export PATH=$PATH:$XDCTOOLS_PATH
fi

TIRTOS_DIR="/opt/ti/tirtos/tirtos_tivac_2_00_01_23"
BIOS_DIR="$TIRTOS_DIR/products/bios_6_40_01_15"

# gnu.targets.*
unset XDCPATH
XDCPATH="$BIOS_DIR/packages"
XDCPATH="$XDCPATH;$TIRTOS_DIR/packages"

export XDCPATH

export TIVAWARE_INSTALLATION_DIR="$TIRTOS_DIR/products/TivaWare_C_Series-2.1.0.12573c"
