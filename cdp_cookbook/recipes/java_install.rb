execute 'install_java_jdk' do
  command 'sudo yum install -y java-1.8.0-openjdk-devel'
  action :run
end

execute 'set_java_home' do
  command "echo 'export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk' >> /etc/profile && echo 'export PATH=$PATH:$JAVA_HOME/bin' >> /etc/profile"
  action :run
end


#package 'java-11-openjdk' do
#  action :install
#end

#execute 'java' do
#  command 'export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-11.0.25.0.9-2.0.1.el8.x86_64 &&
#export PATH=$JAVA_HOME/bin:$PATH'
#  action :run
#end
