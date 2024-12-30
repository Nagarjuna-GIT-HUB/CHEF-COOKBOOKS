execute 'kafka_rest_start' do
  command "systemctl start confluent-kafka-rest"
  action :run
end

#
