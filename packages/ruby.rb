package :ruby do
  description 'Ruby Virtual Machine'
  version '1.8.7'
  patchlevel '334'
  source "ftp://ftp.ruby-lang.org/pub/ruby/1.8/ruby-#{version}-p#{patchlevel}.tar.gz"
  requires :ruby_dependencies
  verify do
    has_executable "ruby"
  end
end

package :ruby_dependencies do
  description 'Ruby Virtual Machine Build Dependencies'
  apt %w(bison zlib1g-dev libssl-dev libreadline5-dev libncurses5-dev file)
  verify do
    has_apt "bison"
    has_apt "zlib1g-dev"
    has_apt "libssl-dev"
    has_apt "libreadline5-dev"
    has_apt "libncurses5-dev"
    has_apt "file"
  end
end

package :rubygems do
  description 'Ruby Gems Package Management System'
  version '1.6.2'
  source "http://production.cf.rubygems.org/rubygems/rubygems-#{version}.tgz" do
    custom_install 'ruby setup.rb'
  end
  requires :ruby
  verify do
    has_executable "gem"
  end
end

