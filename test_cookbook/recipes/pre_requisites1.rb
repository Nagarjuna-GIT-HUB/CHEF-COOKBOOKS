#execute 'pre_requisites' do
#  command 'echo "
#10.1.14.183 kchef1node1.infra.alephys.com " >> /etc/hosts'
#  action :run
#end

execute 'pre_requisites' do
  command 'echo 1 > /proc/sys/vm/swappiness'
  action :run
end


execute 'pre_requisites' do
  command 'systemctl stop tuned && systemctl disable tuned && systemctl status tuned'
  action :run
end

