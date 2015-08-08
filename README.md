# Project Presentation

_Morning Peak is a modern and OpenSource Web Application.
It has been designed to manage clients, bills, and issues for little and medium compagnies._

<img att="Dashboard Mobile view" src="http://imgur.com/bnYHYJ6l.png" width="200" />
<img alt="Dashboard Desktop view" src="http://i.imgur.com/oxE9LR1.png" width="500" />

There is a lot of CRM on the web. Some of them are web application. Some of them are open source. Some of them are modern.
But, I __never see any of them grouping the 3__. It is why I started to develop this application.
To improve my skills, my knowledges, and to use it.

I want a simple application, that I __understand__, and that I __need__. By __simple__, I mean:

- No tasks, no reports, no chat. I want an application to do ONE thing, manage my clients, and it must do it clearly, and good.
- A pluggable application, with many __REST API__. Because tasks and reports are usefull.
- Generic items. I prefere __ONE kind of Bills + Tags__ than __4 ou 5 kinds of Bills__ (for example).

I would like money, contributions, critics, etc.

<img alt="Tickets Desktop view" src="http://i.imgur.com/e004zBZ.png" width="500" />


## Summary

1. [Installation](#1-installation)
  1. [Requirements](#11-requirements)
  2. [Initialization](#12-initialization)
  3. [Configuration](#13-configuration)
  4. [First start](#14-first-start)
2. [Contributions](#2-contributions)
  1. [Contributors](#21-contributors)
  2. [How to contribute](#22-how-to-contribute-)
  3. [License](#23-license)



# 1. Installation

## 1.1. Requirements

- Ruby 2.0 or greater.
- Postgresql server 9 or greater running with creditentials.

## 1.2. Initialization

Start by pasting this script in your shell:
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

## 1.3. Configuration

- You can create a file ``.env`` to save your locals cvars without pollute your global env.
- You can also create ``.env.production`` etc. for environement specifics cvars
- A ``.env`` file looks like:
```text
COMPANY: "Yolo production"
LOCALE: fr
...
```

- The application's specifics cvars are :
  - COMPANY

## 1.4. First start

When you done with the configuration of the database (editing ``config/database.yml``),
you can run the server by the following command :
```
rails s		# "-b 0.0.0.0 -p 80" to test on internet :)
```

The server will be accessible via [localhost:3000](http://localhost:3000)

Default creditentials are generated in the seed:

```text
user> login: user@client.com , password: user2015
```

```text
admin> login: admin@admin.admin , password: wir2015
```

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

## 2.3. License

see the license in the ``License`` file.

It is under:

```text
GNU GENERAL PUBLIC LICENSE
```
