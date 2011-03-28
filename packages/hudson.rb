package :hudson do
  description 'Hudson CI Server'
  deb "http://hudson-ci.org/downloads/debian/hudson.deb"
  requires :hudson_dependencies, :apache_hudson_proxy
  verify do
    has_apt "hudson"
  end
end

package :hudson_dependencies do
  description "Hudson Dependencies"
  apt %w(daemon openjdk-6-jre java-virtual-machine)
  verify do
    has_executable "java"
  end
end

package :apache_hudson_proxy do
  describe "Proxy 80 to 8080 for Hudson"
  apt %w(libapache2-mod-proxy-html) do
    post :install, [
      %{a2enmod proxy},
      %{a2enmod proxy_http},
      %{/etc/init.d/apache2 restart}
    ]
  end
  requires :apache, :hudson_apache_site
  verify do
    has_apt "libapache2-mod-proxy-html"
  end
end

package :hudson_apache_site do
  describe "Apache Hudson site"
  transfer "assets/site", "/tmp" do
    post :install, [
      %{mv /tmp/site /etc/apache2/sites-available/hudson},
      %{a2ensite hudson}
    ]
  end
  verify do
    has_file "/etc/apache2/sites-available/hudson"
  end
end
