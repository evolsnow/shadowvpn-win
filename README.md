shadowvpn-win
=========

shadowvpn-win is a simple way to run shadowvpn in windows, 
you can also build exe package to be more convenient.

It is a port of [ShadowVPN] created by [@clowwindy](https://github.com/clowwindy)

#### Features
----

1. support [chnroutes] 
2. Fast adding thousands of route tables

#### Usage
----
- 1.Before running ShadowVPN, You need to install the TUN/TAP driver first:
- - For [32-bit Windows]
- - For [64-bit Windows]
- 2.After installation, rename the new interface name to 'Tun'
- 3. Download zip file and decompress
- 4. configure client.conf, for more information, look through the conf file
- 5. Run this in cmd:
shadowvpn.exe -c client.conf
or just double click 'start_vpn.bat'
- 4. By default shadowvpn runs in chnroutes mode,you can turn back to global mode 
by editing client_up.bat:
SET chnroutes="false"
- 5. You can also update the chnroutes file by editing .txt files.


#### License
----

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program. If not, see [GNU LICENSES]

[ShadowVPN]:        https://github.com/clowwindy/ShadowVPN
[chnroutes]:        https://github.com/fivesheep/chnroutes
[32-bit Windows]:   http://build.openvpn.net/downloads/releases/tap-windows-9.9.2_3.exe
[64-bit Windows]:   http://build.openvpn.net/downloads/releases/tap-windows-9.21.0.exe
[GNU LICENSES]:     http://www.gnu.org/licenses/