package :hudson do
  description 'Hudson CI Server'
  deb "http://hudson-ci.org/downloads/debian/hudson.deb"
  requires :hudson_dependencies, :apache_hudson_proxy
end

package :hudson_dependencies do
  description "Hudson Dependencies"
  apt %w(daemon openjdk-6-jre java-virtual-machine)
end

package :apache_hudson_proxy do
  describe "Proxy 80 to 8080 for Hudson"
  apt %w(libapache2-mod-proxy-html) do
    site = IO.read("assets/site")
    post :install, [
      %{a2enmod proxy},
      %{a2enmod proxy_http},
      %{bash -c "echo -e '#{site.gsub("\n", '\n')}' > /etc/apache2/sites-available/hudson"},
      %{a2ensite hudson},
      %{/etc/init.d/apache2 restart}
    ]
  end
  requires :apache
end
