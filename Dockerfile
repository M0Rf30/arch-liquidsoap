FROM arch-yay:latest
LABEL authors="M0Rf30"
COPY entrypoint.sh /
RUN /entrypoint.sh
