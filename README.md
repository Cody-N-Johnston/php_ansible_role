Role Name
=========

Installs PHP on Ubuntu servers

Requirements
------------

If you are using an older version of Ubuntu/Debian alongside a deprecated version of PHP you will need to use a repo or PPA with a maintained PHP version.
This role has currently only been tested on Ubuntu 18.04, however it attempts to pull your distribution version specific packages from the default PPA repositories.

Role Variables
--------------

Available variables (`vars/main.yml`) are listed here alongside default values (`defaults/main.yml`)

####vars
`php_packages`
 A list of packages to install. Currently this is not OS specific. You may want to install additional packages depending on your application. 
 

`php_fpm_packages`
A list of php-fpm packages that need to be installed.


`install_php_fpm`
A true/false (`true by default`) value indicating whether or not you want to install php-fpm. More details about this package can be found [here](https://www.php.net/manual/en/install.fpm.php)   
When this flag is set to true this will install one version of php-fpm it also currently tries to mitigate needing to specify the version number  
in order to manage processes or the service itself. As such there are configuration files that are used/modified in order to achieve this.

####defaults
`PROJECT_ROOT`  
Root of your PHP project, will be used in config files.

`php_version`  
PHP version on supported operating systems this can support major version 5.6 - 7.4

`php_extra_packages`  
Any extra packages you need installed, is empty by default.

####Debian (`vars/Debian.yml`)
`php_fpm_conf_path`  
Path to php-fpm settings

`php_fpm_pool_conf_path`  
Path to fpm pool configuration.

`php_fpm_pool_file`  
Name of the file to use for configuration.

`php_fpm_service_file`  
Path to default init/upstart script use for configuration.

Dependencies
------------

Currently there are no dependencies on other roles, however some options such as those regarding php-fpm will need to be utilized  
in order to obtain performance benefits or use the NGINX role I have created.

Example Playbook
----------------

   - hosts: default
     become: yes
     roles:
       - { role: php, php_version: '7.4', install_php_fpm: true }

License
-------

MIT

Author Information
------------------

Cody johnston, cody.n.johnston@gmail.com
