FROM base/archlinux:latest
LABEL authors="M0Rf30"
COPY resources /resources

# Base installation
RUN pacman -Syyu base-devel --noconfirm
RUN yes y | pacman -U /resources/yay-5.675-1-x86_64.pkg.tar

# Add user, group sudo
RUN /usr/sbin/groupadd --system sudo && \
    /usr/sbin/useradd -m --groups sudo user && \
    /usr/sbin/sed -i -e "s/Defaults    requiretty.*/ #Defaults    requiretty/g" /etc/sudoers && \
    /usr/sbin/echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Set correct locale
RUN echo "LC_ALL=en_US.UTF-8" >> /etc/environment && \
    echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && \
    echo "LANG=en_US.UTF-8" > /etc/locale.conf

RUN /resources/entrypoint.sh

# Perform a clean
RUN yay -Yc --noconfirm
RUN pacman -Rscn yay --noconfirm
RUN yes y | pacman -Scc --noconfirm

RUN /usr/sbin/groupdel sudo && \
    /usr/sbin/userdel -f user && \
    /usr/sbin/sed -i -e "s/#Defaults    requiretty.*/ Defaults    requiretty/g" /etc/sudoers

RUN locale-gen en_US.UTF-8
ENV LC_CTYPE 'en_US.UTF-8'

USER liquidsoap
