bash 'create_postgres_user_and_db' do
  user 'postgres'
  code <<-EOH
    psql -c "CREATE USER queue WITH PASSWORD 'alph4321';"
    psql -c "CREATE DATABASE queue OWNER queue ENCODING 'UTF8';"
    psql -c "GRANT ALL PRIVILEGES ON DATABASE queue TO queue;"
  EOH
  not_if <<-EOH
    sudo -u postgres psql -tAc "SELECT 1 FROM pg_roles WHERE rolname='queue'" | grep -q 1
  EOH
end
