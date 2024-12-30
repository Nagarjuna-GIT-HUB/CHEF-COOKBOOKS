#sudo /usr/pgsql-10/bin/postgresql-10-setup initdb
#sudo systemctl enable postgresql-10
#sudo systemctl start postgresql-10
#sudo systemctl status postgresql-10

#Init psql db
execute 'install_psql_db' do
  command " sudo sudo /usr/pgsql-10/bin/postgresql-10-setup initdb "
  action :run
  returns [0,1]
end

# Enable and start the chrony service
service 'postgresql-10' do
  action [:enable, :start]
end

# Verify the chrony service status
execute 'postgresql_status' do
  command 'systemctl status postgresql-10'
  action :run
end

