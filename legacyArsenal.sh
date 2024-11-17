#!/bin/bash

# Check if the script is run with root privileges
if [ "$(id -u)" -ne "0" ]; then
    echo "This script must be run as root. Use 'sudo'."
    exit 1
fi

# Create necessary directories
mkdir -p ~/Desktop/Tools ~/.gf
cd ~/Desktop/Tools

# Update and upgrade installed packages
echo "Updating package list and upgrading installed packages..."
apt update && apt upgrade -y && apt full-upgrade -y

# Install necessary packages
echo "Installing necessary packages..."
apt-get install -y software-properties-common unzip wget make python3-pip build-essential git ruby-full python3 libpcap-dev cargo dotnet-host \
                   netstandard-targeting-pack-2.1 sublist3r assetfinder altdns dirsearch feroxbuster ffuf gobuster dirb dirbuster nmap nikto \
                   massdns wpscan dnsrecon jq amass screen ruby

# Additional pip installations
pip3 install arjun corscanner --break-system-packages

# Add Go PPA and install Go
echo "Adding Go PPA and installing Go..."
add-apt-repository -y ppa:longsleep/golang-backports
apt update
apt install -y golang-go

# Set environment variables for Go
echo "export GOPATH=$HOME/go" >> ~/.bashrc
echo "export PATH=\$PATH:/usr/local/go/bin:\$GOPATH/bin:$HOME/go/bin" >> ~/.bashrc
source ~/.bashrc

# Install pdtm
echo "Installing pdtm..."
go install -v github.com/projectdiscovery/pdtm/cmd/pdtm@latest
pdtm -ia

# Install kiterunner
echo "Installing kiterunner..."
wget -q https://github.com/assetnote/kiterunner/releases/download/v1.0.2/kiterunner_1.0.2_linux_amd64.tar.gz
tar -xvzf kiterunner_1.0.2_linux_amd64.tar.gz
cp kr /usr/bin

# Clone and install tools from GitHub with a loop
tools_to_install=(
    "guelfoweb/knock"
    "GerbenJavado/LinkFinder"
    "gwen001/related-domains"
    "blechschmidt/massdns"
    "devanshbatham/FavFreak"
    "m4ll0k/SecretFinder"
    "devanshbatham/ParamSpider"
    "maurosoria/dirsearch"
    "ozguralp/gmapsapiscanner"
    "1ndianl33t/Gf-Patterns"
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
    cd ..
done

# Install additional Go tools
go_tools=(
    "github.com/projectdiscovery/shuffledns/cmd/shuffledns"
    "github.com/projectdiscovery/dnsprobe"
    "github.com/Ice3man543/SubOver"
    "github.com/tomnomnom/gf"
    "github.com/tomnomnom/assetfinder"
    "github.com/projectdiscovery/naabu/v2/cmd/naabu"
    "github.com/tomnomnom/hacks/waybackurls"
    "github.com/lukasikic/subzy"
    "github.com/projectdiscovery/nuclei/v2/cmd/nuclei"
    "github.com/haccer/subjack"
    "github.com/projectdiscovery/subfinder/v2/cmd/subfinder"
    "github.com/projectdiscovery/chaos-client/cmd/chaos"
    "github.com/hahwul/dalfox/v2"
    "github.com/lc/gau/v2/cmd/gau"
    "github.com/Emoe/kxss"
    "github.com/vodafon/waybackrobots"
    "github.com/lc/subjs"
    "github.com/hakluke/hakcheckurl"
    "github.com/hakluke/hakrawler"
    "github.com/hakluke/hakrevdns"
    "github.com/projectdiscovery/notify/cmd/notify"
    "github.com/edoardottt/csprecon/cmd/csprecon"
    "github.com/shenwei356/rush"
    "github.com/lc/cspparse"
    "github.com/mhmdiaa/second-order"
    "github.com/iamstoxe/urlgrab"
    "github.com/c-sto/recursebuster"
    "github.com/projectdiscovery/uncover/cmd/uncover"
    "github.com/dwisiswant0/crlfuzz/cmd/crlfuzz"
    "github.com/tomnomnom/meg"
    "github.com/jaeles-project/gospider"
    "github.com/PentestPad/subzy"
    "github.com/channyein1337/jsleak"
    "github.com/projectdiscovery/dnsx/cmd/dnsx"
    "github.com/OJ/gobuster/v3"
    "github.com/edoardottt/scilla/cmd/scilla"
    "github.com/projectdiscovery/alterx/cmd/alterx"
    "github.com/projectdiscovery/asnmap/cmd/asnmap"
    "github.com/projectdiscovery/mapcidr/cmd/mapcidr"
    "github.com/d3mondev/puredns/v2"
    "github.com/owasp-amass/amass/v4/..."
    "github.com/projectdiscovery/httpx/cmd/httpx"
    "github.com/projectdiscovery/katana/cmd/katana"
    "github.com/gwen001/gitlab-subdomains"
)

for tool in "${go_tools[@]}"; do
    go install -v "$tool"@latest
done

# Source the updated .bashrc file
source ~/.bashrc

# Confirmation message
echo "All tools have been installed successfully!"
