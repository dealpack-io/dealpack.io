#!/bin/sh

cd $DEALPACK_WORK_PATH
sudo apt update

if [ ! -e $DEALPACK_WORK_PATH/$DEALPACK_DIR/artisan ]; then
    ### clone dealpack-io/dealpack.io.git
    git clone https://github.com/dealpack-io/dealpack.io.git $DEALPACH_DIR

    ### install packages
    cd $DEALPACK_DIR
    composer install

    ### migration
    php artisan migrate --force

    ### install npm packages
    npm install
fi

### build
cd $DEALPACK_WORK_PATH/$DEALPACK_DIR
if [ "$APP_ENV" = "production" ]; then
    npm run prod
elif [ "$APP_ENV" = "development" ]; then
    npm run dev
else
    npm run dev
fi

### start apache2
sudo apache2-foreground
