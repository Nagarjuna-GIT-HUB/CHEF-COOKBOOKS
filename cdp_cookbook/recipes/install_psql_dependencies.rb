#sudo yum install postgresql10-server
#sudo yum install epel-release
#sudo yum update
#yum install python2
#yum install python2-pip
#pip2 install psycopg2-binary

#echo 'LC_ALL="en_US.UTF-8"' >> /etc/locale.conf


execute 'install_psql10_server' do
  command 'yum install postgresql10-server -y'
  action :run
  not_if "yum list installed | grep postgresql10-server"
end

execute 'install_psql10_server' do
  command 'yum install epel-release -y'
  action :run
  not_if "yum list installed | grep epel-release"
end

execute 'install_psql10_server' do
  command 'yum update -y'
  action :run
end

execute 'install_psql10_server' do
  command 'yum install python2 -y'
  action :run
  not_if "yum list installed | grep python2"
end

execute 'install_psql10_server' do
  command 'pip2 install psycopg2-binary'
  action :run
end

#echo 'LC_ALL="en_US.UTF-8"' >> /etc/locale.conf


execute 'pre_requisite' do
  command 'echo  LC_ALL="en_US.UTF-8" >> /etc/locale.conf'
  action :run
end



#execute 'install_psql10_server' do
#  command 'yum install python2-pip -y'
#  action :run
#  not_if "yum list installed | grep python2-pip"
#end




#execute 'jdbc_driver' do
#  command "yum install -y https://download.postgresql.org/pub/repos/yum/common/redhat/rhel-8-x86_64/pgdg-redhat-repo-42.0-45PGDG.noarch.rpm"
#  action :run
#  not_if "yum list installed | grep pgdg-redhat-repo"
#end

#execute 'jdbc_driver' do
#  command "yum install -y postgresql-jdbc*"
#  action :run
#  not_if 'yum list installed | grep postgresql-jdbc'
#end

#sudo cp /usr/share/java/postgresql-jdbc.jar /usr/share/java/postgresql-connector-java.jar
#sudo chmod 644 /usr/share/java/postgresql-connector-java.jar


#execute 'copy_postgresql_jdbc' do
#  command 'cp /usr/share/java/postgresql-jdbc.jar /usr/share/java/postgresql-connector-java.jar'
#  not_if { ::File.exist?('/usr/share/java/postgresql-connector-java.jar') }
#  action :run
#end

#execute 'set_permissions_postgresql_connector' do
#  command 'chmod 644 /usr/share/java/postgresql-connector-java.jar'
#  only_if { ::File.exist?('/usr/share/java/postgresql-connector-java.jar') }
#  action :run
#end
 
