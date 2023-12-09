#FROM ubuntu:jammy
FROM ubuntu:jammy

# update and install software
RUN export DEBIAN_FRONTEND=noninteractive  \
	&& apt-get update -qy \
	&& apt-get full-upgrade -qy \
	&& apt-get dist-upgrade -qy \
	&& apt-get install -qy \
        sudo wget curl unzip tar git xz-utils apt-utils openssh-server build-essential software-properties-common \
        openjdk-17-jdk openjdk-17-jre nano tigervnc-standalone-server python3-pip novnc net-tools  \
        x11vnc dbus-x11 lsb-release ca-certificates apt-transport-https cinnamon*

# Fix en_US.UTF-8
RUN apt-get install locales -qy \
	&& echo "LC_ALL=en_US.UTF-8" >> /etc/environment \
	&& echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
	&& echo "LANG=en_US.UTF-8" > /etc/locale.conf \
	&& locale-gen en_US.UTF-8 


# user and groups
ENV USER shakugan
ENV PASSWORD AliAly032230
RUN useradd -m $USER -p $(openssl passwd $PASSWORD) \
    && usermod -aG sudo $USER \
    && echo "${USER}:${PASSWORD}" | chpasswd \
    && echo "${USER} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers \
    && chsh -s /bin/bash $USER

# config vnc
#RUN mkdir /home/$USER/.vnc \
#    && echo $PASSWORD | vncpasswd -f > /home/$USER/.vnc/passwd \
#    && chmod 0600 /home/$USER/.vnc/passwd \
#    && chown -R $USER:$USER /home/$USER/.vnc

# command desktop
ENV DISPLAY=:0 \
    SCR_WIDTH=1600 \
    SCR_HEIGHT=900 \
    SCR_DEPTH=32 \
    SHELL=/bin/bash \
    HOME=/home/${USER} \
    XDG_RUNTIME_DIR=/run/${USER}

EXPOSE 6080 3389 5900

#CMD service dbus start && /usr/lib/systemd/systemd-logind & service xrdp start && /startvnc && /usr/share/novnc/utils/launch.sh --listen 6080 --vnc localhost:5902 && bash
CMD Xvnc :0 -SecurityTypes none -AlwaysShared & /usr/share/novnc/utils/launch.sh  --listen 6080 --vnc localhost:5901 & cinnamon
