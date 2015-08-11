# server-based syntax
# ======================
# Defines a single server with a list of roles and multiple properties.
# You can define all roles on a single server, or split them:

# server 'example.com', user: 'deploy', roles: %w{app db web}, my_property: :my_value
# server 'example.com', user: 'deploy', roles: %w{app web}, other_property: :other_value
# server 'db.example.com', user: 'deploy', roles: %w{db}



# role-based syntax
# ==================

# Defines a role with one or multiple servers. The primary server in each
# group is considered to be the first unless any  hosts have the primary
# property set. Specify the username and a domain or IP for the server.
# Don't use `:all`, it's a meta role.

role :app, %w{deployuser@192.168.1.190}
role :web, %w{deployuser@192.168.1.190}
role :db,  %w{deployuser@192.168.1.190}

 # ask(:password, nil, echo: false)
 #        server '192.168.1.190',
 #        user: 'deployuser', password: fetch(:password), roles: %w{web app db}


# Configuration
# =============
# You can set any configuration variable like in config/deploy.rb
# These variables are then only loaded and set in this stage.
# For available Capistrano configuration variables see the documentation page.
# http://capistranorb.com/documentation/getting-started/configuration/
# Feel free to add new variables to customise your setup.



# Custom SSH Options
# ==================
# You may pass any option but keep in mind that net/ssh understands a
# limited set of options, consult the Net::SSH documentation.
# http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start
#
# Global options
# --------------
#  set :ssh_options, {
#    keys: %w(/home/rlisowski/.ssh/id_rsa),
#    forward_agent: false,
#    auth_methods: %w(password)
#  }
#
# The server-based syntax can be used to override options:
# ------------------------------------
# server '192.168.1.190',
#   user: 'deployuser',
#   roles: %w{web app db},
#   ssh_options: {
#     user: 'deployuser', # overrides user setting above
#     keys: %w(/home/deployuser/.ssh/id_rsa),
#     forward_agent: false,
#     auth_methods: %w(publickey password),
#     password: '9kQtukFy5XDP'
#   }
