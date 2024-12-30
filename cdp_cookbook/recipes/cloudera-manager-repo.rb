file '/etc/yum.repos.d/cloudera-manager.repo' do
  content '
[cloudera-manager]
name=Cloudera Manager 7.11.3.7
baseurl=https://archive.cloudera.com/p/cm7/7.11.3.7/redhat8/yum/
gpgkey=https://archive.cloudera.com/p/cm7/7.11.3.7/redhat8/yum/RPM-GPG-KEY-cloudera
username=27db33df-0deb-4f00-a831-56002b04e676
password=ff3821869434
gpgcheck=1
enabled=1
autorefresh=0
type=rpm-md

[postgresql10]
name=Postgresql 10
baseurl=https://archive.cloudera.com/postgresql10/redhat8/
gpgkey=https://archive.cloudera.com/postgresql10/redhat8/RPM-GPG-KEY-PGDG-10
enabled=1
gpgcheck=1
module_hotfixes=true'
action :create
end

#file '/root/myfile1' do
#  content "This file is created by chef-infra-client.i am modifying for first time.added crontab file"
#action :create
#end

