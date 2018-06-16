FROM m0rf30/arch-yay:latest
LABEL authors="M0Rf30"
COPY resources /resources
RUN /resources/entrypoint.sh
USER liquidsoap
