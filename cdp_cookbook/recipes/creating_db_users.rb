#create user scm WITH PASSWORD 'alph4321';
#create database scm owner scm encoding 'UTF8';
#grant all privileges on database scm to scm;

#bash 'create_postgres_user_and_db' do
#  user 'postgres' 
#  code <<-EOH
#    psql -c "CREATE USER scm WITH PASSWORD 'alph4321';"
#    psql -c "CREATE DATABASE scm OWNER scm ENCODING 'UTF8';"
#    psql -c "GRANT ALL PRIVILEGES ON DATABASE scm TO scm;"
#  EOH
#  not_if <<-EOH
#    sudo -u postgres psql -tAc "SELECT 1 FROM pg_roles WHERE rolname='scm'" | grep -q 1
#  EOH
#end

bash 'create_postgres_user_and_db' do
  user 'postgres'
  code <<-EOH
    psql -c "CREATE USER rman WITH PASSWORD 'alph4321';"
    psql -c "CREATE DATABASE rman OWNER rman ENCODING 'UTF8';"
    psql -c "GRANT ALL PRIVILEGES ON DATABASE rman TO rman;"
    psql -c "create user hue WITH PASSWORD 'alph4321';"
    psql -c "create database hue owner hue encoding 'UTF8';"
    psql -c "grant all privileges on database hue to hue;"
    psql -c "create user metastore WITH PASSWORD 'alph4321';"
    psql -c "create database metastore owner metastore encoding 'UTF8';"
    psql -c "grant all privileges on database metastore to metastore;"
  EOH
  not_if <<-EOH
    sudo -u postgres psql -tAc "SELECT 1 FROM pg_roles WHERE rolname='rman'" | grep -q 1
  EOH
end


bash 'create_postgres_user_and_db' do
  user 'postgres'
  code <<-EOH
    psql -c "CREATE USER oozie WITH PASSWORD 'alph4321';"
    psql -c "CREATE DATABASE oozie OWNER oozie ENCODING 'UTF8';"
    psql -c "GRANT ALL PRIVILEGES ON DATABASE oozie TO oozie;"
    psql -c "create user das WITH PASSWORD 'alph4321';"
    psql -c "create database das owner das encoding 'UTF8';"
    psql -c "grant all privileges on database das to das;"
    psql -c "create user smm WITH PASSWORD 'alph4321';"
    psql -c "create database smm owner smm encoding 'UTF8';"
    psql -c "grant all privileges on database smm to smm;"
  EOH
  not_if <<-EOH
    sudo -u postgres psql -tAc "SELECT 1 FROM pg_roles WHERE rolname='oozie'" | grep -q 1
  EOH
end

bash 'create_postgres_user_and_db' do
  user 'postgres'
  code <<-EOH
    psql -c "CREATE USER rangeradmin WITH PASSWORD 'alph4321';"
    psql -c "CREATE DATABASE ranger OWNER rangeradmin ENCODING 'UTF8';"
    psql -c "GRANT ALL PRIVILEGES ON DATABASE ranger TO rangeradmin;"
    psql -c "create user registry WITH PASSWORD 'alph4321';"
    psql -c "create database registry owner registry encoding 'UTF8';"
    psql -c "grant all privileges on database registry to registry;"
  EOH
  not_if <<-EOH
    sudo -u postgres psql -tAc "SELECT 1 FROM pg_roles WHERE rolname='raneradmin'" | grep -q 1
  EOH
end

