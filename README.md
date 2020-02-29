### Scripts to install a starting point for a django website

#### List of available bases

* [A simple starting base](https://github.com/JBthePenguin/SimpleWebsiteDjango)
* ...

#### Install with bash script
*You need [virtualenv](https://virtualenv.pypa.io/en/stable/) installed.*

Clone me, go in the folder *install_scripts* and use the command ***source*** to execute the desired install script with a new name in parameter. 
For example, to install the simple base:
```sh
git clone https://github.com/JBthePenguin/BasesWebsiteDjango.git
cd BasesWebsiteDjango/install_scripts
source install_simple.sh YourWebsite
```
First you are asked to choose the place for the root directory of your website, and after you have to register the superuser at the end of the installation.  
  
Now in the root directory of your website, you have to activate the virtual environment and then you can start the dev server:
```sh
$ source env/bin/activate
(env)$ python manage.py runserver
```
