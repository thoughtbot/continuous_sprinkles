package :jenkins do
  description 'Jenkins CI Server'
  apt "jenkins" do
    pre :install, %{apt-get update}
  end
  requires :jenkins_apt_repository, :apache_jenkins_proxy
  verify do
    has_apt "jenkins"
  end
end

package :apache_jenkins_proxy do
  describe "Proxy 80 to 8080 for Jenkins"
  apt %w(libapache2-mod-proxy-html) do
    post :install, [
      %{a2enmod proxy},
      %{a2enmod proxy_http},
      %{a2ensite jenkins},
      %{/etc/init.d/apache2 restart}
    ]
  end
  requires :apache, :jenkins_apache_site
  verify do
    has_apt "libapache2-mod-proxy-html"
    has_file "/etc/apache2/sites-enabled/jenkins"
  end
end

package :jenkins_apache_site do
  describe "Apache Jenkins site"
  transfer "assets/site", "/tmp" do
    post :install, %{mv /tmp/site /etc/apache2/sites-available/jenkins}
  end
  verify do
    has_file "/etc/apache2/sites-available/jenkins"
  end
end

package :jenkins_apt_repository do
  describe "APT sources for Jenkins"
  runner %{bash -c 'wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add -'}
  runner %{bash -c 'echo "deb http://pkg.jenkins-ci.org/debian binary/" > /etc/apt/sources.list.d/jenkins.list'}
  verify do
    has_file "/etc/apt/sources.list.d/jenkins.list"
  end
end
