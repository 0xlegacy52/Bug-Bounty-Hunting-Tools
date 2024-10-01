    #!/bin/bash
    # Check if the script is run with root privileges
    if [ "$(id -u)" -ne "0" ]; then
    echo "This script must be run as root. Use 'sudo'."
    exit 1
    fi
    mkdir -p ~/VPS-tools ~/VPS-tools/files
    mkdir -p ~/templates
    mkdir -p ~/wordlist
    mkdir ~/.gf
    mkdir ~/.go
    echo "Updating package list and upgrading installed packages..."
    apt update && apt upgrade -y && apt full-upgrade -y
    echo "Installing necessary packages..."
    apt-get install -y software-properties-common unzip wget make python3-pip build-essential git ruby-full python3 libpcap-dev cargo dotnet-host netstandard-targeting-pack-2.1 sublist3r assetfinder altdns dirsearch feroxbuster ffuf gobuster dirb dirbuster nmap nikto massdns wpscan dnsrecon jq amass screen ruby tmux wfuzz ripgrep sqlmap python3-shodan gem  python3.8-venv 
    python3 -m venv ~/VPS-tools/VPS-env && source ~/VPS-tools/VPS-env/bin/activate
    gem install wpscan
    pip3 install arjun  corscanner droopescan 
    pip install git+https://github.com/xnl-h4ck3r/knoxnl.git
    sudo pip3 install git+https://github.com/maurosoria/dirsearch
    echo "Adding Go PPA and installing Go..."
    add-apt-repository -y ppa:longsleep/golang-backports GitHacker  uro 
    apt update
    apt install -y golang-go
    cd ~/VPS-tools/files && wget https://go.dev/dl/go1.22.2.linux-amd64.tar.gz
    tar -zxvf go1.22.2.linux-amd64.tar.gz -C /usr/local/
    export GOROOT=/usr/local/go
    export GOPATH=$HOME/.go
    export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
    update-alternatives --install "/usr/bin/go" "go" "/usr/local/go/bin/go" 0
    update-alternatives --set go /usr/local/go/bin/go
    echo "export GOROOT=/usr/local/go" >> ~/.bashrc
    echo "export GOPATH=$HOME/.go" >> ~/.bashrc
    echo "export PATH=\$PATH:\$GOROOT/bin:\$GOPATH/bin" >> ~/.bashrc
    source ~/.bashrc
    cd ~/VPS-tools
    curl -LO https://github.com/findomain/findomain/releases/latest/download/findomain-linux-i386.zip > /dev/null 2>&1 && unzip findomain-linux-i386.zip && chmod +x findomain > /dev/null 2>&1 && cp findomain /usr/bin/ && chmod  +x /usr/bin/findomain ;
    git clone https://github.com/infosec-au/altdns.git && cd altdns && pip install --upgrade pip setuptools pyopenssl requests urllib3 cachecontrol && pip install -r requirements.txt&&cd .. ;
    git clone https://github.com/joda32/CertCrunchy.git > /dev/null 2>&1 && cd CertCrunchy && sudo pip3 install -r requirements.txt&&cd .. ;
    wget https://github.com/guelfoweb/knock/archive/refs/tags/5.4.0.zip && unzip 5.4.0.zip && cd knock-5.4.0 && python3 setup.py install && knockpy --set apikey-virustotal=apikey&& cd .. ;
    wget https://github.com/jaeles-project/jaeles/releases/download/beta-v0.17/jaeles-v0.17-linux.zip > /dev/null 2>&1 && unzip jaeles-v0.17-linux.zip > /dev/null 2>&1 && mv jaeles /usr/local/bin/;
    wget https://github.com/s0md3v/uro/archive/refs/tags/1.0.0-beta.zip && unzip 1.0.0-beta.zip && cd uro-1.0.0-beta && python3 setup.py install && cp -r  uro /usr/bin&&cd .. ; 
    wget install https://github.com/assetnote/kiterunner/releases/download/v"$KITERUNNERVER"/kiterunner_"$KITERUNNERVER"_linux_amd64.tar.gz > /dev/null 2>&1 && tar xvf kiterunner_"$KITERUNNERVER"_linux_amd64.tar.gz > /dev/null 2>&1 && mv kr /usr/local/bin;
    wget install https://github.com/michenriksen/aquatone/releases/download/v$AQUATONEVER/aquatone_linux_amd64_$AQUATONEVER.zip > /dev/null 2>&1 && unzip aquatone_linux_amd64_$AQUATONEVER.zip > /dev/null 2>&1 && mv aquatone /usr/local/bin/&& cd .. ;
    export CENSYS_API_ID="apiId" && export CENSYS_API_SECRET="apisecret" && git clone https://github.com/christophetd/censys-subdomain-finder.git > /dev/null 2>&1 && cd censys-subdomain-finder && pip install -r requirements.txt cd .. ; 
    git clone https://github.com/0ang3el/aem-hacker.git > /dev/null 2>&1 && cd aem-hacker && pip3 install -r requirements.txt > /dev/null 2>&1 &&cd .. ;
    git clone https://github.com/americanexpress/earlybird.git > /dev/null 2>&1 && cd earlybird && ./build.sh > /dev/null 2>&1 && ./install.sh > /dev/null 2>&1 && cd .. ;
    git clone https://github.com/anshumanpattnaik/http-request-smuggling.git > /dev/null 2>&1 && cd http-request-smuggling && pip3 install -r requirements.txt > /dev/null 2>&1 && cd .. ;
    git clone https://github.com/blechschmidt/massdns.git > /dev/null 2>&1 && cd massdns && apt install make && make && make install > /dev/null 2>&1 && ln -s /root/VPS-tools/massdns/bin/massdns /usr/local/bin/ && cd .. ;
    git clone https://github.com/bp0lr/gauplus.git && cd gauplus && go build && mv gauplus /usr/local/bin/ && cd .. ;
    git clone https://github.com/codingo/Interlace.git > /dev/null 2>&1 && cd Interlace && python3 setup.py install > /dev/null 2>&1 && cd .. ;
    git clone https://github.com/codingo/NoSQLMap.git > /dev/null 2>&1 && cd NoSQLMap && python setup.py install > /dev/null 2>&1 && cd .. ;
    git clone https://github.com/dark-warlord14/JSScanner > /dev/null 2>&1 && cd JSScanner/ && bash install.sh > /dev/null 2>&1  && cd .. ;
    git clone https://github.com/devanshbatham/paramspider > /dev/null 2>&1 && cd ParamSpider && apt install python-pip -y && pip install . && cd .. ; 
    git clone https://github.com/Dheerajmadhukar/Lilly.git  > /dev/null 2>&1 && cd Lilly && chmod +x lilly.sh && cd .. ;
    git clone https://github.com/Ekultek/WhatWaf.git > /dev/null 2>&1 && cd WhatWaf && ./setup.sh install && cd ..;
    git clone https://github.com/epinna/tplmap.git > /dev/null 2>&1 && cd tplmap && pip install -r requirements.txt > /dev/null 2>&1 && cd .. ;
    git clone https://github.com/faiyazahmad07/xss_vibes.git > /dev/null 2>&1 && cd xss_vibes && pip3 install -r requirements > /dev/null 2>&1 && cd .. ;
    git clone https://github.com/GerbenJavado/LinkFinder.git > /dev/null 2>&1 && cd LinkFinder && pip3 install -r requirements.txt > /dev/null 2>&1 && python3 setup.py install > /dev/null 2>&1 && cd .. ;
    git clone https://github.com/gokulapap/wappalyzer-cli  > /dev/null 2>&1 && cd wappalyzer-cli && pip3 install . > /dev/null 2>&1 && cd .. ;
    git clone https://github.com/hisxo/gitGraber.git > /dev/null 2>&1 && cd gitGraber && pip3 install -r requirements.txt > /dev/null 2>&1 && cd .. ;
    git clone https://github.com/m4ll0k/SecretFinder.git > /dev/null 2>&1 && cd SecretFinder && pip3 install -r requirements.txt && pip3 install jsbeautifier && pip3 install lxml > /dev/null 2>&1 && cd .. ;
    git clone https://github.com/obheda12/GitDorker.git > /dev/null 2>&1 && cd GitDorker && pip3 install -r requirements.txt > /dev/null 2>&1 && cd .. ;
    git clone https://github.com/r0075h3ll/Oralyzer.git &&cd Oralyzer &&pip3 install -r requirements.txt && cd .. ;
    git clone https://github.com/r0oth3x49/ghauri.git > /dev/null 2>&1 && cd ghauri && python3 -m pip install --upgrade -r requirements.txt && python3 -m pip install -e . > /dev/null 2>&1 cd .. ;
    git clone https://github.com/robertdavidgraham/masscan > /dev/null 2>&1 && cd masscan && make > /dev/null 2>&1 && make install > /dev/null 2>&1 && mv bin/masscan /usr/local/bin/ && cd .. ;
    git clone https://github.com/s0md3v/XSStrike > /dev/null 2>&1 && cd XSStrike && pip3 install -r requirements.txt > /dev/null 2>&1 && cd .. ;
    git clone https://github.com/securing/DumpsterDiver.git > /dev/null 2>&1 && cd DumpsterDiver && pip3 install -r requirements.txt > /dev/null 2>&1 && cd .. ;
    git clone https://github.com/swisskyrepo/SSRFmap > /dev/null 2>&1 && cd SSRFmap && pip3 install -r requirements.txt > /dev/null 2>&1 && cd .. ;
    git clone https://github.com/tarunkant/Gopherus.git > /dev/null 2>&1 && cd Gopherus && chmod +x install.sh && ./install.sh > /dev/null 2>&1 && cd .. ;
    git clone https://github.com/tr0uble-mAker/POC-bomber.git && cd POC-bomber && pip install -r requirements.txt&&cd .. ;
    git clone https://github.com/UnaPibaGeek/ctfr.git && cd ctfr/ && pip3 install -r requirements.txt&&cd .. ;
    git clone https://github.com/vortexau/dnsvalidator.git && cd dnsvalidator && python3 setup.py install &&  pip3 install contextvars && pip3 install -e . && ln -s dnsvalidator /usr/local/bin/ && cd .. ;
    git clone https://github.com/xnl-h4ck3r/xnLinkFinder.git && cd xnLinkFinder && python setup.py install > /dev/null 2>&1 && cd .. ;
    git clone --recursive https://github.com/screetsec/Sudomy.git > /dev/null 2>&1 && cd Sudomy && python3 -m pip install -r requirements.txt && apt-get install npm && apt-get install jq && npm install -g phantomjs && apt-get install jq nmap phantomjs npm chromium parallel -y && npm i -g wappalyzer wscat && cp sudomy /usr/local/bin && cp sudomy.api /usr/local/bin && cp slack.conf /usr/local/bin && cp sudomy.conf /usr/local/bin > /dev/null 2>&1 && ln -s sudomy /usr/local/bin/ && cd .. ;
    git colne https://github.com/s0md3v/Arjun.git && cd Arjun && pip3 install arjun && python3 setup.py install&& cd .. ;
    wget https://github.com/mrco24/x8/raw/main/x8 && chmod +x x8 && mv x8 /usr/local/bin/x8;
    curl -sL https://raw.githubusercontent.com/epi052/feroxbuster/master/install-nix.sh | bash &>/dev/null;
    wget -N -c https://github.com/Edu4rdSHL/unimap/releases/download/0.5.1/unimap-linux && mv unimap-linux /usr/local/bin/unimap && chmod 755 /usr/local/bin/unimap && strip -s /usr/local/bin/unimap;
    git clone https://github.com/takshal/freq.git && cd freq && mv main.go freq.go && go build freq.go && cp freq /usr/bin&& cd .. ; 
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
    pip3 install requirements.txt --break-system-packages
    cd ..
    git clone https://github.com/m4ll0k/SecretFinder 
    cd SecretFinder
    pip3 install requirements.txt --break-system-packages
    cd ..
    git clone https://github.com/devanshbatham/ParamSpider 
    cd ParamSpider
    pip3 install requirements.txt --break-system-packages
    cd ..
    git clone https://github.com/maurosoria/dirsearch 
    cd dirsearch
    pip3 install requirements.txt --break-system-packages
    cd ..
    git clone https://github.com/ozguralp/gmapsapiscanner 
    cd gmapsapiscanner
    pip3 install requirements.txt --break-system-packages
    cd ..
    mkdir -p kiterunner-wordlists && cd kiterunner-wordlists && wget install https://wordlists-cdn.assetnote.io/data/kiterunner/routes-large.kite.tar.gz > /dev/null 2>&1 && wget install https://wordlists-cdn.assetnote.io/data/kiterunner/routes-small.kite.tar.gz > /dev/null 2>&1 && for f in *.tar.gz; do tar xf "$f"; rm -Rf "$f"; done
    cd .. ; 
    git clone https://github.com/tomnomnom/gf && cd ~/VPS-tools/files/gf/examples && cp *.json $HOME/.gf && cd ~/VPS-tools/files && git clone https://github.com/1ndianl33t/Gf-Patterns && cd Gf-Patterns && wget https://raw.githubusercontent.com/mrco24/Patterns/main/my-lfi.json && cp *.json $HOME/.gf;
    cd ~/VPS-tools
    GO111MODULE=on go get -u -v github.com/lc/subjs
    GO111MODULE=on go get -u -v github.com/lc/subjs@latest
    GO111MODULE=on go get -u -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder
    GO111MODULE=on go get -v github.com/projectdiscovery/chaos-client/cmd/chaos;
    GO111MODULE=on go install github.com/d3mondev/puredns/v2@latest > /dev/null 2>&1 && ln -s ~/go/bin/puredns /usr/local/bin;
    GO111MODULE=on go install github.com/dwisiswant0/crlfuzz/cmd/crlfuzz@latest
    GO111MODULE=on go install github.com/jaeles-project/gospider@latest
    GO111MODULE=on go install -v github.com/c3l3si4n/quickcert@HEAD > /dev/null 2>&1 && ln -s ~/go/bin/quickcert /usr/local/bin/;
    GO111MODULE=on go install -v github.com/dwisiswant0/galer@latest > /dev/null 2>&1 && ln -s ~/go/bin/galer /usr/local/bin/;
    GO111MODULE=on go install -v github.com/hahwul/dalfox/v2@latest > /dev/null 2>&1 && ln -s ~/go/bin/dalfox /usr/local/bin/;
    GO111MODULE=on go install -v github.com/lc/gau@latest > /dev/null 2>&1 && ln -s ~/go/bin/gau /usr/local/bin/;
    GO111MODULE=on go install -v github.com/projectdiscovery/dnsx/cmd/dnsx@latest > /dev/null 2>&1 && ln -s ~/go/bin/dnsx /usr/local/bin/;
    GO111MODULE=on go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest > /dev/null 2>&1 && ln -s ~/go/bin/httpx /usr/local/bin/;
    GO111MODULE=on go install -v github.com/projectdiscovery/interactsh/cmd/interactsh-client > /dev/null 2>&1 && ln -s ~/go/bin/interactsh-client /usr/local/bin/;
    GO111MODULE=on go install -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest > /dev/null 2>&1 && ln -s ~/go/bin/naabu /usr/local/bin/;
    GO111MODULE=on go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest > /dev/null 2>&1 && ln -s ~/go/bin/subfinder /usr/local/bin/;
    go get github.com/channyein1337/jsleak
    go get github.com/Emoe/kxss
    go get github.com/haccer/subjack
    go get github.com/hakluke/hakcheckurl
    go get github.com/hakluke/hakrawler
    go get github.com/hakluke/hakrevdns
    go get github.com/Ice3man543/SubOver
    go get github.com/tomnomnom/hacks/waybackurls
    go get -u github.com/cheggaaa/pb/v3 && go install github.com/mrco24/web-archive@latest > /dev/null 2>&1 && ln -s ~/go/bin/web-archive /usr/local/bin/; 
    go get -u github.com/c-sto/recursebuster
    go get -u github.com/iamstoxe/urlgrab
    go get -u github.com/lc/cspparse
    go get -u github.com/tomnomnom/assetfinder
    go get -u github.com/tomnomnom/gf
    go get -u github.com/vodafon/waybackrobots
    go get -u -v github.com/hahwul/dalfox
    go install github.com/bp0lr/gauplus@latest
    go get -u -v github.com/lc/gau
    go get -u -v github.com/lukasikic/subzy
    go get -u -v github.com/projectdiscovery/dnsprobe
    go get -u -v github.com/projectdiscovery/httpx/cmd/httpx
    go get -u -v github.com/projectdiscovery/naabu/v2/cmd/naabu
    go get -u -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei
    go get -u -v github.com/projectdiscovery/shuffledns/cmd/shuffledns
    go install github.com/003random/getJS@latest > /dev/null 2>&1 && ln -s ~/go/bin/getJS /usr/local/bin/;
    go install github.com/003random/getJS/v2@latest
    go install github.com/0xsha/GoLinkFinder@latest
    go install github.com/cgboal/sonarsearch/cmd/crobat@latest > /dev/null 2>&1 && ln -s ~/go/bin/crobat /usr/local/bin/;
    go install github.com/channyein1337/jsleak@latest
    go install github.com/d3mondev/puredns/v2@latest
    go install github.com/dwisiswant0/cf-check@latest > /dev/null 2>&1 && ln -s ~/go/bin/cf-check /usr/local/bin/;
    go install github.com/edoardottt/csprecon/cmd/csprecon@latest
    go install github.com/Emoe/kxss@late > /dev/null 2>&1 && ln -s ~/go/bin/kxss /usr/local/bin/;
    go install github.com/ethicalhackingplayground/bxss@latest > /dev/null 2>&1 && ln -s ~/go/bin/bxss /usr/local/bin/;
    go install github.com/ferreiraklet/Jeeves@latest > /dev/null 2>&1 && ln -s ~/go/bin/Jeeves /usr/local/bin/; 
    go install github.com/ffuf/ffuf@latest > /dev/null 2>&1 && ln -s ~/go/bin/ffuf /usr/local/bin/;
    go install github.com/ffuf/ffuf/v2@latest
    go install github.com/glebarez/cero@latest > /dev/null 2>&1 && ln -s ~/go/bin/cero /usr/local/bin/;
    go install github.com/gwen001/github-subdomains@latest  > /dev/null 2>&1 && ln -s ~/go/bin/github-subdomains /usr/local/bin/;
    go install github.com/gwen001/gitlab-subdomains@latest
    go install github.com/gwen001/google-search@latest
    go install github.com/hahwul/dalfox/v2@latest
    go install github.com/hakluke/hakrawler@latest
    go install github.com/hakluke/hakrawler@latest > /dev/null 2>&1 && ln -s ~/go/bin/hakrawler /usr/local/bin/;
    go install github.com/jaeles-project/gospider@latest > /dev/null 2>&1 && ln -s ~/go/bin/gospider /usr/local/bin/;
    go install github.com/Josue87/gotator@latest
    go install github.com/Josue87/gotator@latest > /dev/null 2>&1 && ln -s ~/go/bin/gotator /usr/local/bin/;
    go install github.com/KathanP19/Gxss@latest > /dev/null 2>&1 && ln -s ~/go/bin/Gxss /usr/local/bin/; 
    go install github.com/lc/gau/v2/cmd/gau@latest
    go install github.com/mrco24/mrco24-error-sql@latest > /dev/null 2>&1 && ln -s ~/go/bin/mrco24-error-sql /usr/local/bin/; 
    go install github.com/mrco24/mrco24-lfi@latest > /dev/null 2>&1 && ln -s ~/go/bin/mrco24-lfi /usr/local/bin/;
    go install github.com/mrco24/open-redirect@latest > /dev/null 2>&1 && ln -s ~/go/bin/open-redirect /usr/local/bin/;
    go install github.com/mrco24/otx-url@latest > /dev/null 2>&1 && ln -s ~/go/bin/otx-url /usr/local/bin/; 
    go install github.com/mrco24/parameters@latest > /dev/null 2>&1 && ln -s ~/go/bin/parameters /usr/local/bin/;
    go install github.com/mrco24/time-sql@latest > /dev/null 2>&1 && ln -s ~/go/bin/time-sql /usr/local/bin/; 
    go install github.com/mrco24/tok@latest > /dev/null 2>&1 && ln -s ~/go/bin/tok /usr/local/bin/;
    go install github.com/MrEmpy/mantra@latest && cp -r /root/go/bin/mantra /usr/local/bin > /dev/null 2>&1;
    go install github.com/OJ/gobuster/v3@latest
    go install github.com/OJ/gobuster/v3@latest > /dev/null 2>&1 && ln -s ~/go/bin/gobuster /usr/local/bin/;
    go install github.com/projectdiscovery/alterx/cmd/alterx@latest
    go install github.com/projectdiscovery/asnmap/cmd/asnmap@latest
    go install github.com/projectdiscovery/katana/cmd/katana@latest
    go install github.com/projectdiscovery/katana/cmd/katana@latest > /dev/null 2>&1 && ln -s ~/go/bin/katana /usr/local/bin/; 
    go install github.com/sensepost/gowitness@latest > /dev/null 2>&1 && ln -s ~/go/bin/gowitness chmod +x /usr/local/bin/;
    go install github.com/shenwei356/rush@latest
    go install github.com/tomnomnom/anew@latest > /dev/null 2>&1 && ln -s ~/go/bin/anew /usr/local/bin/;
    go install github.com/tomnomnom/assetfinder@latest > /dev/null 2>&1 && ln -s ~/go/bin/assetfinder /usr/local/bin/;
    go install github.com/tomnomnom/fff@latest > /dev/null 2>&1 && ln -s ~/go/bin/fff /usr/local/bin/;
    go install github.com/tomnomnom/gf@latest > /dev/null 2>&1 && ln -s ~/go/bin/gf /usr/local/bin/;
    go install github.com/tomnomnom/gron@latest > /dev/null 2>&1 && ln -s ~/go/bin/gron /usr/local/bin/;
    go install github.com/tomnomnom/hacks/anti-burl@latest > /dev/null 2>&1 && ln -s ~/go/bin/anti-burl /usr/local/bin/;
    go install github.com/tomnomnom/httprobe@latest
    go install github.com/tomnomnom/httprobe@latest > /dev/null 2>&1 && ln -s ~/go/bin/httprobe /usr/local/bin/;
    go install github.com/tomnomnom/meg@latest
    go install github.com/tomnomnom/qsreplace@latest > /dev/null 2>&1 && ln -s ~/go/bin/qsreplace /usr/local/bin/;
    go install github.com/tomnomnom/unfurl@latest > /dev/null 2>&1 && ln -s ~/go/bin/unfurl /usr/local/bin/;
    go install github.com/tomnomnom/waybackurls@latest
    go install github.com/tomnomnom/waybackurls@latest > /dev/null 2>&1 && ln -s ~/go/bin/waybackurls /usr/local/bin/;
    go install github.com/utkusen/socialhunter@latest
    go install github.com/vodafon/waybackrobots@latest
    go install -v github.com/edoardottt/scilla/cmd/scilla@latest
    go install -v github.com/j3ssie/osmedeus@latest
    go install -v github.com/lukasikic/subzy
    go install -v github.com/LukaSikic/subzy@latest > /dev/null 2>&1 && ln -s ~/go/bin/subzy /usr/local/bin/;
    go install -v github.com/mhmdiaa/second-order@latest
    go install -v github.com/owasp-amass/amass/v4/...@master
    go install -v github.com/owasp-amass/amass/v4/...@master > /dev/null 2>&1 && ln -s ~/go/bin/amass /usr/local/bin/ && cd && cd .config && mkdir amass && cd amass && wget https://raw.githubusercontent.com/owasp-amass/amass/master/examples/config.yaml && wget https://raw.githubusercontent.com/owasp-amass/amass/master/examples/datasources.yaml&&cd ~/VPS-tools;
    go install -v github.com/PentestPad/subzy@latest
    go install -v github.com/projectdiscovery/chaos-client/cmd/chaos@latest > /dev/null 2>&1 && ln -s ~/go/bin/chaos /usr/local/bin/;
    go install -v github.com/projectdiscovery/dnsx/cmd/dnsx@latest
    go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
    go install -v github.com/projectdiscovery/mapcidr/cmd/mapcidr@latest
    go install -v github.com/projectdiscovery/mapcidr/cmd/mapcidr@latest > /dev/null 2>&1 && ln -s ~/go/bin/mapcidr /usr/local/bin/;
    go install -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
    go install -v github.com/projectdiscovery/notify/cmd/notify@latest
    go install -v github.com/projectdiscovery/notify/cmd/notify@latest > /dev/null 2>&1 && ln -s ~/go/bin/notify /usr/local/bin/;
    go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest
    go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest > /dev/null 2>&1 && ln -s ~/go/bin/nuclei /usr/local/bin/;
    go install -v github.com/projectdiscovery/shuffledns/cmd/shuffledns@latest
    go install -v github.com/projectdiscovery/shuffledns/cmd/shuffledns@latest > /dev/null 2>&1 && ln -s ~/go/bin/shuffledns /usr/local/bin;
    go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
    go install -v github.com/projectdiscovery/uncover/cmd/uncover@latest
    go install -v github.com/tomnomnom/anew@latest
    go install -v github.com/xm1k3/cent@latest > /dev/null 2>&1 && ln -s ~/go/bin/cent /usr/local/bin/ && cent init;
    go install -v github.com/zan8in/afrog/v2/cmd/afrog@latest > /dev/null 2>&1 && ln -s ~/go/bin/afrog /usr/local/bin/;
    echo 'source $GOPATH/src/github.com/tomnomnom/gf/gf-completion.bash' >> ~/.bashrc	
    cd ~/templates && git clone https://github.com/ghsec/ghsec-jaeles-signatures > /dev/null 2>&1;
    git clone https://github.com/jaeles-project/jaeles-signatures.git > /dev/null 2>&1;
    git clone https://github.com/projectdiscovery/fuzzing-templates.git > /dev/null 2>&1;
    git clone https://github.com/projectdiscovery/nuclei-templates.git > /dev/null 2>&1;
    cd ~/wordlist&&git clone https://github.com/danielmiessler/SecLists.git > /dev/null 2>&1;
    git clone https://github.com/mrco24/mrco24-wordlist.git > /dev/null 2>&1;
    git clone https://github.com/orwagodfather/WordList.git  > /dev/null 2>&1;
    source ~/.bashrc
    echo "All tools have been installed successfully!"



