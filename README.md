DEPRECATED
==========

This Sprinkle script is no longer maintained. If you would like to take it over
please fork it and send an email to [thoughtbot](mailto:support@thoughtbot.com).

Continuous Sprinkles
====================

Continuous Sprinkles is a [Sprinkle](https://github.com/crafterm/sprinkle) recipe to setup a Jenkins CI server for Ruby development. It provides:

* Jenkins
* Git
* Apache proxy to Jenkins
* MySQL
* Postgres
* Redis
* Mongodb
* Ruby
* RVM
* IPtables rules

Usage
-----

You need to install Sprinkle:

    gem install sprinkle

Check out the Continuous Sprinkles repository, copy the config.example.rb to config.rb, and edit config.rb to use your CI's host name:

    HOST = 'ci.mydomain.com'

 Then cd into the checked out Continuous Sprinkles repository, and run:

    sprinkle -s main.rb

It will use capistrano to SSH into your CI host and install all necessary dependencies. The script will take a while to run.

License
-------

![thoughtbot](http://thoughtbot.com/images/tm/logo.png)

Continuous Sprinkles is Copyright © 2011 [thoughtbot, inc](http://thoughtbot.com/community)

The names and logos for thoughtbot are trademarks of thoughtbot, inc.

Continuous Sprinkles is free software, and may be redistributed under the terms specified in the LICENSE file.
