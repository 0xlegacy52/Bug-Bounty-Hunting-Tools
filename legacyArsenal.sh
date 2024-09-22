#!/usr/bin/env bash

set -e

# Check if the script is run with root privileges
if [ "$(id -u)" -ne "0" ]; then
    echo "This script must be run as root. Use 'sudo'."
    exit 1
fi


# Function to update and install necessary packages
install_packages() {
    echo "Updating package list and upgrading installed packages..."
    apt update && apt upgrade -y

    echo "Installing necessary packages..."
    apt-get install -y software-properties-common unzip wget make python3-pip build-essential git ruby-full python3 libpcap-dev
    apt-get install -y python3-pip
    apt-get install -y cargo
    apt-get install -y sublist3r assetfinder altdns dirsearch feroxbuster ffuf gobuster dirb dirbuster nmap nikto  massdns wpscan cargo dnsrecon jq

    sudo pip3 install pycurl bs4 pygeoip gobject cairocffi selenium

    pip3 install arjun
    pip3 install wfuzz
    pip3 install xsrfprobe
    pip3 install dnsgen
    pip3 install festin
    # supder handy tool works as http.server but more elegantly
    cargo install unimap
    pip3 install updog
    pip3 install truffleHog
}

# Function to add Go PPA and install Go
install_go() {
    echo "Adding Go PPA and installing Go..."
    add-apt-repository -y ppa:longsleep/golang-backports
    apt update
    apt install -y golang-go
}

# Function to set Go environment variables
set_go_env() {
    echo "Setting Go environment variables..."
	  # Set Go environment variables
	export GOPATH=$HOME/go
	export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin:/root/go/bin
	echo "export GOPATH=$HOME/go" >> ~/.bashrc
	echo "export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin:/root/go/bin" >> ~/.bashrc
	source ~/.bashrc
	}

# Function to create tools directory and install pdtm
install_pdtm() {
    echo "Creating tools directory..."
    mkdir -p ~/Desktop/tools
    cd ~/Desktop/tools
    echo "Installing pdtm..."
    go install -v github.com/projectdiscovery/pdtm/cmd/pdtm@latest
    pdtm -ia
}


# Function to download, unzip, and move binaries
install_tool() {
    local url=$1
    local filename=$(basename "$url")
    local binname=${filename%%_*}

    echo "Downloading $binname..."
    wget -q "$url"

    echo "Extracting $filename..."
    case "$filename" in
        *.zip) unzip -q "$filename" ;;
        *.tgz | *.tar.gz) tar -xvzf "$filename" ;;
    esac

    echo "Moving $binname to /usr/bin/"
    mv "$binname" /usr/bin/ || { echo "Failed to move $binname"; exit 1; }
}

# Array of tools to install
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
        install_tool "$tool"
    done
}

# Function to clone and install Python-based tools
install_python_tools() {
    echo "Cloning and installing Python-based tools..."

    # Install Knock
    git clone https://github.com/guelfoweb/knock.git
    cd knock
    pip3 install -r requirements.txt
    cd ..

    # Install MassDNS
    git clone https://github.com/blechschmidt/massdns.git
    cd massdns
    make
    cp bin/massdns /usr/bin/
    cd ..

    git clone https://github.com/edoardottt/scilla.git
    cd scilla
    go get
    make linux
    cd ..

    # Install other Python tools
    pip3 install py-altdns==1.0.2 arjun

    # Install Subzy
    git clone https://github.com/LukaSikic/subzy.git
    cd subzy
    go build .
    cp subzy /usr/bin/
    cd ..

    # Install LinkFinder
    git clone https://github.com/GerbenJavado/LinkFinder.git
    cd LinkFinder
    python3 setup.py install
    cd ..
}

# Function to install Go tools
install_go_tools() {
    echo "Installing Go tools..."
    go install github.com/OJ/gobuster/v3@latest
    go install github.com/tomnomnom/assetfinder@latest
    go install github.com/ffuf/ffuf@latest
    go install github.com/tomnomnom/gf@latest
    go install github.com/tomnomnom/meg@latest
    go install github.com/tomnomnom/waybackurls@latest
    go install github.com/LukaSikic/subzy@latest
    go install github.com/projectdiscovery/asnmap/cmd/asnmap@latest
    go install github.com/channyein1337/jsleak@latest
    go install github.com/projectdiscovery/mapcidr/cmd/mapcidr@latest
    go install github.com/projectdiscovery/dnsx/cmd/dnsx@latest
    go install github.com/jaeles-project/gospider@latest
    go install -v github.com/projectdiscovery/notify/cmd/notify@latest
    go install github.com/dwisiswant0/crlfuzz/cmd/crlfuzz@latest
    go install github.com/projectdiscovery/uncover/cmd/uncover@latest
    go install github.com/hahwul/dalfox/v2@latest
    go install github.com/0xsha/GoLinkFinder@latest
    go install github.com/hakluke/hakrawler@latest
    go install github.com/edoardottt/csprecon/cmd/csprecon@latest
    go install github.com/Josue87/gotator@latest
    go install github.com/j3ssie/osmedeus@latest
    go install github.com/projectdiscovery/shuffledns/cmd/shuffledns@latest
    go install github.com/utkusen/socialhunter@latest
    go install github.com/003random/getJS@latest
    go install github.com/tomnomnom/httprobe@latest
    go install github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
    go install github.com/projectdiscovery/dnsx/cmd/dnsx@latest
    go install github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
    go install github.com/c-sto/recursebuster@latest
    go install github.com/jaeles-project/gospider@latest
    go install github.com/hakluke/hakrawler@latest
    go install github.com/lc/gau/v2/cmd/gau@latest
    go install github.com/iamstoxe/urlgrab@latest
    go install github.com/003random/getJS@latest
    go install github.com/ameenmaali/qsfuzz@latest
    go install github.com/dwisiswant0/crlfuzz/cmd/crlfuzz@latest
    go install github.com/hahwul/dalfox/v2@latest
    go install github.com/haccer/subjack@latest
    go install github.com/Ice3man543/SubOver@latest
    go install github.com/tomnomnom/anew@latest
    go install github.com/tomnomnom/meg@latest
    go install github.com/tomnomnom/waybackurls@latest
    go install github.com/tomnomnom/qsreplace@latest
    go install github.com/tomnomnom/gf@latest
    go install github.com/tomnomnom/httprobe@latest
    go install github.com/tomnomnom/concurl@latest
    go install github.com/tomnomnom/burl@latest
    go install github.com/projectdiscovery/httpx/cmd/httpx@latest
    go install github.com/bp0lr/gauplus@latest
    go install github.com/1ndianl33t/urlprobe@latest
    go install github.com/mhmdiaa/second-order@latest
    go install github.com/lc/cspparse@latest
    go install github.com/shenwei356/rush/
    go install github.com/lc/subjs@latest
    go install github.com/dwisiswant0/cf-check@latest
    go install github.com/projectdiscovery/shuffledns/cmd/shuffledns@latest
    go install github.com/gwen001/github-subdomains@latest
    go install github.com/cgboal/sonarsearch/cmd/crobat@latest
    #go get github.com/d3mondev/puredns/v2
    go install github.com/glebarez/cero@latest
    #go env -w GO111MODULE="auto"
    go install github.com/Josue87/gotator@latest
    go install github.com/michenriksen/gitrob@latest
    go install github.com/Ice3man543/SubOver@latest
    go install github.com/lc/subjs@latest
    go install github.com/magisterquis/s3finder@latest
    go install github.com/d3mondev/puredns/v2@latest
    go install github.com/Hackmanit/Web-Cache-Vulnerability-Scanner@latest
    go install -v github.com/lukasikic/subzy
    go install github.com/lukasikic/subzy@latest
    go install github.com/projectdiscovery/mapcidr/cmd/mapcidr@latest
    go install github.com/detectify/page-fetch@latest
    go install github.com/ferreiraklet/airixss@latest
    go install github.com/s0md3v/smap/cmd/smap@latest
    go install github.com/tomnomnom/httprobe@latest
go install github.com/003random/jsfinder/cmd/jsminer@latest
go install github.com/003random/getJS@latest
go install github.com/hakluke/golinkfinder@latest
go install github.com/tomnomnom/waybackrobots@latest
go install github.com/BishopFox/ssrfDetector@latest
git clone https://github.com/anshumanbh/gitallsecrets.git
go install github.com/merces/rtw@latest
git clone https://github.com/RUB-NDS/CORStest.git
git clone https://github.com/maK-/parameth.git

}

# Function to clone and install additional tools
install_additional_tools() {
    echo "Cloning and installing additional tools..."

    # Install dontgo403
    git clone https://github.com/devploit/dontgo403
    cd dontgo403
    go get
    go build
    cd ..
    # Install EyeWitness
    git clone https://github.com/FortyNorthSecurity/EyeWitness.git
    cd EyeWitness/Python/setup
    sudo ./setup.sh
    cd ../../..
    # Install XXEInjector
    git clone https://github.com/enjoiz/XXEinjector.git
    cd XXEinjector
    gem install bundle
    bundle install
    cd ..
    git clone https://github.com/findomain/findomain.git
    cd findomain
    cargo build --release
    sudo cp target/release/findomain /usr/bin/
    #findomain
    cd ..

    # Install Nikto
    git clone https://github.com/sullo/nikto
    cd nikto/program
    chmod +x *
    cp nikto.pl /usr/bin/nikto
    cd ../..

    # Install XSStrike
    git clone https://github.com/s0md3v/XSStrike
    cd XSStrike
    pip3 install -r requirements.txt
    cd ..

    # Install Logsensor
    git clone https://github.com/Mr-Robert0/Logsensor.git
    cd Logsensor
    chmod +x logsensor.py install.sh
    pip install -r requirements.txt
    ./install.sh
    cd ..

    # Install Altdns
    git clone https://github.com/infosec-au/altdns.git
    cd altdns
    pip3 install -r requirements.txt
    cd ..

    # Install xnLinkFinder
    git clone https://github.com/xnl-h4ck3r/xnLinkFinder.git
    cd xnLinkFinder
    python3 setup.py install
    cd ..

    # Install ParamSpider
    git clone https://github.com/devanshbatham/ParamSpider
    cd ParamSpider
    pip3 install -r requirements.txt
    cd ..
    git clone https://github.com/1ndianl33t/Gf-Patterns
	cp ~/Gf-Patterns/*.json ~/.gf
    # Install NoSQLMap
    git clone https://github.com/codingo/NoSQLMap.git
    cd NoSQLMap
    python3 setup.py install
    cd ..
    git clone https://github.com/FortyNorthSecurity/EyeWitness.git
    bash /EyeWitness/Python/setup/setup.sh
    # Install Chameleon
    mkdir chameleon && cd chameleon
    curl -sL https://raw.githubusercontent.com/iustin24/chameleon/master/install.sh | bash
    cd ..

    # Install GraphQLmap
    git clone https://github.com/swisskyrepo/GraphQLmap
    cd GraphQLmap
    python3 setup.py install
    cd ..

    # Install WhatWeb
    git clone https://github.com/urbanadventurer/WhatWeb.git
    cd WhatWeb
    gem install bundler
    bundle update
    bundle install
    cd ..

    # Install HTTP Request Smuggling
    git clone https://github.com/anshumanpattnaik/http-request-smuggling.git
    cd http-request-smuggling
    pip3 install -r requirements.txt
    cd ..

    # Install Commix
    git clone https://github.com/commixproject/commix.git
    cd commix

    # Install JWT Tool
    git clone https://github.com/ticarpi/jwt_tool
    cd jwt_tool
    python3 -m pip install termcolor cprint pycryptodomex requests
    chmod +x jwt_tool.py
    cd ..

    # Install Gitleaks
    git clone https://github.com/zricethezav/gitleaks.git
    cd gitleaks
    make build
    mv gitleaks /usr/local/bin
    cd ..

    # Clean up
    rm -rf ~/Desktop/tools
    echo "Setup complete. All tools installed successfully."
}

# Execute functions
install_packages
install_go
set_go_env
install_pdtm
install_tools
install_python_tools
install_go_tools
install_additional_tools
