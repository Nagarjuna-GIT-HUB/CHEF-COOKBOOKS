execute 'update_control_center' do
  command 'echo "
bootstrap.servers=kchef2node1.infra.alephys.com:9092,kchef2server1.infra.alephys.com:9092,kchef2client1.infra.alephys.com:9092
zookeeper.connect=kchef2node1.infra.alephys.com:2181,kchef2server1.infra.alephys.com:2181,kchef2client1.infra.alephys.com:2181
confluent.controlcenter.connect.controlcenter.cluster=http://kchef2node1.infra.alephys.com:8083
confluent.controlcenter.ksql.controlcenter.url=http://kchef2node1.infra.alephys.com:8088
confluent.controlcenter.schema.registry.url=http://kchef2node1.infra.alephys.com:8081
confluent.controlcenter.streams.cprest.url=http://kchef2node1.infra.alephys.com:8090 " >> /etc/confluent-control-center/control-center-production.properties'
  action :run
end



#execute 'update_control_center' do
#  command 'echo"
#bootstrap.servers=kchef2node1.infra.alephys.com:9092,kchef2server1.infra.alephys.com:9092,kchef2client1.infra.alephys.com:9092
#zookeeper.connect=kchef2node1.infra.alephys.com:2181,kchef2server1.infra.alephys.com:2181,kchef2client1.infra.alephys.com:2181
#confluent.controlcenter.connect.controlcenter.cluster=http://kchef2node1.infra.alephys.com:8083
#confluent.controlcenter.ksql.controlcenter.url=http://kchef2node1.infra.alephys.com:8088
#confluent.controlcenter.schema.registry.url=http://kchef2node1.infra.alephys.com:8081
#confluent.controlcenter.streams.cprest.url=http://kchef2node1.infra.alephys.com:8090"  >> /etc/confluent-control-center/control-center-production.properties'
#  action :run
#en  d

