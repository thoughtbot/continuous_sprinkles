package :git do
  description "Git version control system"
  apt %w(git)
  verify do
    has_executable "git"
  end
end
