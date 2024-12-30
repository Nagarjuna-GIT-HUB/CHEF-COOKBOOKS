execute 'value_update' do
  command 'sed -i "s/num.io.threads=[0-9]*/num.io.threads=10/" /root/update_config.rb && \
sed -i "s/socket.send.buffer.bytes=[0-9]*/socket.send.buffer.bytes=1024/" /root/update_config.rb'
  action :run
end

#execute 'value_update' do
#  command 'sed -i "s/num.network.threads=[0-9]*/num.network.threads=5/" /root/update_config.rb'
#  action :run
#end



#execute 'value_update' do
#  command 'echo "
#sed -i "s/num.network.threads=[0-9]*/num.network.threads=5/" /root/update_config.rb " >> /root/update_config.rb'
#  action :run
#end

