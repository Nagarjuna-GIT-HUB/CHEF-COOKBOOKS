execute 'control_center_start' do
  command 'systemctl start confluent-control-center'
  action :run
end
#1
