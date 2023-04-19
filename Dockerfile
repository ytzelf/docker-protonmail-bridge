FROM shenxn/protonmail-bridge

# Use baseimage-docker's init system.
# CMD ["/sbin/my_init"]

# Install pip
RUN apt-get update \
    && apt-get -qq install python3-distutils curl \
    && curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py \
    && python3 get-pip.py

# Install IMAPClient
RUN pip3 install IMAPClient

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
