IERU API Server
===============

**Requirements**

For installing the Analytics Service, a server with the following tools installed is required:
* PHP 5.4
* MySQL 5.5
* Apache
* Apache modules: mod_rewrite
* Git
* Composer (http://getcomposer.org/download/)

The file of the virtual hosts of the Apache server should be something like this: 
```
<virtualhost *:80>
     serveradmin  david@teluria.es
     documentroot "/users/david/sites/github/ieru-api-server"
     servername   api.dev
     serveralias  www.api.dev

     <directory /users/david/sites/github/ieru-api-server>
         options indexes followsymlinks multiviews
         allowoverride all
         order allow,deny
         allow from all
     </directory>
</virtualhost>
```

Installation
------------
**Install the REST engine**

Clone the Github project of the api server to a folder.
```
~/Sites/github $> git clone https://github.com/ieru/ieru-api-server
```

Run composer install
```
~/Sites/github/ieru-api-server $> cd ieru-api-server
~/Sites/github/ieru-api-server $> composer install
```

**Install databases**

Install the database dumps ieru_organic_analytics.sql and ieru_organic_oauth.sql in the local MySQL database.

On each API directory there is a Config.php file. In there you can change the user and password to your local MyQSL server.

**Configure api.php file**

For allowing javascript cross domain calls (e.g: requesting API from the organic edunet web app), you can configure the value of the constant XDOMAIN_ALLOWED_SERVER located in the php file, but by default it allows Ajax calls from any server. Include "http://" in the server name. Useful too for development and preproduction machines.

**Done!**

Just check that everything works with a few API requests:
```
http://api.dev/api/analytics/translate/providers
http://api.dev/api/analytics/translate/languages
http://api.dev/api/analytics/translate?text=potato&from=en&to=es
```