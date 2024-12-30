template '/root/update_config.rb' do
  source 'templates/default/update_config.erb' 
  variables(
    config: <<-EOF
      num.network.threads=5
      num.io.threads=10
      socket.send.buffer.bytes=1024
      socket.receive.buffer.bytes=10400
      socket.request.max.bytes=1 gb
    EOF
  )
end





#%w{STRING1 STRING2}.each do |i|
#  replace_or_add 'num.network.threads=5
#num.io.threads=10
#socket.send.buffer.bytes=1024
#socket.receive.buffer.bytes=10400
#socket.request.max.bytes=1 gb'
#path '/root/update_config.rb'
#pattern "#{i}"
#line "#{i}"
#  end
#end



#file '/root/update_config.rb' do  
#  action :edit
#  content <<-EOF
#    num.network.threads=5
#    num.io.threads=10
#    socket.send.buffer.bytes=1024
#    socket.receive.buffer.bytes=10400
#    socket.request.max.bytes=1 gb 
#  EOF
#end

