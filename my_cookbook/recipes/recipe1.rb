#
# Cookbook:: my_cookbook
# Recipe:: recipe1
#
# Copyright:: 2024, The Authors, All Rights Reserved.

file '/root/myfile1' do
  content "This file is created by chef-infra-client.i am modifying for first time.added crontab file"
action :create
end
