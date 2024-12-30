file ‘/root/myfile2’ do
  content “This is my second file”
  action :create
  owner ‘root’
  group ‘root’
end
