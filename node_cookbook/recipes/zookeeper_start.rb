execute 'zookeeper_start' do
  command 'systemctl start confluent-zookeeper'
  action :run
end



#systemd_unit("conflunet-zookeeper") do
#  action :start
#end

#systemd_unit("conflunet-zookeeper") do
#  action [:enable, :start]
#  default_guard_interpreter :default
#  declared_type :systemd_unit
#  cookbook_name "node_cookbook"
#  recipe_name "zookeeper_start"
#  unit_name "conflunet-zookeeper"
#end


#systemd_unit 'conflunet-zookeeper' do
#  action [:enable, :start]
#end
