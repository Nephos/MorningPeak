# Installation

## Requirements

- First install ruby 2 or greater. It is not advised to do the following commands as ``root``.
- Then, be sure you have postgresql installed, and started.

```
cd Appli/
gem install bundler
bundle install
cp config/database.yml.example config/database.yml
edit config/database.yml # Configure your database connection first
rake db:create # create the db
rake db:migrate # migrate the db
```

you can try with an first example of dataset : ```rake db:seed```

# Contributors
- poulet_a (as lead)
