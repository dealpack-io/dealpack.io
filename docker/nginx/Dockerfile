FROM  nginx:1.19.10-alpine

LABEL maintainer "Office ORA - Keisuke Mutoh <kmutoh@office-ora.com>"
ENV DEBCONF_NOWARNINGS yes

###############################################################################
# add user

ARG WEB_USER=webuser
ENV WEB_USER=${WEB_USER}
ARG WEB_USER_ID=1000
ENV WEB_USER_ID=${WEB_USER_ID}
ARG WEB_GROUP=webuser
ENV WEB_GROUP=${WEB_GROUP}
ARG WEB_GROUP_ID=1000
ENV WEB_GROUP_ID=${WEB_GROUP_ID}
ARG WEB_USER_PASSWORD=bringyourbrain
ENV WEB_USER_PASSWORD=${WEB_USER_PASSWORD}

RUN addgroup -g ${WEB_GROUP_ID} ${WEB_GROUP} && \
    adduser  -G ${WEB_GROUP} -u ${WEB_USER_ID} --disabled-password -s /bin/sh ${WEB_USER}
