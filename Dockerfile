# Copyright 2019 - 2021 The MathWorks, Inc.

# To specify which MATLAB release to install in the container, edit the value of the MATLAB_RELEASE argument.
# Use lower case to specify the release, for example: ARG MATLAB_RELEASE=r2020a
ARG MATLAB_RELEASE=r2023a

# When you start the build stage, this Dockerfile by default uses the Ubuntu-based matlab-deps image.
# To check the available matlab-deps images, see: https://hub.docker.com/r/mathworks/matlab-deps
FROM mathworks/matlab-deps:${MATLAB_RELEASE}

# Declare the global argument to use at the current build stage
ARG MATLAB_RELEASE

# Install mpm dependencies
RUN export DEBIAN_FRONTEND=noninteractive && apt-get update && \
    apt-get install --no-install-recommends --yes \
    wget \
    unzip \
    ca-certificates && \
    apt-get clean && apt-get autoremove

# Run mpm to install MATLAB in the target location and delete the mpm installation afterwards
RUN wget -q https://www.mathworks.com/mpm/glnxa64/mpm && \ 
    chmod +x mpm && \
    ./mpm install \
    --release=${MATLAB_RELEASE} \
    --destination=/opt/matlab \
    --products MATLAB MATLAB_Compiler MATLAB_Compiler_SDK && \
    rm -f mpm /tmp/mathworks_root.log && \
    ln -s /opt/matlab/bin/matlab /usr/local/bin/matlab

# Add "matlab" user and grant sudo permission.
RUN adduser --shell /bin/bash --disabled-password --gecos "" matlab && \
    echo "matlab ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/matlab && \
    chmod 0440 /etc/sudoers.d/matlab

# Copy the license file
COPY license.lic opt/matlab/licenses/

# Set user and work directory
USER matlab
WORKDIR /opt/src/
CMD ["bash"]

