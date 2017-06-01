package 'redis-server'
service 'redis-server' do
  action [ :enable, :start ]
end
