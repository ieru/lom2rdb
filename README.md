IEEE LOM resource to MySQL database
===============

**Requirements**

For installing the Analytics Service, a server with the following tools installed is required:
* PHP 5.4
* MySQL 5.5
* Apache
* Apache modules: mod_rewrite

The file of the virtual hosts of the Apache server should be something like this: 
```
<virtualhost *:80>
     serveradmin  david@teluria.es
     documentroot "/users/david/sites/github/lom2rdb"
     servername   api.dev
     serveralias  www.api.dev

     <directory /users/david/sites/github/lom2rdb>
         options indexes followsymlinks multiviews
         allowoverride all
         order allow,deny
         allow from all
     </directory>
</virtualhost>
```

Installation
------------

Download this project of Github and extract it to a local folder, or use the following command to instal it using Git:

```
git clone http://github.com/ieru/lom2rdb
```

You can put this in your default Apache server for accessing it through the URL http://localhost, or configure the Apache server as needed.

