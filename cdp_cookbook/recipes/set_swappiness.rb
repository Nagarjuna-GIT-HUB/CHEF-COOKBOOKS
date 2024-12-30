execute 'set_swappiness' do
  command "sysctl -w vm.swappiness=1"
  action :run
  notifies :run, 'execute[persist_swappiness]', :immediately
end

execute 'persist_swappiness' do
  command "echo 'vm.swappiness=1' >> /etc/sysctl.conf"
  action :nothing
end
