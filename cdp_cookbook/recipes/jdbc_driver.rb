#installing JDBC driver

execute 'jdbc_driver' do
  command "yum install -y https://download.postgresql.org/pub/repos/yum/common/redhat/rhel-8-x86_64/pgdg-redhat-repo-42.0-45PGDG.noarch.rpm"
  action :run
  not_if "yum list installed | grep pgdg-redhat-repo"
end

execute 'jdbc_driver' do
  command "yum install -y postgresql-jdbc*"
  action :run
  not_if 'yum list installed | grep postgresql-jdbc'
end

#sudo cp /usr/share/java/postgresql-jdbc.jar /usr/share/java/postgresql-connector-java.jar
#sudo chmod 644 /usr/share/java/postgresql-connector-java.jar
execute 'copy_postgresql_jdbc' do
  command 'cp /usr/share/java/postgresql-jdbc.jar /usr/share/java/postgresql-connector-java.jar'
  not_if { ::File.exist?('/usr/share/java/postgresql-connector-java.jar') }
  action :run
end

execute 'set_permissions_postgresql_connector' do
  command 'chmod 644 /usr/share/java/postgresql-connector-java.jar'
  only_if { ::File.exist?('/usr/share/java/postgresql-connector-java.jar') }
  action :run
end




#sudo yum install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm
#sudo yum install postgresql-jdbc*
#sudo cp /usr/share/java/postgresql-jdbc.jar /usr/share/java/postgresql-connector-java.jar
#sudo chmod 644 /usr/share/java/postgresql-connector-java.jar

#execute 'jdbc_driver' do
#  command "yum install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm"
#  action :run
#  not_if "yum list installed | grep pgdg-redhat-repo"
#end

#execute 'import_postgresql_gpg_key' do
#  command 'rpm --import https://archive.cloudera.com/postgresql10/redhat7/RPM-GPG-KEY-PGDG-10'
#  action :run
#  not_if 'rpm -qi RPM-GPG-KEY-PGDG-10'
#end


#execute 'jdbc_driver' do
#  command "yum install -y postgresql-jdbc*"
#  action :run
#  not_if 'yum list installed | grep postgresql-jdbc'
#end

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





#execute 'jdbc_driver' do
#  command "cp /usr/share/java/postgresql-jdbc.jar /usr/share/java/postgresql-connector-java.jar && chmod 644 /usr/share/java/postgresql-connector-java.jar"
#  action :run
#end

