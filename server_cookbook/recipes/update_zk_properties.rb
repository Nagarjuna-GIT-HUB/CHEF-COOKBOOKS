execute 'update_zk_properties' do
  command 'echo "
tickTime=2000
initLimit=5
syncLimit=2
server.1=kchef2node1.infra.alephys.com:2888:3888
server.2=kchef2server1.infra.alephys.com:2888:3888
server.3=kchef2client1.infra.alephys.com:2888:3888
autopurge.snapRetainCount=3
autopurge.purgeInterval=24
maxClientCnxns=0
admin.enableServer=false
audit.enable=true" >> /etc/kafka/zookeeper.properties'
  action :run
end

