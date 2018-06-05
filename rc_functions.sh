# Author: Zubair Abid
# Usage: Add this to your shell's configuration file (bashrc/zshrc) and use the functions as commands
# Notes: Very unreliable, rather unstable right now and missing a lot of components. Was constructed whileunsetting stuff during vacation, and there's evidently a lot left. Might be abandoned in an incomplete state, but let's hope that doesn't happen
# Refer to Bakhtiyar's and Swetanjal's VPN scripts for working solutions for VPN for now
# https://github.com/bakszero/AutoVPN/
# https://github.com/swetanjal/IIITH-VPN

function setproxy() {
	echo "Configuring proxies for IIIT : ..."

	echo "Setting up env proxy"

	export ALL_PROXY=https://proxy.iiit.ac.in:8080/
	export all_proxy=https://proxy.iiit.ac.in:8080/

	export HTTPS_PROXY=https://proxy.iiit.ac.in:8080/
	export https_proxy=https://proxy.iiit.ac.in:8080/

	export HTTP_PROXY=http://proxy.iiit.ac.in:8080/
	export http_proxy=http://proxy.iiit.ac.in:8080/

	export FTP_PROXY=ftp://proxy.iiit.ac.in:8080/
	export ftp_proxy=ftp://proxy.iiit.ac.in:8080/

	export SOCKS_PROXY=socks://proxy.iiit.ac.in:8080/
	export socks_proxy=socks://proxy.iiit.ac.in:8080/

	echo "Env proxy settings set"


	echo "Setting up git proxy using gitproxy and socat"
	echo '#!/bin/sh' > /usr/bin/gitproxy
	echo '_proxy=proxy.iiit.ac.in' >> /usr/bin/gitproxy
	echo '_proxyport=8080' >> /usr/bin/gitproxy
	echo 'exec socat STDIO PROXY:$_proxy:$1:$2,proxyport=$_proxyport' >> /usr/bin/gitproxy

	echo "Git proxy set"


	echo "Setting up Node proxy"
	npm config set proxy http://proxy.iiit.ac.in:8080
	npm config set https-proxy http://proxy.iiit.ac.in:8080
	echo "Set up Node proxy"	
}

function unsetproxy() {
	unset {all,https,http,ftp,socks}_proxy
	unset {ALL,HTTPS,HTTP,FTP,SOCKS}_PROXY

	echo "Env proxy unset"

	npm config delete proxy
	npm config delete https-proxy

	echo "Node proxy unset"

	echo '' > /usr/bin/gitproxy

	echo "Git proxy unset"


}
