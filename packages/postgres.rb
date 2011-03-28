package :postgres do
  description "Postgresql Database"
  apt %w(postgresql postgresql-client postgresql-contrib)
  verify do
    has_apt "postgresql"
    has_apt "postgresql-client"
    has_apt "postgresql-contrib"
  end
end

