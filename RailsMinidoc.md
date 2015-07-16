# Rails minidoc

Guide documentation : [visit](http://guides.rubyonrails.org/)

The RoR Project works with some main parts :

- __/config/routes.rb__ : the routing. The url accessible from http://... will call a Controller.method
- __/app/controllers/*__ : the controllers. they are the mind using the parameters and choosing the render to use
- __/app/models/*__ : the modelisation of the database
- __/app/views/*/*__ : the views rendered after the controller
- __/db/migrate/*__ : the migrations. They represents the state of the databases
- __/app/assets/__ : all stylesheets css, javascript, images

## Create a new table, upgrade, etc.

### Create a table

Creating a new table = Create a new migration. Use the command like ``rails generate Table data1:string data2:integer`` etc.

### Change an existing table

Each changement on the database needs a migration. ``rails g migration``.
