@ECHO off
REM example client down script for windows
REM will be executed when client is down

REM all key value pairs in ShadowVPN config file will be passed to this script
REM as environment variables, except password

REM user-defined variables
SET remote_tun_ip=10.7.0.1
REM SET orig_intf="Ethernet"
FOR /F "tokens=5*" %%i IN ('netsh interface ip show interfaces') DO set orig_intf=%%i
REM revert ip settings
netsh interface ip set interface %orig_intf% ignoredefaultroutes=disabled > NUL
netsh interface ip set address name="%intf%" dhcp > NUL

REM revert routing table
echo.
ECHO stopping...
route delete 0.0.0.0 mask 128.0.0.0 %remote_tun_ip% > NUL
route delete 128.0.0.0 mask 128.0.0.0 %remote_tun_ip% > NUL
route delete %server% > NUL

rundll32.exe cmroute.dll,SetRoutes /STATIC_FILE_NAME delchnroutes.txt /DONT_REQUIRE_URL /IPHLPAPI_ACCESS_DENIED_OK

REM revert dns server
netsh interface ip set dns name="%intf%" source=dhcp > NUL

REM ECHO %0 done