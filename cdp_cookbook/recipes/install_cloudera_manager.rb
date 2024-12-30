execute 'pre_requisite' do
  command 'sudo yum install -y  cloudera-manager-daemons cloudera-manager-agent cloudera-manager-server '
  action :run
  returns [0,1]
end

