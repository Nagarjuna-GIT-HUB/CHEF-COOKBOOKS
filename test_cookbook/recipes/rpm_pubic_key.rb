
# Import the Confluent key using rpm
execute 'import_confluent_key' do
  command 'rpm --import https://packages.confluent.io/rpm/7.8/archive.key'
  action :run
end

