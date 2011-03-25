package :mysql do
  description "MySQL Database"
  apt %w(mysql-server mysql-client libmysqlclient15-dev)
end
