FROM ubuntu:16.04

# Environment variables
ENV domain localhost
ENV LC_CTYPE en_US.UTF-8

# Setup scripts for LibreOffice Online
ADD /scripts/install-libreoffice.sh /
ADD /scripts/start-libreoffice.sh /
RUN bash install-libreoffice.sh

COPY fonts/* /opt/collaboraoffice5.3/share/fonts/truetype/

EXPOSE 9980

# Entry point
CMD bash start-libreoffice.sh
