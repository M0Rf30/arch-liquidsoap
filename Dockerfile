FROM m0rf30/arch-yay:latest
LABEL authors="M0Rf30"
RUN yay -Syu --noconfirm
RUN yay -S liquidsoap --noconfirm
RUN yay -Yc --noconfirm
RUN yes y | yay -Scc
USER liquidsoap
