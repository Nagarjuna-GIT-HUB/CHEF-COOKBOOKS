execute 'update_os' do
  command " sudo yum update -y"
  action :run
end

execute 'pre_requisite' do
  command 'echo "
10.1.14.201 kcdp1node1.infra.alephys.com
10.1.14.145 kcdp1node2.infra.alephys.com
10.1.14.155 kcdp1node3.infra.alephys.com " >> /etc/hosts'
  action :run
  not_if 'grep -q "10.1.14.201 kcdp1node1.infra.alephys.com" /etc/hosts'
end

execute 'requisite' do
  command "sudo rpm -qa | grep mysql "
  action :run
  returns [0,1]
end

execute 'requisite' do
  command " sudo yum list installed | grep mysql "
  action :run
  returns [0,1]
end

execute 'requisite' do
  command " sudo yum remove -y mysql* && yum clean all "
  action :run
  only_if "sudo yum list installed | grep mysql"
end



####
#execute 'pre_requisite' do
#  command <<-EOH
#    rpm -qa | grep mysql > /dev/null 2>&1
#    if [ $? -eq 0 ]; then
#      yum info installed | grep mysql > /dev/null 2>&1
#      if [ $? -eq 0 ]; then
#        yum remove -y mysql* && yum clean all
#      fi
#    fi
#  EOH
#  action :run
#end

#execute 'pre_requisite' do
#  command 'rpm -qa | grep mysql && sudo yum info installed | grep mysql && sudo yum remove -y mysql* && yum clean all'
#  action :run
#end

execute 'pre_requisite' do
  command 'sudo yum install wget nano vi net-tools perl -y '
  action :run
end

service 'firewalld' do
  action [:stop, :disable]
end


#yum_package ['wget', 'nano', 'vi', 'net-tools', 'perl'] do
#  action :install
#end

#&& systemctl status firewalld
#execute 'pre_requisite' do
#  command 'systemctl stop firewalld && systemctl disable firewalld && systemctl status firewalld'
#  action :run
#  returns [0,1]
#end

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
  not_if 'grep -q "echo never > /sys/kernel/mm/transparent_hugepage/defrag" /etc/rc.local'
end


