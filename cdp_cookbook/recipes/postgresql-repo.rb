file '/etc/yum.repos.d/postgres.repo' do
  content '
[pgdg14]
name=PostgreSQL 14
baseurl=https://download.postgresql.org/pub/repos/yum/14/redhat/rhel-8-x86_64
enabled=1
gpgcheck=1
gpgkey=https://download.postgresql.org/pub/repos/yum/RPM-GPG-KEY-PGDG'
action :create
end

