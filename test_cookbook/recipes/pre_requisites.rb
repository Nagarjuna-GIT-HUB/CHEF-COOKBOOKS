execute 'pre_requisite' do
  command 'echo "
10.1.14.183 kchef1node1.infra.alephys.com " >> /etc/hosts'
  action :run
end

execute 'pre_requisite' do
  command 'systemctl stop firewalld && systemctl disable firewalld && systemctl status firewalld'
  action :run
end

execute 'pre_requisite' do
  command 'echo never > /sys/kernel/mm/transparent_hugepage/defrag'
  action :run
end

execute 'pre_requisite' do
  command 'echo never > /sys/kernel/mm/transparent_hugepage/enabled'
  action :run
end


execute 'pre_requisite' do
  command 'echo "
echo never > /sys/kernel/mm/transparent_hugepage/defrag
echo never > /sys/kernel/mm/transparent_hugepage/enabled " >> /etc/rc.local'
  action :run
end


