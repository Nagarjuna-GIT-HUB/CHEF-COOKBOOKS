#original Automation updating
execute 'update_server_start' do
  command 'sed -i "s/broker.id=[0-9]*/broker.id=4/" /etc/kafka/server.properties && \
sed -i "s/#metric.reporters=/metric.reporters=/g" /etc/kafka/server.properties && \
sed -i "s/#confluent.metrics.reporter.bootstrap.servers=/confluent.metrics.reporter.bootstrap.servers=/g" /etc/kafka/server.properties && \
sed -i "s/#confluent.metrics.reporter.topic.replicas=/confluent.metrics.reporter.topic.replicas=/g" /etc/kafka/server.properties && \
sed -i "s/localhost/kchef1node1.infra.alephys.com/g" /etc/kafka/server.properties'
  action :run
end

#updating server.properties for listeners and advertised.listeners
execute 'update_server_properties' do
  command 'echo "
listeners=PLAINTEXT://kchef1node1.infra.alephys.com:9092
advertised.listeners=PLAINTEXT://kchef1node1.infra.alephys.com:9092" >> /etc/kafka/server.properties'
  action :run
end

#Starting kafka_server
execute 'server_start' do
  command 'systemctl start confluent-server'
  action :run
end

