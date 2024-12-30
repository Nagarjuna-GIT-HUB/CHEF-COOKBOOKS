execute 'pre_requisite' do
  command 'echo "
10.1.14.191 kcdp1node1.infra.alephys.com
10.1.14.215 kcdp1node2.infra.alephys.com
10.1.14.208 kcdp1node3.infra.alephys.com " >> /root/test.pdf'
  action :run
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

#execute 'pre_requisite' do
#  command <<-EOH
#    rpm -qa | grep mysql > /dev/null 2>&1
#    if [ $? -eq 0 ]; then
#      yum info installed | grep mysql > /dev/null 2>&1
#      if [ $? -eq 0 ]; then
#        yum remove -y mysql* && yum clean all
#B
#      fi
#    fi
#  EOH
#  action :run
#end

