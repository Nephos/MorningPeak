# What is this application

![Screenshot of dashboard](https://transfer.sh/uQ57h/morningpeak-screenshot.png)

Morning Peak is a modern opensource web application.
The application is designed to manage your clients, bills, and issues.


# Installation

## Requirements

- First install ruby 2 or greater. It is not advised to do the following commands as ``root``.
- Then, be sure you have postgresql installed, and started.

## Initialization

```bash
cd MorningPeak/
gem install bundler
bundle install
cp config/database.yml.example config/database.yml
edit config/database.yml # Configure your database connection first
rake db:create # create the db
rake db:migrate # migrate the db
```

you can try with an first example of dataset :

```
rake db:seed
```

## Running

You can run the server by :

```
rails s
```

The server will be accessible via [localhost](http://localhost:3000)

Default identifiers:

``user> login: admin@jerevedunemaison.com , password: jrdm2015``

``admin> login: admin@wir.com , password: wir2015``


# Organisation MVC

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


# Contributors

- poulet_a (as lead) ![lolcommit](https://pbs.twimg.com/media/CJ_ErJ2W8AAdev3.jpg)

## How to contribute ?

You can contribute. We accept Pull Request. Create simple commits, with a minimum of lines.
When your feature, fix, ... is finished, create a Pull Request and describe it with accuracy.
