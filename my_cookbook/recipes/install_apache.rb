# Install Apache
package 'httpd' do
  action :install
end

# Start and enable the Apache service
service 'httpd' do
  action [:enable, :start]
end

