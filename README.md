### Scripts to install a starting point for a django website

#### List of available bases

* [A simple starting base](https://github.com/JBthePenguin/SimpleWebsiteDjango)
* ...

#### Install with bash script
*You need [virtualenv](https://virtualenv.pypa.io/en/stable/) installed.*

Clone me, place you in install_scripts and use source to execute the desired install script with a new name in parameter. 
For example, with the simple base:
```sh
git clone https://github.com/JBthePenguin/BasesWebsiteDjango.git
cd install_scripts
source install_simple.sh YourWebsite
```
First you are asked to choose the place for the root directory of your website, and after you have to register the superuser at the end of the installation.  
  
Now you can start the server in your new root directory with the virtual environment activated:
```sh
(env)$ python manage.py runserver
```
