package :iptables do
  description "Firewall"
  runner %{/etc/network/if-pre-up.d/iptables}
  requires :iptables_rules, :iptables_ifconfig
end

package :iptables_rules do
  description "Firewall rules"
  transfer "assets/iptables", "/tmp" do
    post :install, %{mv /tmp/iptables /etc/iptables.up.rules}
  end
  verify do
    has_file "/etc/iptables.up.rules"
  end
end

package :iptables_ifconfig do
  description "Setup firewall with network"
  transfer "assets/iptables_ifup", "/tmp" do
    post :install, %{mv /tmp/iptables_ifup /etc/network/if-pre-up.d/iptables}
    post :install, %{chmod +x /etc/network/if-pre-up.d/iptables}
  end
  verify do
    has_executable "/etc/network/if-pre-up.d/iptables"
  end
end
