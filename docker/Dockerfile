FROM php:8.0.6-apache-buster
RUN mv /bin/sh /bin/sh_tmp && ln -s /bin/bash /bin/sh

LABEL maintainer "Office ORA - Keisuke Mutoh <kmutoh@office-ora.com>"
ENV DEBCONF_NOWARNINGS yes

###############################################################################
# apt update
RUN apt-get update

###############################################################################
# install sudo
RUN apt-get install -y sudo

###############################################################################
# install git
RUN apt-get -y install git

###############################################################################
# install required dependencies for Cypress
RUN apt-get -y install libgtk2.0-0 libgtk-3-0 libgbm-dev libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth xvfb

###############################################################################
# install misc packages
RUN apt-get install -y cron unzip procps wget vim certbot

###############################################################################
# install php extensions for laravel8
RUN apt-get install -y zlib1g-dev libpng-dev libicu-dev libxml2-dev libxslt-dev libzip-dev libjpeg-dev libfreetype6-dev

RUN docker-php-ext-install bcmath intl pdo_mysql soap xsl xml zip
RUN docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/
RUN docker-php-ext-install -j$(nproc) gd

###############################################################################
# add sudoer user
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

RUN groupadd -g ${WEB_GROUP_ID} ${WEB_GROUP} && \
    useradd  -g ${WEB_GROUP} -u ${WEB_USER_ID} -G sudo -m -s /bin/bash ${WEB_USER} && \
    echo ${WEB_USER}:${WEB_USER_PASSWORD} | chpasswd

RUN echo 'Defaults visiblepw' >> /etc/sudoers
ARG sudostr0=' ALL=(ALL) NOPASSWD:ALL'
ARG sudostr=$WEB_USER$sudostr0
RUN echo $sudostr
RUN echo ${sudostr} >> /etc/sudoers

###############################################################################
# Composer
COPY --from=composer /usr/bin/composer /usr/bin/composer

###############################################################################
# Node
USER ${WEB_USER}

ENV NVM_DIR /home/${WEB_USER}/.nvm
RUN mkdir ${NVM_DIR}

ARG NVM_VERSION=stable
ENV NVM_VERSION ${NVM_VERSION}
ARG NODE_VERSION=stable
ENV NODE_VERSION ${NODE_VERSION}
ARG INSTALL_NODE=false
ENV INSTALL_NODE ${INSTALL_NODE}
ARG NPM_REGISTRY
ENV NPM_REGISTRY ${NPM_REGISTRY}

# Install nvm (A Node Version Manager)
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v${NVM_VERSION}/install.sh | bash
RUN source $NVM_DIR/nvm.sh && \
    nvm install ${NODE_VERSION} --latest-npm && \
    nvm use ${NODE_VERSION} && \
    nvm alias ${NODE_VERSION} \
    nvm install-latest-npm
RUN if [ ${NPM_REGISTRY} ]; then \
    npm config set registry ${NPM_REGISTRY} \
;fi

# Wouldn't execute when added to the RUN statement in the above block
# Source NVM when loading bash since ~/.profile isn't loaded on non-login shell
RUN echo -e "\
export NVM_DIR=\"\$HOME/.nvm\"\n\
[ -s \"\$NVM_DIR/nvm.sh\" ] && . \"\$NVM_DIR/nvm.sh\"\n\
" >> ~/.bashrc

# Add NVM binaries to root's .bashrc
USER root

RUN echo -e "\
export NVM_DIR=\"\$HOME/.nvm\"\n\
[ -s \"\$NVM_DIR/nvm.sh\" ] && \. \"\$NVM_DIR/nvm.sh\"\n\
" >> ~/.bashrc

# Add PATH for node
ENV PATH $PATH:$NVM_DIR/versions/node/v${NODE_VERSION}/bin

RUN if [ ${NPM_REGISTRY} ]; then \
    . ~/.bashrc && npm config set registry ${NPM_REGISTRY} \
;fi

###############################################################################
# change Timezone to "Asia/Tokyo"
RUN cp /usr/share/zoneinfo/Japan /etc/localtime

###############################################################################
# change Locale to ja_JP.UTF-8
RUN apt-get install -y locales
RUN rm -rf /var/lib/apt/lists/*
RUN echo "ja_JP.UTF-8 UTF-8" > /etc/locale.gen
#RUN ln -s /etc/locale.alias /usr/share/locale/.
RUN locale-gen ja_JP.UTF-8
ENV LC_ALL ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja

USER ${WEB_USER}

RUN echo 'export LC_ALL=ja_JP.UTF-8' >> ~/.bashrc
RUN echo 'export LANG=ja_JP.UTF-8' >> ~/.bashrc
RUN echo 'export LANGUAGE=ja_JP:ja' >> ~/.bashrc

###############################################################################
# prepare apache2
USER root
COPY conf/apache2.conf /etc/apache2/apache2.conf
COPY conf/apache2-envvars /etc/apache2/envvars
COPY conf/site-default.conf /etc/apache2/sites-available/000-default.conf
RUN a2enmod rewrite

###############################################################################
# prepare PHP
#COPY conf/php.ini /usr/local/etc/php/php.ini

###############################################################################
# prepare entrypoint script
COPY entrypoint.sh /home/${WEB_USER}/
RUN chown ${WEB_USER}:${WEB_GROUP} /home/${WEB_USER}/entrypoint.sh
RUN chmod a+x /home/${WEB_USER}/entrypoint.sh

###############################################################################
# Finish!
USER ${WEB_USER}

ARG WORK_PATH=/home/${WEB_USER}
ENV WORK_PATH ${WORK_PATH}/${DEALPACK_DIR}

WORKDIR ${WORK_PATH}
