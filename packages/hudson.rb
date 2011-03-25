package :hudson do
  description 'Hudson CI Server'
  deb "http://hudson-ci.org/downloads/debian/hudson.deb"
  requires :hudson_dependencies
end

package :hudson_dependencies do
  description "Hudson Dependencies"
  apt %w(daemon openjdk-6-jre java-virtual-machine)
end

