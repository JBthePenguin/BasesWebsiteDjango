#!/bin/bash

####
# Install https://github.com/JBthePenguin/SimpleWebsiteDjango
# $ source install_simple.sh

# You can pass a new name for the root folder in paramter
# $ source install_simple.sh newname
####

# Colors
Green='\033[0;32m'
BIGreen='\033[1;92m'
Red='\033[0;31m'
BIRed='\033[1;91m'
IRed='\033[0;91m'

# Get the origin path to come back at the end
ORIGIN_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Open GUI to choose the place of the root directory and go inside
ROOT_DIR_PATH="$(zenity --title "Where you want to install your website?" --file-selection --directory)"
cd $ROOT_DIR_PATH

# Download zip file, unzip and remove
wget https://github.com/JBthePenguin/SimpleWebsiteDjango/archive/master.zip
unzip master.zip
rm -r master.zip

# Rename directory with the parameter and go inside the root dir
if [ $# != 0 ]
    then
        mv SimpleWebsiteDjango-master $1
        ROOT_DIR_NAME=$1
    else
        ROOT_DIR_NAME=SimpleWebsiteDjango-master
fi
cd $ROOT_DIR_NAME
# Create a virtual environment and activate it
virtualenv -p python3 env
source env/bin/activate

# Install dependencies
pip install -r requirements.txt

# Make the migrations
python manage.py makemigrations
python manage.py migrate

# Create superuser
echo -e "${Red}\#\#\#"
echo -e "${IRed}Admin register"
echo -e "${Red}\#\#\#${Green}"
python manage.py createsuperuser

# Deactivate the virtual environment and come back to install_scripts folder
deactivate
cd $ORIGIN_PATH
# Install OK
echo -e "${BIGreen}Install is OK!"
echo -e "${Green}Now in the root directory of your website, ${IRed}- \$ ${BIRed}cd ${ROOT_DIR_PATH}/$ROOT_DIR_NAME"
echo -e "${Green}you have to activate the virtual environment ${IRed}- \$ ${BIRed}source env/bin/activate"
echo -e "${Green}then you can start the dev server. ${IRed}- (env)\$ ${BIRed}python manage.py runserver"
