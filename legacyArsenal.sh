#!/bin/bash
# Check if the script is run with root privileges
if [ "$(id -u)" -ne "0" ]; then
    echo "This script must be run as root. Use 'sudo'."
    exit 1
fi

mkdir -p ~/Desktop/Tools
mkdir ~/.gf
cd ~/Desktop/Tools

echo "Updating package list and upgrading installed packages..."
apt update && apt upgrade -y && apt full-upgrade -y

echo "Installing necessary packages..."
apt-get install -y software-properties-common unzip wget make python3-pip build-essential git ruby-full python3 libpcap-dev cargo dotnet-host netstandard-targeting-pack-2.1 sublist3r assetfinder altdns dirsearch feroxbuster ffuf gobuster dirb dirbuster nmap nikto massdns wpscan dnsrecon jq amass screen ruby
pip3 install arjun corscanner --break-system-packages

echo "Adding Go PPA and installing Go..."
add-apt-repository -y ppa:longsleep/golang-backports
apt update
apt install -y golang-go

echo "export GOPATH=$HOME/go" >> ~/.bashrc
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin:/root/go/bin:/$HOME/go/bin
echo "export PATH=\$PATH:/usr/local/go/bin:\$GOPATH/bin:/root/go/bin:/$HOME/go/bin" >> ~/.bashrc
source ~/.bashrc

mkdir -p ~/Desktop/tools
cd ~/Desktop/tools

echo "Installing pdtm..."
go install -v github.com/projectdiscovery/pdtm/cmd/pdtm@latest
pdtm -ia

wget -q https://github.com/assetnote/kiterunner/releases/download/v1.0.2/kiterunner_1.0.2_linux_amd64.tar.gz
tar -xvzf kiterunner_1.0.2_linux_amd64.tar.gz
cp kr /usr/bin

git clone https://github.com/guelfoweb/knock.git
cd knock
pip install . --break-system-packages
cd ..

git clone https://github.com/GerbenJavado/LinkFinder.git
cd LinkFinder
pip3 install -r requirements.txt --break-system-packages
python setup.py install
cd ..

git clone https://github.com/gwen001/related-domains
cd related-domains
pip3 install -r requirements.txt --break-system-packages
cd ..

git clone https://github.com/blechschmidt/massdns
cd massdns
make
cp massdns /usr/bin
cd ..

git clone https://github.com/devanshbatham/FavFreak
cd FavFreak
pip3 install -r requirements.txt --break-system-packages
cd ..

git clone https://github.com/m4ll0k/SecretFinder
cd SecretFinder
pip3 install -r requirements.txt --break-system-packages
cd ..

git clone https://github.com/devanshbatham/ParamSpider
cd ParamSpider
pip3 install -r requirements.txt --break-system-packages
cd ..

git clone https://github.com/maurosoria/dirsearch
cd dirsearch
pip3 install -r requirements.txt --break-system-packages
cd ..

git clone https://github.com/ozguralp/gmapsapiscanner
cd gmapsapiscanner
pip3 install -r requirements.txt --break-system-packages
cd ..

git clone https://github.com/1ndianl33t/Gf-Patterns

go get -u -v github.com/projectdiscovery/shuffledns/cmd/shuffledns
go get -u -v github.com/projectdiscovery/dnsprobe
go get github.com/Ice3man543/SubOver
go get -u github.com/tomnomnom/gf
go get -u github.com/tomnomnom/assetfinder
go get -u -v github.com/projectdiscovery/naabu/v2/cmd/naabu
go get github.com/tomnomnom/hacks/waybackurls
go get -u -v github.com/lukasikic/subzy
go install -v github.com/lukasikic/subzy
go get -u -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei
go get github.com/haccer/subjack
GO111MODULE=on go get -u -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder
GO111MODULE=on go get -v github.com/projectdiscovery/chaos-client/cmd/chaos
go get -u -v github.com/hahwul/dalfox
go get -u -v github.com/lc/gau
go get github.com/Emoe/kxss
go install github.com/vodafon/waybackrobots@latest
go get -u github.com/vodafon/waybackrobots
GO111MODULE=on go get -u -v github.com/lc/subjs
go get github.com/hakluke/hakcheckurl
go get github.com/hakluke/hakrawler
go get github.com/hakluke/hakrevdns
go install -v github.com/projectdiscovery/notify/cmd/notify@latest
go install github.com/edoardottt/csprecon/cmd/csprecon@latest
go install github.com/shenwei356/rush@latest
go get -u github.com/lc/cspparse
go install github.com/lc/gau/v2/cmd/gau@latest
go install -v github.com/mhmdiaa/second-order@latest
go get -u github.com/iamstoxe/urlgrab
go get -u github.com/c-sto/recursebuster
go install -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest
go install github.com/tomnomnom/httprobe@latest
go install github.com/utkusen/socialhunter@latest
go install github.com/003random/getJS/v2@latest
go install -v github.com/projectdiscovery/shuffledns/cmd/shuffledns@latest
go install -v github.com/j3ssie/osmedeus@latest
go install github.com/Josue87/gotator@latest
go install github.com/hakluke/hakrawler@latest
go install github.com/0xsha/GoLinkFinder@latest
go install -v github.com/projectdiscovery/uncover/cmd/uncover@latest
GO111MODULE=on go install github.com/dwisiswant0/crlfuzz/cmd/crlfuzz@latest
go install github.com/tomnomnom/meg@latest
go install github.com/tomnomnom/waybackurls@latest
GO111MODULE=on go install github.com/jaeles-project/gospider@latest
go install -v github.com/PentestPad/subzy@latest
go install github.com/channyein1337/jsleak@latest
go install -v github.com/projectdiscovery/dnsx/cmd/dnsx@latest
go get -u github.com/tomnomnom/assetfinder
go install github.com/OJ/gobuster/v3@latest
go install -v github.com/edoardottt/scilla/cmd/scilla@latest
go install github.com/projectdiscovery/alterx/cmd/alterx@latest
go install -v github.com/projectdiscovery/dnsx/cmd/dnsx@latest
go install -v github.com/tomnomnom/anew@latest
go install github.com/projectdiscovery/asnmap/cmd/asnmap@latest
go install -v github.com/projectdiscovery/mapcidr/cmd/mapcidr@latest
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install github.com/d3mondev/puredns/v2@latest
go install -v github.com/owasp-amass/amass/v4/...@master
go install -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
go install github.com/projectdiscovery/katana/cmd/katana@latest
go install github.com/tomnomnom/waybackurls@latest
go install github.com/hahwul/dalfox/v2@latest
go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest
GO111MODULE=on go get -u -v github.com/lc/subjs@latest
go install github.com/gwen001/gitlab-subdomains@latest

source ~/.bashrc
echo "All tools have been installed successfully!"
