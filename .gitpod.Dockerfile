FROM gitpod/workspace-full

# Install custom tools, runtimes, etc.
# For example "bastet", a command-line tetris clone:
# RUN brew install bastet
#
# More information: https://www.gitpod.io/docs/config-docker/

RUN sudo env -i DEBIAN_FRONTEND=noninteractive sh -c 'apt-get update; apt-get -y install ccache qt5-default; rm -rf /var/apt/lists/*'

RUN curl -sSfO https://download.build2.org/0.13.0/build2-install-0.13.0.sh \
    && sh build2-install-0.13.0.sh --cxx g++ --yes --trust yes /opt/build2 \
    && rm -rf build2*

RUN pip install --user compiledb

ENV PATH=/opt/build2/bin:$PATH