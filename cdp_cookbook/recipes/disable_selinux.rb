chef_gem 'chef-rewind'

# Recipe to modify SELinux configuration
execute 'disable_selinux' do
  command "sed -i 's/^SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config"
  action :run
  notifies :run, 'execute[apply_selinux]', :immediately
  only_if "grep -q '^SELINUX=enforcing' /etc/selinux/config"
end

execute 'apply_selinux' do
  command 'setenforce 0'
  action :nothing
end

