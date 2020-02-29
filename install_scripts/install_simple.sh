#!/bin/bash

####
# Install https://github.com/JBthePenguin/SimpleWebsiteDjango
# $ source install_simple.sh

# You can pass a new name for the root folder in paramter
# $ source install_simple.sh newname
####

# Download zip file, unzip and remove
wget https://github.com/JBthePenguin/SimpleWebsiteDjango/archive/master.zip
unzip master.zip
rm -r master.zip

# rename directory with the parameter and go inside the root dir
if [ $# != 0 ]
    then
        mv SimpleWebsiteDjango-master $1
        cd $1
    else
        cd SimpleWebsiteDjango-master
fi

# create a virtual environment and activate it
virtualenv -p python3 env
source env/bin/activate

# install dependencies
pip install -r requirements.txt

# make the migrations
python manage.py makemigrations
python manage.py migrate

# create superuser
echo \#\#\#
echo Admin register
echo \#\#\#

python manage.py createsuperuser

# Install OK
echo Install is OK!
echo Now you can start the server with the command --- python manage.py runserver
