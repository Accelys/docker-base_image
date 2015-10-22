# Use phusion/baseimage as base image.
FROM phusion/baseimage:0.9.17

MAINTAINER Emmanuel Brendel <emmanuel.b@gmail.com>

# Set correct environment variables
ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root
ENV LC_ALL C.UTF-8
ENV LANG fr_FR.UTF-8
ENV LANGUAGE fr_FR.UTF-8

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# Install base packages
RUN apt-get update
RUN apt-get -y upgrade \
    && apt-get -y  --no-install-recommends install \
      ca-certificates \
      curl \
      wget \
    && apt-get -y autoremove \
    && apt-get clean all

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*