execute 'pre_requisite' do
  command 'echo "
10.1.14.122 kchef2automate1.infra.alephys.com " >> /etc/hosts'
  action :run
end


execute 'pre_requisite' do
  command <<-EOH
    rpm -qa | grep mysql > /dev/null 2>&1
    if [ $? -eq 0 ]; then
      yum info installed | grep mysql > /dev/null 2>&1
      if [ $? -eq 0 ]; then
        yum remove -y mysql* && yum clean all
      fi
    fi
  EOH
  action :run
end

#execute 'pre_requisite' do
#  command 'rpm -qa | grep mysql && sudo yum info installed | grep mysql && sudo yum remove -y mysql* && yum clean all'
#  action :run
#end

execute 'pre_requisite' do
  command 'sudo yum install wget nano vi net-tools perl -y '
  action :run
end


#yum_package ['wget', 'nano', 'vi', 'net-tools', 'perl'] do
#  action :install
#end

#&& systemctl status firewalld
execute 'pre_requisite' do
  command 'systemctl stop firewalld && systemctl disable firewalld '
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


