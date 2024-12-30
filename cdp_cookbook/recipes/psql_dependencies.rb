#yum module list PostgreSQL
#yum module disable postgresql
#yum clean all
#yum makecache

execute 'list_postgresql' do
  command " yum module list PostgreSQL "
  action :run
  returns [0,1]
end

execute 'disable_psql' do
  command " yum module disable postgresql "
  action :run
  returns [0,1]
end

execute 'making_cache' do
  command " yum clean all && yum makecache "
  action :run
  returns [0,1]
end

#execute 'install_psql14' do
#  command " yum install postgresql14-server -y "
#  action :run
#end




#execute 'requisite' do
#  command " sudo yum remove -y mysql* && yum clean all "
#  action :run
#  only_if "sudo yum list installed | grep mysql"
#end

