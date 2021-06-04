FROM debian:stable-slim

# Author
LABEL maintainer="Jesse Cox - WAGO Corp. USA"
ARG EDGE_VERSION=4.0.1.0

# Replace the args to lock to a specific version
COPY codesysedge_edgearmhf_${EDGE_VERSION}_armhf.deb /

# updte and upgrade the apt sources list
RUN apt update && apt upgrade -y

# change permissions and install the deb package
RUN chmod 777 codesysedge_edgearmhf_${EDGE_VERSION}_armhf.deb && \
    chown _apt:root codesysedge_edgearmhf_${EDGE_VERSION}_armhf.deb && \
    apt install ./codesysedge_edgearmhf_${EDGE_VERSION}_armhf.deb

# replace the config file
COPY Gateway.cfg /etc/Gateway.cfg

RUN ln -s /etc/init.d/codesysedge /bin/codesysedge

# restart the codesysedge to invoke the Maintenance mode
# and keep alive forever
CMD codesysedge restart && sleep infinity