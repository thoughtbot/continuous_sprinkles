package :rvm_rubies do
  description "Useful versions of Ruby within RVM"
  requires RUBIES.map { |version| "ruby_#{version}" }
end

RUBIES.each do |version|
  package "ruby_#{version}" do
    runner "sudo -u jenkins -H -i rvm install #{version}"
    verify do
      has_executable "/var/lib/jenkins/.rvm/rubies/#{version}/bin/ruby"
    end
    requires :build_essential
  end
end

package :build_essential do
  description "Essential compiler tools"
  apt "build-essential"
  verify do
    has_apt "build-essential"
  end
end
