package :mysql do
  description "MySQL Database"
  apt %w(mysql-server mysql-client libmysqlclient15-dev)
  verify do
    has_executable "mysql"
    has_executable "mysqld"
  end
end
