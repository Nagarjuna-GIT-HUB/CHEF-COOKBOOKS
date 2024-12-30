# Import the Confluent key using rpm
execute 'import_confluent_key' do
  command 'rpm --import https://packages.confluent.io/rpm/7.8/archive.key'
  action :run
end

#Create a confluent.repo file
file '/etc/yum.repos.d/confluent.repo' do
  content "[Confluent]
name=Confluent repository
baseurl=https://packages.confluent.io/rpm/7.8
gpgcheck=1
gpgkey=https://packages.confluent.io/rpm/7.8/archive.key
enabled=1

[Confluent-Clients]
name=Confluent Clients repository
baseurl=https://packages.confluent.io/clients/rpm/centos/$releasever/$basearch
gpgcheck=1
gpgkey=https://packages.confluent.io/clients/rpm/archive.key
enabled=1 "
action :create
end

#Installing confluent package
package 'confluent-platform' do
  action :install
end
