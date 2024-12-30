execute 'kafka_connect_start' do
  command "systemctl start confluent-kafka-connect"
  action :run
end

#
