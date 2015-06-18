# Installation

## Requirements

- First install ruby 2 or greater. It is not advised to do the following commands as ``root``.
- Then, be sure you have postgresql installed, and started.

## Initialization

```bash
cd Appli/
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

# Organisation MVC

Guide documentation : [visit](http://guides.rubyonrails.org/)
The RoR Project works with some main parts :

- /config/routes.rb : the routing. The url accessible from http://... will call a Controller.method
- /app/controllers/* : the controllers. they act from the parameters from the calling url
- /app/models/* : the modelisation of the database
- /app/views/*/* : the views rendered after the controller
- /db/migrate/* : the migrations. They represents the state of the databases
- /app/assets/ : all stylesheets css, javascript, images

# Contributors
- poulet_a (as lead)
