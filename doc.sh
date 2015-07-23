#!/bin/sh
if [[ $(bundle list erd) == "" ]]
then
    echo "ERD Not found, installation ..."
    gem install rails-erd
fi

bundle exec erd --polymorphism --inheritance --attributes=content
xdg-open erd.pdf
