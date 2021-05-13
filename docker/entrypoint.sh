#!/bin/sh

cd $DEALPACK_WORK_PATH
sudo apt update

cd $DEALPACK_DIR
if [ ! -d ${DEALPACK_WORK_PATH}/${DEALPACK_DIR}/vendor ]; then
    ### install packages
    composer install
fi

### migration
php artisan migrate --force

if [ ! -d ${DEALPACK_WORK_PATH}/${DEALPACK_DIR}/node_modules ]; then
    ### install npm packages
    npm install
fi

### build
if [ "$APP_ENV" = "production" ]; then
    npm run prod
elif [ "$APP_ENV" = "development" ]; then
    npm run dev
else
    npm run dev
fi

### start apache2
sudo apache2-foreground
