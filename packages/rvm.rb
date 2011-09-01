package :rvm do
  description 'Ruby Version Manager'
  transfer "assets/rvm_config", "/tmp" do
    post :install, %{sudo -u jenkins -H bash /tmp/rvm_config}
  end
  requires :bash_profile, :curl
  verify do
    has_directory "/var/lib/jenkins/.rvm"
  end
end

package :bash_profile do
  description "~/.bash_profile for rvm"
  transfer "assets/bash_profile", "/tmp" do
    post :install, %{mv /tmp/bash_profile /var/lib/jenkins/.bash_profile}
  end
  verify do
    file_contains "/var/lib/jenkins/.bash_profile", "rvm"
  end
end

package :curl do
  apt "curl"
  verify do
    has_executable "curl"
  end
end
