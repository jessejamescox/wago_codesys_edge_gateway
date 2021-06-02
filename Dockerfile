# MIT License

# Copyright (c) 2021 Jesse Cox

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

FROM debian:stable-slim

# Author
LABEL maintainer="Jesse Cox - WAGO Corp. USA"
ARG EDGE_VERSION=4.0.1.0


# Replace the args to lock to a specific version
COPY codesysedge_edgearmhf_${EDGE_VERSION}_armhf.deb .

# updte and upgrade the apt sources list
RUN apt update && apt upgrade -y

# change permissions and install the deb package
RUN chmod 650 codesysedge_edgearmhf_${EDGE_VERSION}_armhf.deb && \
    apt install ./codesysedge_edgearmhf_${EDGE_VERSION}_armhf.deb && \
    chmod 650 /etc/init.d/codesysedge 

# replace the config file
COPY Gateway.cfg /etc/Gateway.cfg

# Entrypoint script to install and run Greengrass
COPY "gateway-entrypoint.sh" /
RUN chmod 650 gateway-entrypoint.sh

ENTRYPOINT ["./gateway-entrypoint.sh"]