FROM gui-apps-base:18.04
MAINTAINER Gabriel Ionescu <gabriel.ionescu@gameloft.com>

RUN apt-get update \
 && apt-get install -y \
        libcurl4 \
        libsodium23 \
        libxi6 \
        libxtst6 \
        python-pyqt5.qtx11extras \
        keepassxc \
 && apt-get clean -y \
 && apt-get autoclean -y \
 && apt-get autoremove -y

# SET USER
USER $DOCKER_USERNAME

# ENTRYPOINT
ENTRYPOINT /usr/bin/keepassxc

