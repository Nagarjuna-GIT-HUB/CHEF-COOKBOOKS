package 'java-11-openjdk' do
  action :install
end

execute 'java' do
  command 'export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-11.0.25.0.9-2.0.1.el8.x86_64 &&
export PATH=$JAVA_HOME/bin:$PATH'
  action :run
end
