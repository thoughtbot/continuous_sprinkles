package :rvm do
  description 'Ruby Version Manager'
  transfer "assets/rvm_config", "/tmp" do
    post :install, %{sudo -u jenkins -H bash /tmp/rvm_config}
  end
  requires :bashrc, :curl
end

package :bashrc do
  description "~/.bashrc for rvm"
  transfer "assets/bashrc", "/tmp" do
    post :install, %{mv /tmp/bashrc /var/lib/jenkins/.bashrc}
  end
end

package :curl do
  apt "curl"
  verify do
    has_executable "curl"
  end
end
