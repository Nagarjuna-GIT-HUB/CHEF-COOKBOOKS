# List of files to monitor
files_to_monitor = [
  '/etc/kafka/zookeeper.properties',
  '/etc/kafka/server.properties'
]

# Specify the path where the original files are stored
original_file_path = '/etc/kafka/backup_files/'

files_to_monitor.each do |file_path|
  # Ensure the original file exists on the node (in the backup location)
  original_file = "#{original_file_path}#{File.basename(file_path)}"

  # Create the original backup file if it doesn't exist
  execute "backup_original_#{file_path}" do
    command "cp -n #{file_path} #{original_file}" # `-n` ensures no overwrite
    only_if { File.exist?(file_path) && !File.exist?(original_file) } # Only if the original doesn't exist
  end

  # Check for changes and restore the file if necessary
  execute "check_and_restore_#{file_path}" do
    command "cp #{original_file} #{file_path}" # Restore from backup
    only_if "diff #{file_path} #{original_file} > /dev/null 2>&1 || echo modified" # Detect differences
    notifies :write, "log[File #{file_path} has been restored to its original state]", :immediately
  end
end

# Define the log resource that will be notified when a file is restored
log 'File restoration complete.' do
  level :info
  action :nothing # It will be triggered by the notify from the execute resource
end

# Define the log for file restoration notification
files_to_monitor.each do |file_path|
  log "File #{file_path} has been restored to its original state" do
    level :info
    action :nothing # This log is triggered by the `execute` resource
    subscribes :write, "execute[check_and_restore_#{file_path}]", :immediately
  end
end

