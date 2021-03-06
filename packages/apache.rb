package :apache do
  description "Apache HTTP server"
  apt %w(apache2) do
    post :install, [
      %{a2dissite 000-default}
    ]
  end
  verify do
    has_apt "apache2"
  end
end
