#
# Cookbook Name:: kafka_aqueducts
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

if node['platform'] =='centos' 

  file '/home/work/chef_client/qiang_test7' do
    content "qiang"
    puts "-----------begin---------"
  end  

  # check if zk is installed
  # check if service zk is started
  service 'zookeeper' do
    ignore_failure false
    action [:enable,:start]
    Chef::Log.info("checking zookeeper service... error...")
    #only_if 'test -f /home/wrok/local/zookeeper'
  end


  directory node['kafka']['dir'] do
    not_if 'test -f /home/work/local/kafka'
  end

  remote_file  node['kafka']['url'] do
    path   "#{node['kafka']['dir']}/#{node['kafka']['package_name']}"
    source node['kafka']['url']
    user 'work'
    group 'work'
    mode  '0777'
  end
  
  bash "install" do 
    cwd node['kafka']['dir']
    user 'work'
    code <<-EOH
      tar -xzf #{node['kafka']['package_name']}
    EOH
  end

  # config the broker .id
  # id must   be unique
  template "#{node['kafka']['dir']}/#{node['kafka']['dir_name']}/config/server.properties" do   
    source 'server.properties.erb'
    owner 'work'
    group 'work'
    mode  '0777'
    variables ({
       :broker_id => node[node['fqdn']]['id']
    })
  end
  
  # strat service
  bash 'start' do
    cwd "#{node['kafka']['dir']}/#{node['kafka']['dir_name']}"
    user 'work'
    code <<-EOF
      bin/kafka-server-start.sh config/server.properties
    EOF
  end
end
  
  


