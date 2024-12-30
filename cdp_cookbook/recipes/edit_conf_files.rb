execute 'update_postgresql_conf' do
  command <<-EOH
    sed -i "s/^#listen_addresses = 'localhost'/listen_addresses = '*'/" /var/lib/pgsql/10/data/postgresql.conf
    sed -i "s/^#port = 5432/port = 5432/" /var/lib/pgsql/10/data/postgresql.conf
    sed -i "s/^#standard_conforming_strings = on/standard_conforming_strings = off/" /var/lib/pgsql/10/data/postgresql.conf
  EOH
  action :run
end








#sudo vim /var/lib/pgsql/10/data/postgresql.conf
#        Listen_addresses=’*’
#        Port=5432
#        standard_conforming_strings = off

#sed -i "s/localhost/kchef1node1.infra.alephys.com/g" /etc/kafka/server.properties


#execute 'update_psql_conf' do
#  command '
#sed -i "s/#listen_addresses/listen_addresses/g" /var/lib/pgsql/14/data/postgresql.conf && \
#sed -i "s/#port/port/g" /var/lib/pgsql/14/data/postgresql.conf && \
#sed -i "s/#standard_conforming_strings/standard_conforming_strings/g" /var/lib/pgsql/14/data/postgresql.conf && \ 
#sed -i "s/localhost/*/g" /var/lib/pgsql/14/data/postgresql.conf '
#  action :run
#end

#execute 'update_psql_conf' do
#  command '
#sed -i "s/#listen_addresses/listen_addresses/g" /var/lib/pgsql/14/data/postgresql.conf '
#  action :run
#end

# Chef recipe to modify postgresql.conf
#execute 'update_listen_addresses' do
#  command "sed -i \"s/^#\\?listen_addresses = 'localhost'/listen_addresses = '*'/\" /var/lib/pgsql/14/data/postgresql.conf"
#  action :run
#  not_if "grep -q \"^listen_addresses = '*'\" /var/lib/pgsql/14/data/postgresql.conf"
#end

#execute 'update_port' do
#  command "sed -i \"s/^#\\?port = 5432/port = 5432/\" /var/lib/pgsql/14/data/postgresql.conf"
#  action :run
#  not_if "grep -q \"^port = 5432\" /var/lib/pgsql/14/data/postgresql.conf"
#end

#execute 'update_standard_conforming_strings' do
#  command "sed -i \"s/^#\\?standard_conforming_strings = on/standard_conforming_strings = off/\" /var/lib/pgsql/14/data/postgresql.conf"
#  action :run
#  not_if "grep -q \"^standard_conforming_strings = off\" /var/lib/pgsql/14/data/postgresql.conf"
#end



#updating server.properties for listeners and advertised.listeners
#execute 'update_psql_conf' do
#  command 'echo "
#listeners=PLAINTEXT://kchef1node1.infra.alephys.com:9092
#advertised.listeners=PLAINTEXT://kchef1node1.infra.alephys.com:9092" >> /etc/kafka/server.properties'
#  action :run
#end


