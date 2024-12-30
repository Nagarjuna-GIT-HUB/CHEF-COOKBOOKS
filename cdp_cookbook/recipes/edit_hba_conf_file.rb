#execute 'insert_lines_afterALine' do
#  command <<-EOH
#    sed -i -e '87a\
#host    all             all             ::1/32                  md5\
#host    all             all             0.0.0.0/0               md5\
#host    ranger          rangeradmin     0.0.0.0/0               md5       //optional\ ' /var/lib/pgsql/14/data/pg_hba.conf
#  EOH
#end

execute 'insert_lines_afterALine' do
  command <<-EOH
    sed -i -e '82a\
host    all             all             ::1/32                  md5' /var/lib/pgsql/10/data/pg_hba.conf
    sed -i -e '83a\
host    all             all             0.0.0.0/0               md5' /var/lib/pgsql/10/data/pg_hba.conf
    sed -i -e '84a\
host    ranger          rangeradmin     0.0.0.0/0               md5' /var/lib/pgsql/10/data/pg_hba.conf
  EOH
end
