# What is this application

![Screenshot of dashboard](https://transfer.sh/uQ57h/morningpeak-screenshot.png)

Morning Peak is a modern opensource web application.
The application is designed to manage your clients, bills, and issues.


# Installation

## Requirements

- First install ruby 2 or greater. It is not advised to do the following commands as ``root``.
- Postgresql server
- Then, be sure you have postgresql installed, and started.

## Initialization

In your shell, start by using this script:
```bash
cd MorningPeak/
gem install bundler
bundle install
edit config/database.yml
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

Checkout for [rails minidoc](RailsMinidoc.md) for a resume of rails.


# Contributors

- poulet_a (as lead)
<img alt="lolcommit" src="https://pbs.twimg.com/media/CJ_ErJ2W8AAdev3.jpg" width="200" height="150" />

## How to contribute ?

You can contribute. We accept Pull Request. Create simple commits, with a minimum of lines.
When your feature, fix, ... is finished, create a Pull Request and describe it with accuracy.
