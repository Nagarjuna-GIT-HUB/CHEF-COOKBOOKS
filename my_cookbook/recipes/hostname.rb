log 'hostname' do
  message "The hostname of this node is #{node['hostname']}"
  level :info
end

#ruby_block 'print_hostname' do
#  block do
#    puts "The hostname of this node is #{node['hostname']}"
#  end
#  action :run
#end

