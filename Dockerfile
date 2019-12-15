FROM m0rf30/arch-yay:latest
LABEL authors="M0Rf30"
RUN yay -Syu --noconfirm \
&& yay -S liquidsoap --noconfirm \
&& rm -rf /tmp/yaytmp-1000/
&& rm -rf /var/cache/pacman/pkg/*
USER liquidsoap
