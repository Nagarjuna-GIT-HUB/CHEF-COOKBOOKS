execute 'update_kafka_connect' do
  command 'echo " 
consumer.interceptor.classes=io.confluent.monitoring.clients.interceptor.MonitoringConsumerInterceptor
producer.interceptor.classes=io.confluent.monitoring.clients.interceptor.MonitoringProducerInterceptor " >> /etc/kafka/connect-distributed.properties'
  action :run
end

#
