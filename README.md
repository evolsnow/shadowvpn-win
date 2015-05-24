shadowvpn-win
===

shadowvpn-win is a simple way to run shadowvpn in windows,
you can also build exe package to be more convenient.

It is a port of [ShadowVPN](https://github.com/clowwindy/ShadowVPN) created by [@clowwindy](https://github.com/clowwindy)

Features
---

* support [chnroutes](https://github.com/fivesheep/chnroutes)

* Fast adding thousands of route tables

Usage
---

* Before running ShadowVPN, You need to install the TUN/TAP driver first:
> + For [32-bit Windows](http://build.openvpn.net/downloads/releases/tap-windows-9.9.2_3.exe)
> + For [64-bit Windows](http://build.openvpn.net/downloads/releases/tap-windows-9.21.0.exe)

* After installation, rename the new interface  to 'Tun'

* Download zip file and decompress

* Configure '[client.conf](https://github.com/evollost/shadowvpn-win/blob/master/client.conf)', for more information, look through the this file

* Just double click '[start_vpn.bat](https://github.com/evollost/shadowvpn-win/blob/master/start_vpn.bat)' or run this in cmd:
```bash
shadowvpn.exe -c client.conf
```

* By default shadowvpn runs in chnroutes mode,you can turn back to global mode 
by editing '[client_up.bat](https://github.com/evollost/shadowvpn-win/blob/master/client_up.bat)':
```bash
SET chnroutes="false"
```

* You can also update the chnroutes file by editing .txt files.


License
---

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

You should have received a copy of the GNU General Public License
along with this program. If not, see [GNU](http://www.gnu.org/licenses/)
