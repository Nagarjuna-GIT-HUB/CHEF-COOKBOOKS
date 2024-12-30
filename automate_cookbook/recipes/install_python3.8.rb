yum_package ['gcc','openssl-devel', 'bzip2-devel', 'libffi-devel', 'zlib-devel'] do
  action :install
end

