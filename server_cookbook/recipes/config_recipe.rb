directory '/etc/kafka' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end


file '/etc/kafka/sample.config' do
  content "Hello everyone from Chef demo"
  action :create
end

