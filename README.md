Intro
=====

Hardware attributes and other platform support for use from RTSC modules.

Dependencies
============

  * [XDCTools](http://downloads.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/rtsc/)
    >= 3.30

The `build-env.sh` script shows environment variables that need to be pointed
to the installation paths. The script can be modified and sourced:

    $ . build-env.sh

Build
=====

    $ xdc all -PR .
