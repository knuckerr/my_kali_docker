FROM kalilinux/kali-rolling

MAINTAINER knucker

# Run Updates
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get dist-upgrade -y &&\
    apt-get autoremove -y 


RUN DEBIAN_FRONTEND=noninteractive apt-get install kali-linux-large -y
RUN apt-get update && apt-get install zsh -y
RUN apt-get install ncat -y

# install oh zsh
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true


# install xorg
RUN apt-get install xorg -y

# install xface4
RUN apt install kali-desktop-xfce -y

# install vnc server
RUN apt install tigervnc-standalone-server tigervnc-viewer -y


CMD ["/usr/bin/zsh", "--init-file", "/etc/profile"]

RUN echo "set-option -g default-shell /usr/bin/zsh" > /etc/tmux.conf

RUN echo "export LC_ALL=en_US.UTF-8" >> /root/.zshrc
RUN echo "export LANG=en_US.UTF-8" >> /root/.zshrc
RUN echo "export TERM=xterm-256color" >> /root/.zshrc

WORKDIR /root/


#copy files to docker

ADD files /root



#PRIVILLAGE SCRIPTS
WORKDIR /root/post-exp

RUN apt-get install git -y

RUN git clone https://github.com/rebootuser/LinEnum.git

RUN wget https://www.securitysift.com/download/linuxprivchecker.py

RUN git clone https://github.com/M4ximuss/Powerless

RUN wget https://web.archive.org/web/20080530012252/http://live.sysinternals.com/accesschk.exe

RUN git clone https://github.com/HarmJ0y/PowerUp

RUN git clone https://github.com/mzet-/linux-exploit-suggester

RUN git clone https://github.com/bitsadmin/wesng
RUN git clone https://github.com/411Hall/JAWS

RUN git clone https://github.com/samratashok/nishang



#add pip
RUN apt-get install python-pip -y
#ADD jedi
RUN pip install jedi

WORKDIR /root/

#pwndbg
RUN git clone https://github.com/pwndbg/pwndbg


#plank
RUN apt-get install plank -y


#scirpt to create shells
RUN git clone https://github.com/0x00-0x00/ShellPop.git

#install gobuster
RUN apt-get install gobuster

#nmapautomator
RUN git clone https://github.com/21y4d/nmapAutomator.git

RUN apt-get install firefox-esr -y

RUN dpkg --add-architecture i386 && apt-get update
RUN apt-get reinstall libgcc-s1:i386 -y
RUN apt-get install wine32 -y

RUN echo en_US.UTF-8 UTF-8 > /etc/locale.gen
RUN locale-gen en_US.UTF-8


RUN apt-get install python3.8-dev -y

WORKDIR /root/pwndbg
RUN ./setup.sh

WORKDIR /root/
RUN git clone https://github.com/Hackplayers/evil-winrm

WORKDIR /root/evil-winrm
RUN gem install evil-winrm

 
WORKDIR /root/
RUN git clone https://github.com/SecureAuthCorp/impacket

WORKDIR /root/impacket

RUN pip install .

RUN gunzip /usr/share/wordlists/rockyou.txt.gz

WORKDIR /root/

RUN git clone https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite.git
