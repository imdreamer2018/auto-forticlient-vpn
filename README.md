# Auto Connect FortiClient VPN
Using shell script to auto connect or disconnect FortiClient VPN, instead of using FortiClient GUI.\
This script is for macOS only, please insure you have installed [homebrew](https://brew.sh/), if not, please install it first.
![Streamlit Date Picker](https://github.com/imdreamer2018/auto-forticlient-vpn/blob/master/images/readme.jpg)

## Dependency Install
```shell
1.sudo sh install-dependency.sh
2.sudo sh install-config.sh
```
## Usage
```shell
# connect
sh connect-forticlient-vpn.sh your_token

#disconnect
sh disconnect-forticlient-vpn.sh
```

## Install with Raycast
1. Completed Dependency Install
2. Install [Raycast](https://raycast.com/)
3. Command + , -> Extensions -> Add Extension(Command + N) -> Add Script Directory -> Install

## Usage with Raycast
### Open FortiClient VPN
Open Raycast with Command + Space -> search "Connect FortiClient VPN" -> Enter your token 
### Disconnect FortiClient VPN
Open Raycast with Command + Space -> search "Disconnect FortiClient VPN"