#!/bin/bash
# Pi-Pwner 1.0 : A Raspberry Pi Pentesting Suite Deployer by Jason Soto
# jasonsoto.com
# jsitech-sec.com


##############################################################################################################

f_banner(){
echo
echo "

██████╗ ██╗      ██████╗ ██╗    ██╗███╗   ██╗███████╗██████╗ 
██╔══██╗██║      ██╔══██╗██║    ██║████╗  ██║██╔════╝██╔══██╗
██████╔╝██║█████╗██████╔╝██║ █╗ ██║██╔██╗ ██║█████╗  ██████╔╝
██╔═══╝ ██║╚════╝██╔═══╝ ██║███╗██║██║╚██╗██║██╔══╝  ██╔══██╗
██║     ██║      ██║     ╚███╔███╔╝██║ ╚████║███████╗██║  ██║
╚═╝     ╚═╝      ╚═╝      ╚══╝╚══╝ ╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝
                                                             
Pentesting Suite Deployer for Raspbian Stretch
Developed By Jason Soto @Jsitech"
echo
echo

}

pipwner_home=$(pwd)
##############################################################################################################
# Check if running with root User

clear
f_banner


check_root() {
if [ "$USER" != "root" ]; then
      echo "Permission Denied"
      echo "Can only be run by root"
      exit
else
      clear
      f_banner
      cat templates/texts/pi-pwner_initial
      echo "Press Enter to continue, CTRL+C to abort"
      read INPUT
      echo ""
      #Setting Pi_Pwner motd
      cp templates/motd /etc/motd
fi
}

##############################################################################################################
# Update Rasbian
clear
f_banner

update_raspbian(){
echo "[+] Updating Raspbian......."
apt -y update
apt -y upgrade
echo ""
echo "[+] Raspbian Updated"
}

##############################################################################################################
# Install some dependencies and Pentesting tools
clear
f_banner

install_dep_tools(){
echo "[+] Installing some Dependencies and Base Pentesting tools......"
apt install -y kismet aircrack-ng proxychains hping3 git nmap dsniff python3-pip netcat medusa nbtscan john libncurses5-dev yersinia smbclient sslstrip python-pip telnet macchanger openvpn hydra sqlmap wifite nikto python-scapy btscanner p0f dnswalk mitmproxy dnstracer dmitry libffi-dev libssl-dev libcap-dev python-dev
mkdir /opt/pentest
echo ""
echo "[+] Dependencies and Base Pentesting tools installed....."
echo ""
}
##############################################################################################################
# Install Pentesting tools and Script on /opt/pentest

clear
f_banner

install_pentest_tools(){

cd /opt/pentest/

echo "[+] Installing Pentesting tools and Scripts to /opt/pentest......"
echo ""
echo "[+] Installing theHarvester to /opt/pentest......"
git clone https://github.com/laramies/theHarvester /opt/pentest/theHarvester
pip install requests
ln -s /opt/pentest/theHarvester/theHarvester.py /usr/sbin/theHarvester
echo "[+] theHarvester installed"

clear
f_banner

echo "[+] Installing Exploit-Database to /opt/pentest......"
echo ""
git clone https://github.com/offensive-security/exploit-database /opt/pentest/exploit-database
ln -s /opt/pentest/exploit-database/searchsploit /usr/sbin/searchsploit
echo "[+] Exploit-Database installed"

clear
f_banner

echo "[+] Installing Metasploit......"
echo ""
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && \
  chmod 755 msfinstall && \
  ./msfinstall
echo "[+] Metasploit installed"

clear
f_banner

echo "[+] Installing Responder to /opt/pentest......"
echo ""
git clone https://github.com/SpiderLabs/Responder /opt/pentest/responder
ln -s /opt/pentest/responder/Responder.py /usr/sbin/responder
echo "[+] Responder installed"

clear
f_banner

echo "[+] Cloning Impacket and Setting Up"
echo ""
git clone https://github.com/coresecurity/impacket /opt/pentest/impacket  
pip install -r impacket/requirements.txt
cd impacket/
python setup.py install
cd ..
echo ""
echo "[+] Impacket installed"

clear
f_banner

echo "[+] Cloning Relayer to /opt/pentest......"
echo ""
echo "[+] Relayer is an Automated SMB Relay Attack Script"
echo ""
git clone https://github.com/jsitech/relayer /opt/pentest/relayer
cd relayer/
./install_req.sh
cd ..
echo "[+] Relayer installed"

clear
f_banner

echo "[+] Setting up GO and installing Bettercap...."
echo ""
wget https://storage.googleapis.com/golang/go1.8.linux-armv6l.tar.gz
tar -C /usr/local -xzf go1.8.linux-armv6l.tar.gz
apt upgrade -y libpcap-dev
export GOPATH=/usr/local/go/bin
export PATH=$PATH:$GOPATH
echo "export GOPATH=/usr/local/go/bin" >> /etc/profile
echo "export PATH=$PATH:$GOPATH" >> /etc/profile
go get github.com/bettercap/bettercap
ln -s /usr/local/go/bin/bin/bettercap /usr/sbin/bettercap
echo ""
echo "[+] Bettercap installed"

clear
f_banner

echo "[+] Installing Golismero....."
echo ""
git clone https://github.com/golismero/golismero.git /opt/pentest/golismero
cd golismero
pip install -r requirements.txt
pip install -r requirements_unix.txt
cd ..
ln -s /opt/golismero/golismero.py /usr/bin/golismero
echo ""
echo "[+] Golismero installed"

clear
f_banner

echo "[+] Installing RouterSploit..."
echo ""
git clone https://www.github.com/threat9/routersploit /opt/pentest/routersploit
cd routersploit
python3 -m pip install -r requirements.txt
pip3 install future
cd ..
ln -s /opt/pentest/routersploit/rsf.py /usr/sbin/rsf
echo ""
echo "[+] RouterSploit Installed"

clear
f_banner

echo "[+] Installing One-Lin3r...."
echo ""
git clone https://github.com/D4Vinci/One-Lin3r
cd One-Lin3r/
python setup.py install
cd ..
echo ""
echo "[+] One-Lin3r installed"

clear
f_banner

echo "[+] Installing Social Engineer Toolkit...."
echo ""
git clone https://github.com/trustedsec/social-engineer-toolkit /opt/pentest/social-engineer-toolkit
cd social-engineer-toolkit/
python setup.py install
cd ..
echo ""
echo "[+] Social Engineer Toolkit Installed"
}
##############################################################################################################
# Final Steps

final_steps(){
clear
cd $pipwner_home
cat templates/texts/pi-pwner_finish
}

check_root                     # Check for Root User
update_raspbian                # Update Raspbian
install_dep_tools              # Install Dependencies and Base Pentesting tools
install_pentest_tools          # Install Pentesting Tools to /opt/pentest
final_steps                    # Final Steps
