yml = YAML.load_file("#{Rails.root}/config/authorize_net.yml")
AUTHORIZE_NET_CONFIG = yml['default']
AUTHORIZE_NET_CONFIG.merge!(yml[RAILS_ENV]) unless yml[Rails.env].nil?
AUTHORIZE_NET_CONFIG.freeze
