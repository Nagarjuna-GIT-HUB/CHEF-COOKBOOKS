execute 'monitor_config_file' do
  command <<-EOF
    inotifywait -m  /etc/kafka/server.properties --format "%w%f %e %p" | while read -r line; do
      diff -u /etc/kafka/server.properties /root/server.properties.baseline | grep -E '^(@@|\+|$)'
    done
  EOF
  action :run
end
