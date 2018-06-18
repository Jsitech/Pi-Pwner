# Pi-Pwner
                                                             
Pentesting Suite Deployer for Raspbian Stretch

Developed By Jason Soto @Jsitech"


## Remember

Running the tools on this suite without prior mutual consent is Illegal. It is the END user responsibility to obey all applicable Laws. Author assume no liability and is not responsible for any misuse of these tools. 

## What is Needed

1. Raspberry Pi
2. MicroSD card of at least 8GB
3. Raspbian Stretch, you can get it at https://www.raspberrypi.org/downloads/raspbian/
4. Console and internet Access

## A little about Pi-Pwner

Pi-Pwner is a bash script that will load a comprehensive suite of pentesting tools and scripts onto a Raspberry Pi
running Raspbian Stretch. At the end of the Deployments you will have a set of tools that will help during a penetration testing engagement to perform information gathering, sniffing, spoofing, wireless attacks, post-exploitation and more.

Given the size of the Raspberry, it can be used as a Drop box on a network. Plug in a power bank and drop it out of site, etc. To make this functional i will be adding phone home functionality.

Pi-Pwner loads tools like:

* Kismet
* aircrack-ng
* nmap
* sqlmap
* macchanger
* Bettercap
* nikto
* Responder
* dmitry
* yersinia
* Metasploit-Framework
* And much more

Other tools and scripts include:

* theHarvester
* Exploit-Database
* Golismero
* RouterSploit
* Relayer (Automated SMB Relay attack Script)
* One-Lin3r
* And more

This is just a small list and the plans are to extend the capabilities of Pi_Pwner. I will be creating a blog explaining some uses of the tools loaded.

## Deploying Pi-Pwner

Clone the github repo and run the Script

```
git clone https://github.com/jsitech/Pi-Pwner
cd Pi-Pwner
./Pi-Pwner.sh

```
## Issues or Feature request

If you encounter any issues or feel we are missing something, Please open up an issue on Github. Pull request are
also very welcome.

## ChangeLog

v1.0 - Initial Release


Developed by ***Jason Soto***

https://www.jasonsoto.com

https://github.com/jsitech

Twitter = [**@JsiTech**](http://www.twitter.com/JsiTech)