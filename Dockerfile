FROM m0rf30/arch-yay:latest
LABEL authors="M0Rf30"
COPY resources /resources

RUN /resources/entrypoint.sh

# Perform a clean
RUN yay -Yc --noconfirm
RUN pacman -Rscn yay --noconfirm
RUN yes y | pacman -Scc --noconfirm
USER liquidsoap
