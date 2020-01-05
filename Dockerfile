FROM kalilinux/kali-linux-docker

MAINTAINER knucker

# Run Updates
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get dist-upgrade -y &&\
    apt-get autoremove -y 


RUN apt-get install zsh -y
# install oh zsh
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true


# install xorg
RUN apt-get install xorg -y

# install xface4
RUN apt-get install xfce4 -y

# install vnc server
RUN apt install tigervnc-standalone-server tigervnc-viewer -y


CMD ["/bin/zsh", "--init-file", "/etc/profile"]

RUN echo "set-option -g default-shell /bin/zsh" > /etc/tmux.conf

RUN echo "export LC_ALL=en_US.UTF-8" >> /root/.zshrc
RUN echo "export LANG=en_US.UTF-8" >> /root/.zshrc
RUN echo "export TERM=xterm-256color" >> /root/.zshrc

WORKDIR /root/


#copy files to docker

ADD files /root

#install NPM
RUN apt-get install nodejs -y

RUN apt-get install npm -y

RUN mkdir post-exp

#PRIVILLAGE SCRIPTS
WORKDIR /root/post-expa

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

#themes 
RUN apt-get install arc-theme -y

RUN apt install numix-icon-theme-circle -y

#plank
RUN apt-get install plank -y

#add wine32
RUN dpkg --add-architecture i386 && apt-get update && apt-get install wine32 -y


#scirpt to create shells
RUN git clone https://github.com/0x00-0x00/ShellPop.git

#install gobuster
RUN apt-get install gobuster

#nmapautomator
RUN git clone https://github.com/21y4d/nmapAutomator.git
