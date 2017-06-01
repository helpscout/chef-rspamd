default['rspamd']['workers']['controller']['bind_socket']     = 'localhost:11334'
default['rspamd']['workers']['controller']['password']        = 'q1'
default['rspamd']['workers']['controller']['enable_password'] = nil
default['rspamd']['workers']['controller']['secure_ip']       = [ '127.0.0.1', '::1' ]

default['rspamd']['workers']['normal']['mime']        = true
default['rspamd']['workers']['normal']['allow_learn'] = nil
default['rspamd']['workers']['normal']['bind_socket'] = '*:11333'
