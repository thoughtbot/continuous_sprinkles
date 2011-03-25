package :redis do
  description "Redis"
  version "2.2.2"
  source "http://redis.googlecode.com/files/redis-#{version}.tar.gz" do
    conf = IO.read("assets/redis.conf")
    custom_install "make && make install"
    post :install, %{cp /usr/local/build/redis-#{version}/utils/redis_init_script /etc/init.d/redis}
    post :install, %{chmod +x /etc/init.d/redis}
    post :install, %{mkdir -p /var/redis}
    post :install, %{update-rc.d redis defaults}
    post :install, %{/etc/init.d/redis start}
  end
  requires :redis_conf
  verify do
    has_file "/usr/local/bin/redis-server"
  end
end

package :redis_conf do
  description "Configuration for Redis"
  transfer "assets/redis.conf", "/tmp" do
    pre :install, %{mkdir -p /etc/redis}
    post :install, %{mv /tmp/redis.conf /etc/redis/6379.conf}
  end
end
