FROM python:3.10.8-slim-buster

# Update sources to use Debian archive since buster is EOL
RUN sed -i 's|http://deb.debian.org/debian|http://archive.debian.org/debian|g' /etc/apt/sources.list \
    && sed -i 's|http://security.debian.org/debian-security|http://archive.debian.org/debian-security|g' /etc/apt/sources.list \
    && apt update && apt upgrade -y

RUN apt install git -y
COPY requirements.txt /requirements.txt

RUN pip3 install -U pip && pip3 install -U -r /requirements.txt
RUN mkdir /DQTheFileDonor
WORKDIR /DQTheFileDonor
COPY start.sh /start.sh

CMD ["/bin/bash", "/start.sh"]
