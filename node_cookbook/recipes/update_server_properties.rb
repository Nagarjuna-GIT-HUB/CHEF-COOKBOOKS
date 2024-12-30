execute 'update_server_properties' do
  command 'echo "
listeners=PLAINTEXT://kchef2client1.infra.alephys.com:9092
advertised.listeners=PLAINTEXT://kchef2client1.infra.alephys.com:9092
metric.reporters=io.confluent.metrics.reporter.ConfluentMetricsReporter
confluent.metrics.reporter.bootstrap.servers=kchef2client1.infra.alephys.com:9092 " >> /etc/kafka/server.properties'
  action :run
end

