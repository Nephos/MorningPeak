# What is this application

![Desktop view](http://i.imgur.com/oxE9LR1.png)
![Mobile view](http://imgur.com/bnYHYJ6l.png)

_Morning Peak is a modern and OpenSource Web Application.
It has been designed to manage clients, bills, and issues for little and medium compagnies._

1. [Installation](#1-installation)
  1. [Requirements](#11-requirements)
  2. [Initialization](#12-initialization)
  3. [First start](#13-first-start)
2. [Contributions](#2-contributions)
  1. [Contributors](#21-contributors)
  2. [How to contribute](#22-how-to-contribute-)



# 1. Installation

## 1.1. Requirements

- Ruby 2.0 or greater.
- Postgresql server.

## 1.2. Initialization

In your shell, start by using this script:
```bash
cd MorningPeak/
gem install bundler
bundle install
cp config/database.yml.example config/database.yml
edit config/database.yml	# Configure your database connection first
rake db:create
rake db:migrate
rake db:seed				# will generate default data. Not on production ;)
```

## 1.3. First start

When you done with the configuration of the database (editing ``config/database.yml``),
you can run the server by the following command :
```
rails s		# "-b 0.0.0.0 -p 80" to test on internet :)
```

The server will be accessible via [localhost](http://localhost:3000)

Default identifiers, generated in the seed:

``user> login: admin@jerevedunemaison.com , password: jrdm2015``

``admin> login: admin@wir.com , password: wir2015``

Checkout for [rails minidoc](RailsMinidoc.md) for a resume of rails.


# 2. Contributions

## 2.1. Contributors
- __Arthur Poulet__ : main developper, upstream (poulet_a)
<img alt="Look at this cute face" src="https://pbs.twimg.com/media/CJ_ErJ2W8AAdev3.jpg" width="200" height="150" />

## 2.2. How to contribute ?

You can contribute to this project by Merge Request on the gitlab repository [here](https://gitlab.com/poulet_a/MorningPeak).
The best pratices are to create short commits, and short Merge Requests. Respect the git commit nomage convention as possible with:

- title
- description
- concerned issues with "#id"

We accept any kind of work : translations, bug fix, additionnal features, optimizations, documentation, etc.

Don't be afraid !
