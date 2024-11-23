#!/bin/bash

# Check if the script is run with root privileges
if [ "$(id -u)" -ne "0" ]; then
    echo "This script must be run as root. Use 'sudo'."
    exit 1
fi

# Create necessary directories
mkdir -p /mnt/CyberSecurity/bugHunting/Tools  /mnt/CyberSecurity/bugHunting/templates /mnt/CyberSecurity/bugHunting/wordlist /mnt/CyberSecurity/bugHunting/gf
cd /mnt/CyberSecurity/bugHunting/Tools

# Update and upgrade installed packages
echo "Updating package list and upgrading installed packages..."
apt update && apt upgrade -y && apt full-upgrade -y

# Install necessary packages
echo "Installing necessary packages..."
apt-get install -y software-properties-common unzip wget make python3-pip build-essential git ruby-full python3 libpcap-dev cargo dotnet-host netstandard-targeting-pack-2.1 sublist3r assetfinder altdns dirsearch feroxbuster ffuf gobuster dirb dirbuster nmap nikto massdns wpscan dnsrecon jq amass screen ruby  tmux wfuzz ripgrep sqlmap python3-shodan gem   masscan npm 

gem install wpscan

# Additional pip installations
pip3 install arjun corscanner droopescan --break-system-packages

# Add Go PPA and install Go
echo "Adding Go PPA and installing Go..."
apt update
apt install -y golang-go

# Set environment variables for Go
echo "export GOPATH=$HOME/go" >> ~/.zshrc
echo "export PATH=\$PATH:/usr/local/go/bin:\$GOPATH/bin:$HOME/go/bin:/root/go/bin" >> ~/.zshrc
source ~/.zshrc

# Install pdtm
echo "Installing pdtm..."
go install -v github.com/projectdiscovery/pdtm/cmd/pdtm@latest
pdtm -ia

export CENSYS_API_ID="apiId" && export CENSYS_API_SECRET="apisecret"
# Install kiterunner
echo "Installing kiterunner..."
mkdir kiterunner
cd kiterunner
wget -q https://github.com/assetnote/kiterunner/releases/download/v1.0.2/kiterunner_1.0.2_linux_amd64.tar.gz
tar -xvzf kiterunner_1.0.2_linux_amd64.tar.gz
cp kr /usr/bin
cd ..
mkdir findomain
cd findomain
curl -LO https://github.com/findomain/findomain/releases/latest/download/findomain-linux-i386.zip 
unzip findomain-linux-i386.zip 
chmod +x findomain 
cp findomain /usr/bin/ 
chmod  +x /usr/bin/findomain 
cd ..
wget https://github.com/guelfoweb/knock/archive/refs/tags/5.4.0.zip 
unzip 5.4.0.zip 
cd knock-5.4.0
python3 setup.py install
knockpy --set apikeyirustotal=apikey
cd .. 

wget https://github.com/s0md3v/uro/archive/refs/tags/1.0.0-beta.zip
unzip 1.0.0-beta.zip  
cd uro-1.0.0-beta 
python3 setup.py install 
cp -r  uro /usr/bin
cd ..  

git clone https://github.com/bp0lr/gauplus.git 
cd gauplus 
go build 
mv gauplus /usr/local/bin/ 
cd .. 

mkdir x8
cd x8
wget https://github.com/mrco24/x8/raw/main/x8 
chmod +x x8 
mv x8 /usr/local/bin/x8
cd ..

mkdir nix
cd nix
curl -sL https://raw.githubusercontent.com/epi052/feroxbuster/master/install-nix.sh | bash
cd ..

mkdir unimap
cd unimap
wget -N -c https://github.com/Edu4rdSHL/unimap/releases/download/0.5.1/unimap-linux 
mv unimap-linux /usr/local/bin/unimap 
chmod 755 /usr/local/bin/unimap 
strip -s /usr/local/bin/unimap
cd ..

git clone https://github.com/takshal/freq.git 
cd freq 
mv main.go freq.go 
go build freq.go 
cp freq /usr/bin
cd ..  

mkdir jaeles
cd jaeles
wget https://github.com/jaeles-project/jaeles/releases/download/beta0.17/jaeles0.17-linux.zip  
unzip jaeles0.17-linux.zip  
mv jaeles /usr/local/bin/
cd ..



# Clone and install tools from GitHub with a loop
tools_to_install=(
    "GerbenJavado/LinkFinder"
    "gwen001/related-domains"
    "devanshbatham/FavFreak"
    "devanshbatham/ParamSpider"
    "0ang3el/aem-hacker.git"
    "americanexpress/earlybird.git"
    "ozguralp/gmapsapiscanner"
    "anshumanpattnaik/http-request-smuggling.git "
    "codingo/Interlace.git"
    "codingo/NoSQLMap.git"
    "dark-warlord14/JSScanner"
    "devanshbatham/paramspider"
    "Ekultek/WhatWaf.git"
    "epinna/tplmap.git"
    "faiyazahmad07/xss_vibes.git"
    "gokulapap/wappalyzer-cli"
    "hisxo/gitGraber.git"
    "m4ll0k/SecretFinder.git"
    "obheda12/GitDorker.git"
    "r0075h3ll/Oralyzer.git"
    "r0oth3x49/ghauri.git"
    "s0md3v/XSStrike"
    "securing/DumpsterDiver.git"
    "swisskyrepo/SSRFmap"
    "tarunkant/Gopherus.git"
    "tr0uble-mAker/POC-bomber.git"
    "UnaPibaGeek/ctfr.git"
    "s0md3v/Arjun.git"
    "joda32/CertCrunchy.git"
    "joda32/CertCrunchy.git"
    "christophetd/censys-subdomain-finder.git"
    
    
    
    
    
    
    
)

for tool in "${tools_to_install[@]}"; do
    git clone https://github.com/"${tool}".git
    tool_name=$(basename "$tool")
    cd "$tool_name"
    if [ -f requirements.txt ]; then
        pip3 install -r requirements.txt --break-system-packages
    fi
    if [ -f setup.py ]; then
        python3 setup.py install
    fi
    
    if [ -f build.sh ];then
    	./build.sh
    fi
    
    if [ -f install.sh ];then
    	chmod +x install.sh
    	./install.sh
    fi
    
    if [ -f setup.sh ];then
    	./setup.sh
    fi
    
    
    cd ..
done

# Install additional Go tools
go_tools=(
	"github.com/003random/getJS"
	"github.com/003random/getJS/v2"
	"github.com/0xsha/GoLinkFinder"
	"github.com/Emoe/kxss"
	"github.com/Ice3man543/SubOver"
	"github.com/Josue87/gotator"
	"github.com/KathanP19/Gxss"
	"github.com/LukaSikic/subzy"
	"github.com/MrEmpy/mantra"
	"github.com/OJ/gobuster/v3"
	"github.com/bp0lr/gauplus"
	"github.com/c-sto/recursebuster"
	"github.com/c3l3si4n/quickcert@HEAD"
	"github.com/cgboal/sonarsearch/cmd/crobat"
	"github.com/channyein1337/jsleak"
	"github.com/cheggaaa/pb/v3"
	"github.com/d3mondev/puredns/v2"
	"github.com/dwisiswant0/cf-check"
	"github.com/dwisiswant0/crlfuzz/cmd/crlfuzz"
	"github.com/dwisiswant0/galer"
	"github.com/edoardottt/csprecon/cmd/csprecon"
	"github.com/edoardottt/scilla/cmd/scilla"
	"github.com/ethicalhackingplayground/bxss"
	"github.com/ferreiraklet/Jeeves"
	"github.com/ffuf/ffuf"
	"github.com/ffuf/ffuf/v2"
	"github.com/glebarez/cero"
	"github.com/gwen001/github-subdomains"
	"github.com/gwen001/google-search"
	"github.com/haccer/subjack"
	"github.com/hahwul/dalfox"
	"github.com/hahwul/dalfox/v2"
	"github.com/hakluke/hakcheckurl"
	"github.com/hakluke/hakrawler"
	"github.com/hakluke/hakrevdns"
	"github.com/iamstoxe/urlgrab"
	"github.com/j3ssie/osmedeus"
	"github.com/jaeles-project/gospider"
	"github.com/lc/cspparse"
	"github.com/lc/gau"
	"github.com/lc/gau/v2/cmd/gau"
	"github.com/lc/subjs"
	"github.com/lukasikic/subzy"
	"github.com/mhmdiaa/second-order"
	"github.com/mrco24/mrco24-error-sql"
	"github.com/mrco24/mrco24-lfi"
	"github.com/mrco24/open-redirect"
	"github.com/mrco24/otx-url"
	"github.com/mrco24/parameters"
	"github.com/mrco24/time-sql"
	"github.com/mrco24/tok"
	"github.com/projectdiscovery/alterx/cmd/alterx"
	"github.com/projectdiscovery/asnmap/cmd/asnmap"
	"github.com/projectdiscovery/chaos-client/cmd/chaos"
	"github.com/projectdiscovery/dnsprobe"
	"github.com/projectdiscovery/dnsx/cmd/dnsx"
	"github.com/projectdiscovery/httpx/cmd/httpx"
	"github.com/projectdiscovery/interactsh/cmd/interactsh-client"
	"github.com/projectdiscovery/katana/cmd/katana"
	"github.com/projectdiscovery/mapcidr/cmd/mapcidr"
	"github.com/projectdiscovery/naabu/v2/cmd/naabu"
	"github.com/projectdiscovery/notify/cmd/notify"
	"github.com/projectdiscovery/nuclei/v3/cmd/nuclei"
	"github.com/projectdiscovery/shuffledns/cmd/shuffledns"
	"github.com/projectdiscovery/subfinder/v2/cmd/subfinder"
	"github.com/projectdiscovery/uncover/cmd/uncover"
	"github.com/sensepost/gowitness"
	"github.com/shenwei356/rush"
	"github.com/tomnomnom/anew"
	"github.com/tomnomnom/assetfinder"
	"github.com/tomnomnom/fff"
	"github.com/tomnomnom/gf"
	"github.com/tomnomnom/gron"
	"github.com/tomnomnom/hacks/anti-burl"
	"github.com/tomnomnom/hacks/waybackurls"
	"github.com/tomnomnom/httprobe"
	"github.com/tomnomnom/meg"
	"github.com/tomnomnom/qsreplace"
	"github.com/tomnomnom/unfurl"
	"github.com/tomnomnom/waybackurls"
	"github.com/utkusen/socialhunter"
	"github.com/vodafon/waybackrobots"
	"github.com/xm1k3/cent"
	"github.com/zan8in/afrog/v2/cmd/afrog"

    
)


for tool in "${go_tools[@]}"; do
    go install -v "$tool"@latest
done

# Source the updated .bashrc file
source ~/.zshrc
cd /mnt/CyberSecurity/bugHunting/templates
git clone https://github.com/tomnomnom/gf
git clone https://github.com/1ndianl33t/Gf-Patterns 
wget https://raw.githubusercontent.com/mrco24/Patterns/main/my-lfi.json 

git clone https://github.com/ghsec/ghsec-jaeles-signatures 
git clone https://github.com/jaeles-project/jaeles-signatures.git 
git clone https://github.com/projectdiscovery/fuzzing-templates.git 
git clone https://github.com/projectdiscovery/nuclei-templates.git 


cd /mnt/CyberSecurity/bugHunting/wordlist
git clone https://github.com/danielmiessler/SecLists.git 
git clone https://github.com/mrco24/mrco24-wordlist.git 
git clone https://github.com/orwagodfather/WordList.git  



# Confirmation message
echo "All tools have been installed successfully!"
