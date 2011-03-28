require 'config'
require 'packages/apache'
require 'packages/jenkins'
require 'packages/ruby'
require 'packages/mysql'
require 'packages/postgres'
require 'packages/mongodb'
require 'packages/redis'
require 'packages/iptables'
require 'packages/rvm'
require 'packages/git'

deployment do
  delivery :capistrano do
    recipes 'deploy'
  end

  source do
    prefix   '/usr/local'
    archives '/usr/local/sources'
    builds   '/usr/local/build'
  end
end

policy :ci, :roles => :master do
  requires :iptables
  requires :jenkins
  requires :git
  requires :ruby
  requires :rubygems
  requires :rvm
  requires :mysql
  requires :postgres
  requires :redis
  requires :mongodb
end

