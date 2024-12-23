#!/bin/bash

sudo apt-get update -y && sudo apt-get dist-upgrade -y
sudo apt install -y python3 python3-pip python3.12-venv
sudo apt install -y cmake seclists
sudo apt install -y pkg-config libssl-dev
sudo rm -f /usr/bin/httpx && sudo apt remove httpx -y
sudo apt-get install chromium python2 python2.7 gem jq python3 python3-pip unzip make gcc libpcap-dev curl build-essential libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev ruby libgmp-dev zlib1g-dev -y 
sudo apt-get install nmap -y
sudo apt-get install wfuzz -y 
sudo apt-get install -y sqlmap 
sudo apt-get install -y nikto 
sudo gem install wpscan 
sudo apt-get install -y software-properties-common unzip wget make python3-pip build-essential git ruby-full python3 libpcap-dev cargo
sudo apt-get install -y ripgrep 

wget https://go.dev/dl/go1.23.3.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.23.3.linux-amd64.tar.gz
echo 'export PATH=$PATH:/usr/local/go/bin:/root/go/bin/' >> ~/.zshrc
echo 'export PATH=$PATH:~/go/bin:/root/go/bin/' >> ~/.zshrc
source ~/.zshrc
go version
rm -rf go1.23.3.linux-amd64.tar.gz
TOOLS_DIRECTORY="/opt/tools"
mkdir -p "$TOOLS_DIRECTORY"
cd "$TOOLS_DIRECTORY" 
#git clone https://github.com/danielmiessler/SecLists.git
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
git clone https://github.com/ameenmaali/urldedupe.git
cd urldedupe
cmake CMakeLists.txt
make
sudo cp urldedupe /usr/local/bin/
cd ..
cd "$TOOLS_DIRECTORY" 
git clone https://github.com/s0md3v/Arjun.git
python3 -m venv arjun-env
source arjun-env/bin/activate
cd Arjun
pip3 install .
cd ..
sudo cp arjun-env/bin/arjun /usr/local/bin/
deactivate
cd "$TOOLS_DIRECTORY" 
git clone https://github.com/xnl-h4ck3r/waymore.git
python3 -m venv waymore-env
source waymore-env/bin/activate
cd waymore
pip3 install .
pip3 install -r requirements.txt
cd ..
sudo cp waymore-env/bin/waymore /usr/local/bin/
deactivate
cd "$TOOLS_DIRECTORY" 
git clone https://github.com/aboul3la/Sublist3r.git
python3 -m venv sublist3r-env
source sublist3r-env/bin/activate
cd Sublist3r
pip3 install .
pip3 install -r requirements.txt
cd ..
sudo cp sublist3r-env/bin/sublist3r /usr/local/bin/
deactivate
cd "$TOOLS_DIRECTORY" 
git clone https://github.com/maurosoria/dirsearch.git --depth 1
python3 -m venv dirsearch-env
source dirsearch-env/bin/activate
cd dirsearch
pip3 install .
pip3 install -r requirements.txt
cd ..
sudo cp dirsearch-env/bin/dirsearch /usr/local/bin/
deactivate
cd "$TOOLS_DIRECTORY" 
git clone https://github.com/ahmedhamdy0x/subextreme.git
cd subextreme
rustup default stable
cargo build --release
sudo cp target/release/subextreme /usr/local/bin/
subextreme -h
cd ..
cd "$TOOLS_DIRECTORY" 
mkdir crawley && cd crawley
wget https://github.com/s0rg/crawley/releases/download/v1.7.10/crawley_v1.7.10_linux_x86_64.tar.gz
tar -xvzf crawley_v1.7.10_linux_x86_64.tar.gz
sudo cp crawley /usr/local/bin/
cd ..
cd "$TOOLS_DIRECTORY" 
git clone https://github.com/ahmedhamdy0x/passurls.git
python3 -m venv passurls-env
source passurls-env/bin/activate
cd passurls
pip3 install .
pip3 install -r requirements.txt
cd ..
sudo cp passurls-env/bin/passurls /usr/local/bin/
deactivate
cd "$TOOLS_DIRECTORY" 
git clone https://github.com/ahmedhamdy0x/VTsubs.git
cd VTsubs
cargo build --release
cargo build
sudo cp target/release/VTsubs /usr/local/bin/vtsubs
sudo chmod +x /usr/local/bin/vtsubs
cd ..
cd "$TOOLS_DIRECTORY" 
wget -q https://github.com/assetnote/kiterunner/releases/download/v1.0.2/kiterunner_1.0.2_linux_amd64.tar.gz
tar -xvzf kiterunner_1.0.2_linux_amd64.tar.gz
sudo mv kr /usr/local/bin
rm -rf kiterunner_1.0.2_linux_amd64.tar.gz
cd "$TOOLS_DIRECTORY" 
python3 -m venv linkfinder-env
source linkfinder-env/bin/activate
git clone https://github.com/GerbenJavado/LinkFinder.git
cd LinkFinder
pip3 install .
pip3 install -r requirements.txt
python setup.py install
sudo cp linkfinder-env/bin/js-beautify /usr/local/bin
deactivate
cd ..
cd "$TOOLS_DIRECTORY" 
python3 -m venv relateddomains-env
source relateddomains-env/bin/activate
git clone https://github.com/gwen001/related-domains
cd related-domains
pip3 install .
pip3 install -r requirements.txt
sudo cp related-domains.py /usr/local/bin
deactivate
cd ..
cd "$TOOLS_DIRECTORY" 
git clone https://github.com/blechschmidt/massdns
cd massdns
make
sudo cp bin/massdns /usr/local/bin
cd ..
cd "$TOOLS_DIRECTORY" 
python3 -m venv favfreak-env
source favfreak-env/bin/activate
git clone https://github.com/devanshbatham/FavFreak
cd FavFreak
pip3 install .
pip3 install -r requirements.txt
deactivate
sudo cp favfreak.py /usr/local/bin
cd ..
cd "$TOOLS_DIRECTORY" 
python3 -m venv secretfinder-env
source secretfinder-env/bin/activate
git clone https://github.com/m4ll0k/SecretFinder
cd SecretFinder
pip3 install .
pip3 install -r requirements.txt
deactivate
sudo cp SecretFinder.py /usr/local/bin
cd ..
cd "$TOOLS_DIRECTORY" 
python3 -m venv linkfinder-env
source linkfinder-env/bin/activate
git clone https://github.com/GerbenJavado/LinkFinder.git
cd LinkFinder
pip3 install .
pip3 install -r requirements.txt
python setup.py install
sudo cp linkfinder-env/bin/js-beautify /usr/local/bin
deactivate
cd ..
cd "$TOOLS_DIRECTORY" 
python3 -m venv paramspider-env
source paramspider-env/bin/activate
git clone https://github.com/devanshbatham/ParamSpider
cd ParamSpider
pip3 install .
pip3 install -r requirements.txt
deactivate
sudo cp paramspider-env/bin/paramspider /usr/local/bin
cd ..
cd "$TOOLS_DIRECTORY" 
wget https://github.com/Edu4rdSHL/findomain/releases/latest/download/findomain-linux.zip 
unzip findomain-linux.zip 
chmod +x findomain 
mv ./findomain /usr/local/bin/findomain 
AMASSVER=$(curl -s https://api.github.com/repos/OWASP/Amass/releases/latest | grep -Po '"tag_name": "\K.*?(?=")')
cd "$TOOLS_DIRECTORY"
wget https://github.com/OWASP/Amass/releases/download/$AMASSVER/amass_linux_amd64.zip 
unzip amass_linux_amd64.zip 
mv amass_linux_amd64/amass /usr/local/bin/ 
cd "$TOOLS_DIRECTORY" 
curl -s https://bootstrap.pypa.io/pip/2.7/get-pip.py -o get-pip.py 
python2 get-pip.py 
cd "$TOOLS_DIRECTORY" 
git clone https://github.com/blechschmidt/massdns.git 
cd massdns 
make 
ln -s "$TOOLS_DIRECTORY/massdns/bin/massdns" /usr/local/bin/ 
cd "$TOOLS_DIRECTORY" 
git clone https://github.com/robertdavidgraham/masscan 
cd masscan 
make 
make install 
mv bin/masscan /usr/local/bin/ 
cd $TOOLS_DIRECTORY 
git clone https://github.com/xnl-h4ck3r/xnLinkFinder.git 
cd xnLinkFinder 
python3 setup.py install 
cd "$TOOLS_DIRECTORY" 
wget https://github.com/devploit/dontgo403/releases/download/0.5/dontgo403_linux_amd64 
chmod +x dontgo403_linux_amd64 
mv dontgo403_linux_amd64 /usr/local/bin/dontgo403 
cd $TOOLS_DIRECTORY 
git clone https://github.com/s0md3v/Corsy 
python3 -m venv corsy-env
source corsy-env/bin/activate
cd Corsy 
pip3 install requests 
pip3 install corscanner 
deactivate
cd $TOOLS_DIRECTORY 
git clone https://github.com/kleiton0x00/ppmap.git 
cd ppmap 
bash setup.sh 
cd $TOOLS_DIRECTORY 
git clone https://github.com/D35m0nd142/LFISuite.git 
cd $TOOLS_DIRECTORY 
git clone https://github.com/swisskyrepo/SSRFmap 
python3 -m venv ssrf-env
source ssrf-env/bin/activate
cd SSRFmap 
pip3 install -r requirements.txt 
deactivate
cd $TOOLS_DIRECTORY 
git clone https://github.com/tarunkant/Gopherus.git 
cd Gopherus
chmod +x install.sh 
./install.sh 
cd $TOOLS_DIRECTORY 
git clone https://github.com/Th0h0/autossrf.git
python3 -m venv assrf-env
source assrf-env/bin/activate
cd autossrf 
pip3 install -r requirements.txt 
deactivate
cd $TOOLS_DIRECTORY 
git clone https://github.com/epinna/tplmap.git 
python3 -m venv tplmap-env
source tplmap-env/bin/activate
cd tplmap 
pip install -r requirements.txt 
deactivate
cd $TOOLS_DIRECTORY 
git clone https://github.com/s0md3v/XSStrike 
python3 -m venv xsstrike-env
source xsstrike-env/bin/activate
cd XSStrike 
pip3 install -r requirements.txt
deactivate
cd $TOOLS_DIRECTORY 
git clone https://github.com/codingo/NoSQLMap.git 
cd NoSQLMap 
python setup.py install 
cd $TOOLS_DIRECTORY 
git clone https://github.com/jaeles-project/jaeles-signatures.git 
cd $TOOLS_DIRECTORY 
git clone https://github.com/0ang3el/aem-hacker.git 
python3 -m venv aem-env
source aem-env/bin/activate
cd aem-hacker 
pip3 install -r requirements.txt 
deactivate
cd $TOOLS_DIRECTORY 
git clone https://github.com/six2dez/OneListForAll.git 
cd $TOOLS_DIRECTORY 
git clone https://github.com/obheda12/GitDorker.git 
python3 -m venv gitdorker-env
source gitdorker-env/bin/activate
cd GitDorker 
pip3 install -r requirements.txt 
deactivate
cd $TOOLS_DIRECTORY 
git clone https://github.com/hisxo/gitGraber.git 
python3 -m venv gitgraber-env
source gitgraber-env/bin/activate
cd gitGraber 
pip3 install -r requirements.txt 
deactivate
cd $TOOLS_DIRECTORY 
git clone https://github.com/internetwache/GitTools.git 
cd $TOOLS_DIRECTORY 
git clone https://github.com/securing/DumpsterDiver.git 
python3 -m venv dumpsterdiver-env
source dumpsterdiver-env/bin/activate
cd DumpsterDiver 
pip3 install -r requirements.txt 
deactivate
cd $TOOLS_DIRECTORY 
git clone https://github.com/americanexpress/earlybird.git 
cd earlybird 
./build.sh 
./install.sh 
cd $TOOLS_DIRECTORY 
git clone https://github.com/codingo/Interlace.git 
cd Interlace 
python3 setup.py install 
cd $TOOLS_DIRECTORY 
git clone https://github.com/1ndianl33t/Gf-Patterns
go install github.com/projectdiscovery/pdtm/cmd/pdtm@latest
pdtm -ia
go install github.com/projectdiscovery/httpx/cmd/httpx@latest
go install github.com/hahwul/dalfox/v2@latest
go install github.com/vodafon/waybackrobots@latest
go install -v github.com/projectdiscovery/notify/cmd/notify@latest
go install github.com/edoardottt/csprecon/cmd/csprecon@latest
go install github.com/shenwei356/rush@latest
go install github.com/lc/gau/v2/cmd/gau@latest
go install -v github.com/mhmdiaa/second-order@latest
go install -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest
go install github.com/tomnomnom/httprobe@latest
go install github.com/utkusen/socialhunter@latest
go install github.com/003random/getJS/v2@latest
go install -v github.com/projectdiscovery/shuffledns/cmd/shuffledns@latest
go install -v github.com/j3ssie/osmedeus@latest
go install -v github.com/tomnomnom/assetfinder@latest
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install -v github.com/tomnomnom/hacks/filter-resolved@latest
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
go install -v github.com/tomnomnom/httprobe@latest
go install -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
go install github.com/Ractiurd/jscracker@latest
go install github.com/projectdiscovery/katana/cmd/katana@latest
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
go install github.com/lc/subjs@latest 
ln -s ~/go/bin/subjs /usr/local/bin/ 
go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest 
ln -s ~/go/bin/subfinder /usr/local/bin/ 
go install github.com/tomnomnom/assetfinder@latest 
ln -s ~/go/bin/assetfinder /usr/local/bin/ 
go install github.com/gwen001/github-subdomains@latest 
ln -s ~/go/bin/github-subdomains /usr/local/bin/ 
go install github.com/gwen001/gitlab-subdomains@latest 
ln -s ~/go/bin/gitlab-subdomains /usr/local/bin/ 
go install github.com/cgboal/sonarsearch/cmd/crobat@latest 
ln -s ~/go/bin/crobat /usr/local/bin/ 
go install github.com/projectdiscovery/dnsx/cmd/dnsx@latest 
ln -s ~/go/bin/dnsx /usr/local/bin/ 
go install github.com/d3mondev/puredns/v2@latest 
ln -s ~/go/bin/puredns /usr/local/bin/ 
go install github.com/projectdiscovery/httpx/cmd/httpx@latest
ln -s ~/go/bin/httpx /usr/local/bin/ 
go install github.com/tomnomnom/httprobe@latest 
ln -s ~/go/bin/httprobe /usr/local/bin/ 
go install -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest 
ln -s ~/go/bin/naabu /usr/local/bin/ 
go install -v github.com/s0md3v/smap/cmd/smap@latest 
ln -s ~/go/bin/smap /usr/local/bin/ 
go install github.com/jaeles-project/gospider@latest 
ln -s ~/go/bin/gospider /usr/local/bin/ 
go install github.com/hakluke/hakrawler@latest 
ln -s ~/go/bin/hakrawler /usr/local/bin/ 
go install github.com/projectdiscovery/katana/cmd/katana@latest 
ln -s ~/go/bin/katana /usr/local/bin/ 
go install github.com/ffuf/ffuf@latest 
ln -s ~/go/bin/ffuf /usr/local/bin/ 
go install github.com/OJ/gobuster/v3@latest 
ln -s ~/go/bin/gobuster /usr/local/bin/ 
go install github.com/musana/fuzzuli@latest 
ln -s ~/go/bin/fuzzuli /usr/local/bin/ 
go install -v github.com/projectdiscovery/interactsh/cmd/interactsh-client@latest 
ln -s ~/go/bin/interactsh-client /usr/local/bin/ 
go install github.com/hahwul/dalfox/v2@latest 
ln -s ~/go/bin/dalfox /usr/local/bin/
go install github.com/tomnomnom/hacks/kxss@latest 
ln -s ~/go/bin/kxss /usr/local/bin/
go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest 
ln -s ~/go/bin/nuclei /usr/local/bin/ 
nuclei -update-templates 
GO111MODULE=on go install github.com/jaeles-project/jaeles@latest 
ln -s ~/go/bin/jaeles /usr/local/bin/ 
go install github.com/lc/gau/v2/cmd/gau@latest  
ln -s ~/go/bin/gau /usr/local/bin/
go install github.com/tomnomnom/hacks/anti-burl@latest  
ln -s ~/go/bin/anti-burl /usr/local/bin/
go install github.com/tomnomnom/unfurl@latest  
ln -s ~/go/bin/unfurl /usr/local/bin/
go install github.com/tomnomnom/anew@latest  
ln -s ~/go/bin/anew /usr/local/bin/
go install github.com/tomnomnom/gron@latest  
ln -s ~/go/bin/gron /usr/local/bin/
go install github.com/tomnomnom/qsreplace@latest  
ln -s ~/go/bin/qsreplace /usr/local/bin/

openssl x509 -inform DER -in ~/burp.der -out ~/burp-ca.crt
sudo cp burp-ca.crt /usr/local/share/ca-certificates/
sudo update-ca-certificates
