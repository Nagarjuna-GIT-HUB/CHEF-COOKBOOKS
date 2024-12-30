execute 'schema_registry_start' do
  command "systemctl start confluent-schema-registry"
  action :run
end

#
