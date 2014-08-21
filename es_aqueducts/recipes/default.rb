#
# Cookbook Name:: es_aqueducts
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

 
#service 'elasticsearch' do
#  action :enable, :start
#  
#end

if node['platform'] == 'centos' && IP_test.in_ip_list?(node['fqdn'],node['ipaddress'],node['es']['ip_list'])
 
  # kill es 
  include_recipe "es_aqueducts::kill_es" 

  %w{/home /home/work /home/work/local}.each do |dir|
    directory dir do
      owner  node['es']['user']
      group node['es']['group']
      not_if "test -d #{dir}"      
    end
  end
  
  # logs 
  %w{/home/work/local/logs /home/work/local/logs/es_logs}.each do |dir|
    directory dir do
      owner  node["es"]["user"]
      group  node["es"]["group"]
    end
  end  


  # delete if  exists
  dirty_es_dir = node['es']['dir_name'] + "_" + Time.now.to_i.to_s
  bash 'back_es'  do 
    cwd   node['es']['local_dir']
    user  node['es']['user']
    group node['es']['group']

    code <<-EOH
      mv  #{node['es']['dir_name']}    #{dirty_es_dir}
    EOH
    only_if "test -d  #{node['es']['local_dir']}/#{node['es']['dir_name']} "
  end
   

  # should download file into /tmp 
  cookbook_file "#{node['es']['download_dir']}/#{node['es']['package_name']}" do
    source node['es']['package_name']
    owner  node['es']['user']
    group node['es']['group']
  end
   

  # delete link if exist
  bash "delete_link"  do 
    cwd node['es']['local_dir'] 
    code <<-EOH
      rm -fr elasticsearch
    EOH
    only_if "test -L #{node['es']['dir'] }"
  end
  
  # untar package
  bash 'untar' do  
    cwd node["es"]["download_dir"]
    user  node['es']['user']
    group node['es']['group']
    
    code <<-EHO
      tar -xzf #{node["es"]["package_name"]} -C #{node['es']['local_dir']}
      ln -s #{node['es']['local_dir']}/#{node['es']['dir_name']}  #{node['es']['dir']}
    EHO
    only_if "test -f #{node["es"]["download_dir"]}/#{node['es']['package_name']}"
  end


  # config
  template "#{node['es']['dir']}/config/elasticsearch.yml" do
    source "elasticsearch.yml.erb"
    owner node['es']['user']
    group node['es']['group']
  end

  
  template "#{node['es']['dir']}/config/#{node['es']['logging_yml']}" do
    source node['es']['logging_yml_erb']
    owner node['es']['user']
    group node['es']['group']
  end
  
  # log files 
  bash 'log' do
    cwd   node["es"]["dir"]
    user  node['es']['user']
    group node['es']['group']
    code <<-EOH
      ln -s #{node['es']['log_dir']}  #{node['es']['es_logs']}
    EOH
  end  

  
 
  # start service
  bash 'start' do
    cwd   node['es']['bin_dir']
    user  node['es']['user']
    group node['es']['group']
    code <<-EOH
       ./elasticsearch   & 
    EOH
  end


else 
  # check if need to delete es from current node
#   include_recipe "kill_es" 

#  file "#{node['es']['download_dir']}/#{node['es']['package_name']}" do
#    action :delete
#  end 
 
#  bash node['es']['dir'] do
#    cwd node['es']['local_dir']
#    code <<-EOH
#      rm -fr #{node['es']['dir']}
#    EOH
#    only_if "test -f #{node['es']['dir']}"
#  end
 
end

























