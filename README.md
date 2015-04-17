# vagrant-ruby-2-2

Vagrant box for the Io language. Useful for working through the exercises
in [7 Languages in 7
Weeks](https://pragprog.com/book/btlang/seven-languages-in-seven-weeks)

## Inclusions

Starting with the `ubuntu/trusty64` box, we've included:

* build-essentials
* yajl
* libevent
* pcre
* git
* io language

## Usage

    $ git clone $REPO_URL
    $ cd vagrant-io
    $ vagrant up
    $ vagrant ssh
