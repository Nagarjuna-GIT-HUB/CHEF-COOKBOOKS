log 'hostname' do
  message "The hostname of this node is #{node['hostname']}"
  level :info
end


id_in_myid_file = 
  case node["hostname"]    
  when "kchef2node1" then '1'
  when "kchef2server1" then '2'
  when "kchef2client1" then '3'
  else "file is not created"
end


file '/var/lib/zookeeper/myid' do
  content id_in_myid_file
  action :create
end

#execute 'create_myid' do
#  command 'echo "#{id_in_myid_file}" > /var/lib/zookeeper/myid'
#  action :run
#end




#file '/var/lib/zookeeper/myid' do
#  content id_in_myid_file
#  action :create
#end






#id_in_myid_file = case node["hostname"]
#                    when "kchef2node1.infra.alephys.com"  '1'
#		    when 'kchef2server1.infra.alephys.com'  '2'
#		    when 'kchef2client1.infra.alephys.com'  '3'
#		    else  "file is not created"  end
#



#file '/var/lib/zookeeper/myid' do
#  content id_in_myid_file
#  action :create
#end

