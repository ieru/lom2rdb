IEEE LOM resource to MySQL database
===============

About
-----

This project is meant to import an XML file that contains the information of a learning resource in the IEEE LOM format into a relational database (MySQL). This way it will be accessed easily in any web project, like in Organic Edunet (http://organic-edunet.eu).

Requirements
------------

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

API usage
---------

The project can be accessed, once installed correctly, through the browser. As it is using a custom REST engine (http://github.com/ieru/ieru-rest-engine) and an API created for that REST engine, it has different methods that can be called for importing and exporting the IEEE LOM xml resources.

**Retrieve in XML format a resource stored in the database**

GET api/import/get/:id
* **Description:** allows the user to retrieve all the metadata of a learning resource in XML format.
* **Params:**
    * **id:** the identifier of the resource (stored in the field of the database loms.lom_id).
* **Example**
    * GET api/import/get/345