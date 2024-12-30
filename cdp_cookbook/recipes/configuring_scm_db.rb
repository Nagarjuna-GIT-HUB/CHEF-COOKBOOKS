# Set the command with password as an environment variable or pass it securely
password = 'alph4321'

# Use the execute resource to run the script
execute 'prepare_scm_database' do
  command "/opt/cloudera/cm/schema/scm_prepare_database.sh -h kcdp1node1.infra.alephys.com -P 5432 postgresql scm scm"
  environment({
    'PGPASSWORD' => password # Use PGPASSWORD environment variable to pass the password
  })
  user 'postgres' # Ensure this runs as root or the required user
  action :run
#  not_if { ::File.exist?('/opt/cloudera/cm/schema/scm_prepare_database.sh') } # Ensure the script exists
  returns [0,1]
end

#sudo /opt/cloudera/cm/schema/scm_prepare_database.sh -h 10.1.14.104 -P 5432 postgresql scm scm

#execute 'scm_db_configure' do
#  command 'sudo /opt/cloudera/cm/schema/scm_prepare_database.sh -h kcdp1node1.infra.alephys.com -P 5432 postgresql scm scm -p alph4321 '
#  action :run
 # returns [0,6]
#end
