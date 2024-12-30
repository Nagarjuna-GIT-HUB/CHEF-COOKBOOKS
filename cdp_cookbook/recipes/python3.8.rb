execute 'python_developer_tools' do
  command "yum install tar -y "
  action :run
end

execute 'python_developer_tools' do
  command "yum install gcc openssl-devel bzip2-devel libffi-devel zlib-devel -y "
  action :run
end

execute 'download_python_tarball' do
  command <<-EOH
    cd /opt
    curl -O https://www.python.org/ftp/python/3.8.12/Python-3.8.12.tgz
  EOH
  not_if { ::File.exist?('/opt/Python-3.8.12.tgz') }
end

execute 'extract_python_tarball' do
  command <<-EOH
    cd /opt
    tar -zxvf Python-3.8.12.tgz
  EOH
  not_if { ::File.directory?('/opt/Python-3.8.12') }
end

execute 'configure_python_source' do
  command <<-EOH
    cd /opt/Python-3.8.12
    ./configure --enable-shared
  EOH
  cwd '/opt/Python-3.8.12'
  not_if { ::File.exist?('/opt/Python-3.8.12/Makefile') }
end

execute 'compile_python_source' do
  command <<-EOH
    cd /opt/Python-3.8.12
    make
  EOH
  cwd '/opt/Python-3.8.12'
  not_if { ::File.exist?('/opt/Python-3.8.12/python') }
end

execute 'install_python_altinstall' do
  command <<-EOH
    cd /opt/Python-3.8.12
    make altinstall
  EOH
  cwd '/opt/Python-3.8.12'
  not_if "python3.8 --version | grep '3.8.12'"
end


execute 'copy_shared_libraries' do
  command <<-EOH
    cp --no-clobber /opt/Python-3.8.12/libpython3.8.so* /lib64/
    chmod 755 /lib64/libpython3.8.so*
  EOH
  not_if { ::File.exist?('/lib64/libpython3.8.so') }
end




