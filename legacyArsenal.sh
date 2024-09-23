#!/usr/bin/env bash

set -e  # Exit on error

# Check if the script is run with root privileges
if [ "$(id -u)" -ne "0" ]; then
    echo "This script must be run as root. Use 'sudo'."
    exit 1
fi

# Function to update and install necessary packages
install_packages() {
    echo "Updating package list and upgrading installed packages..."
    apt update && apt upgrade -y

    echo "Installing necessary packages from Kali repositories..."
    apt-get install -y \
        software-properties-common unzip wget make python3-pip build-essential git ruby-full \
        python3 libpcap-dev cargo \
        sublist3r assetfinder altdns dirsearch feroxbuster ffuf gobuster dirb dirbuster \
        nmap nikto massdns wpscan dnsrecon jq \
        golang-go  # Install Go from Kali's repository
}

# Function to set Go environment variables
set_go_env() {
    echo "Setting Go environment variables..."
    export GOPATH=$HOME/go
    export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin:/root/go/bin:/$HOME/go/bin
    echo "export GOPATH=$HOME/go" >> ~/.bashrc
    echo "export PATH=\$PATH:/usr/local/go/bin:\$GOPATH/bin:/root/go/bin:/$HOME/go/bin" >> ~/.bashrc
    source ~/.bashrc
    }

# Function to create tools directory and install pdtm
install_pdtm() {
    echo "Creating tools directory..."
    mkdir -p ~/Desktop/tools
    cd ~/Desktop/tools || exit
    echo "Installing pdtm..."
    go install -v github.com/projectdiscovery/pdtm/cmd/pdtm@latest
    pdtm -ia
}

# Function to download, unzip, and move binaries (for manually downloaded tools)
install_tool() {
    local url=$1
    local filename=$(basename "$url")
    local binname=${filename%%_*}

    echo "Downloading $binname..."
    wget -q "$url" || { echo "Failed to download $binname"; return 1; }

    echo "Extracting $filename..."
    case "$filename" in
        *.zip) unzip -q "$filename" ;;
        *.tgz | *.tar.gz) tar -xvzf "$filename" ;;
    esac

    echo "Moving $binname to /usr/bin/"
    mv "$binname" /usr/bin/ || { echo "Failed to move $binname"; return 1; }
}

# Array of tools to install (if not available in Kali repo)
declare -a tools=(
    "https://github.com/projectdiscovery/asnmap/releases/download/v1.0.4/asnmap_1.0.4_linux_amd64.zip"
    "https://github.com/projectdiscovery/mapcidr/releases/download/v1.1.2/mapcidr_1.1.2_linux_amd64.zip"
    "https://github.com/projectdiscovery/subfinder/releases/download/v2.6.0/subfinder_2.6.0_linux_amd64.zip"
    "https://github.com/owasp-amass/amass/releases/download/v3.23.2/amass_Linux_amd64.zip"
    "https://github.com/d3mondev/puredns/releases/download/v2.1.1/puredns-Linux-amd64.tgz"
    "https://github.com/projectdiscovery/naabu/releases/download/v2.1.6/naabu_2.1.6_linux_amd64.zip"
    "https://github.com/projectdiscovery/httpx/releases/download/v1.3.2/httpx_1.3.2_linux_amd64.zip"
    "https://github.com/projectdiscovery/katana/releases/download/v1.0.2/katana_1.0.2_linux_amd64.zip"
    "https://github.com/tomnomnom/waybackurls/releases/download/v0.1.0/waybackurls-linux-amd64-0.1.0.tgz"
    "https://github.com/projectdiscovery/nuclei/releases/download/v2.9.6/nuclei_2.9.6_linux_amd64.zip"
    "https://github.com/hahwul/dalfox/releases/download/v2.9.0/dalfox_2.9.0_linux_amd64.tar.gz"
    "https://github.com/lc/subjs/releases/download/v1.0.1/subjs_1.0.1_linux_amd64.tar.gz"
    "https://github.com/assetnote/kiterunner/releases/download/v1.0.2/kiterunner_1.0.2_linux_amd64.tar.gz"
    "https://github.com/ffuf/ffuf/releases/download/v2.0.0/ffuf_2.0.0_linux_amd64.tar.gz"
    "https://github.com/tomnomnom/anew/releases/download/v0.1.1/anew-linux-amd64-0.1.1.tgz"
    "https://github.com/projectdiscovery/dnsx/releases/download/v1.1.4/dnsx_1.1.4_linux_amd64.zip"
    "https://github.com/projectdiscovery/alterx/releases/download/v0.0.2/alterx_0.0.2_linux_amd64.zip"
)

# Function to install all tools from the array
install_tools() {
    for tool in "${tools[@]}"; do
        install_tool "$tool" || { echo "Failed to install $tool"; }
    done
}

# Function to clone and install Python-based tools
install_python_tools() {
    echo "Cloning and installing Python-based tools..."

    declare -a python_tools=(
        "https://github.com/guelfoweb/knock.git"
        "https://github.com/blechschmidt/massdns.git"
        "https://github.com/edoardottt/scilla.git"
        "https://github.com/LukaSikic/subzy.git"
        "https://github.com/GerbenJavado/LinkFinder.git"
    )

    for repo in "${python_tools[@]}"; do
        git clone "$repo" || { echo "Failed to clone $repo"; continue; }
        cd "$(basename "$repo" .git)" || continue

        if [[ "$repo" == *"massdns.git"* ]]; then
            make && cp bin/massdns /usr/bin/
        elif [[ "$repo" == *"scilla.git"* ]]; then
            go get && make linux
        elif [[ "$repo" == *"subzy.git"* ]]; then
            go build . && cp subzy /usr/bin/
        elif [[ "$repo" == *"LinkFinder.git"* ]]; then
            python3 setup.py install
        fi

        cd .. || exit
    done

    pip3 install py-altdns==1.0.2 arjun
}

# Function to install Go tools using go install
install_go_tools() {
    echo "Installing Go tools..."
    local go_tools=(
        "github.com/OJ/gobuster/v3@latest"
        "github.com/tomnomnom/assetfinder@latest"
        "github.com/ffuf/ffuf@latest"
        "github.com/tomnomnom/gf@latest"
        "github.com/tomnomnom/meg@latest"
        "github.com/tomnomnom/waybackurls@latest"
        "github.com/LukaSikic/subzy@latest"
        "github.com/projectdiscovery/asnmap/cmd/asnmap@latest"
        "github.com/channyein1337/jsleak@latest"
        "github.com/projectdiscovery/mapcidr/cmd/mapcidr@latest"
        "github.com/projectdiscovery/dnsx/cmd/dnsx@latest"
        "github.com/jaeles-project/gospider@latest"
        "github.com/projectdiscovery/notify/cmd/notify@latest"
        "github.com/dwisiswant0/crlfuzz/cmd/crlfuzz@latest"
        "github.com/projectdiscovery/uncover/cmd/uncover@latest"
        "github.com/hahwul/dalfox/v2@latest"
        "github.com/0xsha/GoLinkFinder@latest"
        "github.com/hakluke/hakrawler@latest"
        "github.com/edoardottt/csprecon/cmd/csprecon@latest"
        "github.com/Josue87/gotator@latest"
        "github.com/j3ssie/osmedeus@latest"
        "github.com/projectdiscovery/shuffledns/cmd/shuffledns@latest"
        "github.com/utkusen/socialhunter@latest"
        "github.com/003random/getJS@latest"
        "github.com/tomnomnom/httprobe@latest"
        "github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest"
        "github.com/projectdiscovery/naabu/v2/cmd/naabu@latest"
        "github.com/c-sto/recursebuster@latest"
        "github.com/lc/gau/v2/cmd/gau@latest"
        "github.com/iamstoxe/urlgrab@latest"
        "github.com/mhmdiaa/second-order@latest"
        "github.com/lc/cspparse@latest"
        "github.com/shenwei356/rush/"
        "github.com/lc/subjs@latest"
        "github.com/projectdiscovery/shuffledns/cmd/shuffledns@latest"
        "github.com/gwen001/virtual-host@latest"
        "github.com/lc/gojex@latest"
        "github.com/porthole-ascendancy/gtrt@latest"
        "github.com/hahwul/scanify@latest"
        "github.com/s0md3v/Photon@latest"
    )

    for go_tool in "${go_tools[@]}"; do
        go install "$go_tool" || { echo "Failed to install $go_tool"; }
    done
}

# Main execution
install_packages
set_go_env
install_pdtm
install_tools
install_python_tools
install_go_tools
echo "All tools have been installed successfully!"
