FROM m0rf30/arch-yay:latest
LABEL authors="M0Rf30"
RUN yay -Syu --noconfirm
RUN yay -S ocaml-base-git --noconfirm
RUN yay -S liquidsoap --noconfirm
RUN yay -Yc --noconfirm
RUN yay -Rscn $(pacman -Qdqt)
RUN yes y | yay -Scc
USER liquidsoap
