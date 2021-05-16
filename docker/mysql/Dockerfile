FROM mysql:latest

LABEL maintainer "Office ORA - Keisuke Mutoh <kmutoh@office-ora.com>"
ENV DEBCONF_NOWARNINGS yes

###############################################################################
# apt update
RUN apt-get update

###############################################################################
# install mecab & ipadic
RUN apt install -y mecab libmecab-dev mecab-ipadic-utf8

COPY myipadic/ /var/lib/mecab/dic/myipadic/
COPY mecabrc /etc/
COPY init.sql /docker-entrypoint-initdb.d/init.sql
