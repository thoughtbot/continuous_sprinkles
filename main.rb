require 'config'
require 'packages/apache'
require 'packages/hudson'
require 'packages/ruby'
require 'packages/mysql'
require 'packages/postgres'
require 'packages/redis'

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
  # requires :hudson
  # requires :ruby
  # requires :rubygems
  # requires :mysql
  # requires :postgres
  requires :redis
end

