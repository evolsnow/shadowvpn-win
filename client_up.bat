@ECHO off
REM example client up script for windows
REM will be executed when client is up
REM all key value pairs in ShadowVPN config file will be passed to this script
REM as environment variables, except password
echo starting shadowvpn...
REM user-defined variables
REM SET orig_intf="Ethernet"

SET chnroutes="true"
SET remote_tun_ip=10.7.0.1
SET dns_server=8.8.8.8
for /F "tokens=5*" %%i in ('netsh interface ip show interfaces') do set "orig_intf=%%i"

REM exclude remote server in routing table
for /F "tokens=3" %%* in ('route print ^| findstr "\<0.0.0.0\>"') do set "orig_gw=%%*"
route add %server% %orig_gw% metric 5 > NUL

REM configure IP address and MTU of VPN interface
netsh interface ip set interface %orig_intf% ignoredefaultroutes=enabled > NUL
netsh interface ip set address name="%intf%" static %tunip% 255.255.255.0 > NUL
netsh interface ipv4 set subinterface "%intf%" mtu=%mtu% > NUL

REM change dns server
netsh interface ip set dns name="%intf%" static %dns_server% > NUL

REM change routing table
if %chnroutes%=="true" (
    ECHO using split mode
    rundll32.exe cmroute.dll,SetRoutes /STATIC_FILE_NAME addchnroutes.txt /DONT_REQUIRE_URL /IPHLPAPI_ACCESS_DENIED_OK
) else (
    ECHO using global mode
)

REM checking if winxp
    ver | find "5.1" > NUL
        if %ERRORLEVEL%==0 (
            route add 128.0.0.0 mask 128.0.0.0 %remote_tun_ip% metric 6 > NUL
            route add 0.0.0.0 mask 128.0.0.0 %remote_tun_ip% metric 6 > NUL
        ) else (
            netsh interface ipv4 add route 128.0.0.0/1 "%intf%" %remote_tun_ip% metric=6 > NUL
            netsh interface ipv4 add route 0.0.0.0/1 "%intf%" %remote_tun_ip% metric=6 > NUL
        )

REM ECHO default route changed to %remote_tun_ip%

REM ECHO %0 done
echo.
ECHO +++++++++++++++++++++++++++++++++++++
ECHO vpn successfully started !!!
ECHO +++++++++++++++++++++++++++++++++++++
echo.
ECHO press ctrl+c to stop shadowvpn...
