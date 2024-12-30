execute 'server_start' do
  command 'systemctl start confluent-server'
  action :run
end
