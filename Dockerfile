FROM ubuntu:latest

USER root

# set local
# RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
# 	&& localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
# ENV LANG en_US.utf8

# install packages
COPY package_list.txt /tmp/package_list.txt
RUN apt-get update && apt-get install -y $(cat /tmp/package_list.txt | tr '\n' ' ')

ENTRYPOINT ["/bin/bash"]
