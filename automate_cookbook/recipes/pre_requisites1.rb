execute 'pre_requisites' do
  command 'echo 1 > /proc/sys/vm/swappiness'
  action :run
end

#&& systemctl status tuned
execute 'pre_requisites' do
  command 'systemctl stop tuned && systemctl disable tuned'
  action :run
end

#dnf_package ['ntp'] do
#  action :install
#end

#execute 'pre_requisites' do
#  command 'yum install ntp -y'
#  action :run
#end

package 'chrony' do
  action :install
end

# Enable and start the chrony service
service 'chronyd' do
  action [:enable, :start]
end

# Verify the chrony service status
execute 'verify_chrony_status' do
  command 'systemctl status chronyd'
  action :run
end

#execute 'pre_requisites' do
#  command 'systemctl start ntpd && systemctl enable tuned'
#  action :run
#end

#execute 'insert_lines_after_aline' do
#  command <<-EOH
#    sed -i '14a\\
#server 0.rhel.pool.ntp.org\\
#server 1.rhel.pool.ntp.org\\
#server 2.rhel.pool.ntp.org' /etc/ntp.conf
#  EOH
#  not_if "grep -q 'server 0.rhel.pool.ntp.org' /etc/ntp.conf"
#end

#execute 'pre_requisites' do
#  command 'sudo ntpq -p'
#  action :run
#end

execute 'pre_requisites' do
  command 'umask 0022'
  action :run
end

