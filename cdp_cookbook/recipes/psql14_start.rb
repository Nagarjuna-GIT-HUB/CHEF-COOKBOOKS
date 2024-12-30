#sudo systemctl enable postgresql-10
#sudo systemctl start postgresql-10
#sudo systemctl status postgresql-10

service 'postgresql-14' do
  action [:enable,:start]
end

execute 'verify_psql14_status' do
  command 'systemctl status postgresql-14'
  action :run
end

