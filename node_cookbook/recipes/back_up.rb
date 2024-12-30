# Define the attributes directly
#node.default['kchef2node1'] = {}
#node.default['kchef2node1']['dataDir'] = '/var/lib/zookeeper'

log 'hostname' do
  message "The hostname of this node is #{node['hostname']}"
  level :info
end

#node.default['hostname'] = {}
#node.default['hostname']['dataDir'] = '/var/lib/zookeeper'

log 'node_attributes' do
  message "Node attributes: #{node.to_hash.inspect}"
  level :debug
end


backup_dir = '/backups/kafka'
kafka_data_dir = node['hostname']['dataDir']

directory backup_dir do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

execute 'back_up' do
  command "cp -r #{kafka_data_dir} #{backup_dir}/logs_$(date +%F)"
  action :run
end




#backup_dir = '/backups/kafka'
#kafka_data_dir = node['kchef2node1']['dataDir']
#kafka_config_dir = '/etc/kafka/zookeeper.properties'

#directory backup_dir do
#  owner 'root'
#  group 'root'
#  mode '0755'
#  action :create
#end

#execute 'back_up' do
#  command "cp -r #{kafka_data_dir} #{backup_dir}/logs_$(date +%F)"
#  action :run
#end


