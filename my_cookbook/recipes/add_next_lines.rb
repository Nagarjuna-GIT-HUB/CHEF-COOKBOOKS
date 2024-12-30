execute 'insert_lines_after_10th_line' do
  command <<-EOH
    sed -i '14a\\
server 0.rhel.pool.ntp.org\\
server 1.rhel.pool.ntp.org\\
server 2.rhel.pool.ntp.org' /root/add_next_lines.rb
  EOH
  not_if "grep -q 'server 0.rhel.pool.ntp.org' /root/add_next_lines.rb"
end

