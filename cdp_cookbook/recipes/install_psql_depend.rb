execute 'install_psql10_server' do
  command 'yum install postgresql10-server -y'
  action :run
  not_if "yum list installed | grep postgresql10-server"
end

#execute 'install_psql10_server' do
#  command 'yum install epel-release -y'
#  action :run
#  not_if "yum list installed | grep epel-release"
#end

#execute 'install_psql10_server' do
#  command 'yum update -y'
#  action :run
#end

execute 'install_psql10_server' do
  command 'yum install python2 -y'
  action :run
  not_if "yum list installed | grep python2"
end

execute 'install_psql10_server' do
  command 'yum install python2-pip -y'
  action :run
  not_if "yum list installed | grep python2"
end


execute 'install_psql10_server' do
  command 'pip2 install psycopg2-binary'
  action :run
end

execute 'pre_requisite' do
  command 'echo  LC_ALL="en_US.UTF-8" >> /etc/locale.conf'
  action :run
end

