package :mongodb do
  description "Mongo document database"
  apt "mongodb"
  verify do
    has_executable "mongod"
    has_executable "mongo"
  end
end
