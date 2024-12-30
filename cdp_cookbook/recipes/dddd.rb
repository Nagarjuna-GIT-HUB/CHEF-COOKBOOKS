execute 'ddd' do
  command 'echo  LC_ALL="en_US.UTF-8" >> /root/dd.txt'
#  command 'echo never > /sys/kernel/mm/transparent_hugepage/defrag'
  action :run
end
