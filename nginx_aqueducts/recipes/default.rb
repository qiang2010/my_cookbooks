#
# Cookbook Name:: nginx_aqueducts
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

if node['platform'] == 'centos' 
  
   # shut down nginx
   include_recipe 'nginx_aqueducts::shutdown_nginx'


  %w{/home/work /home/work/local}.each do |dir|
    directory dir do
      owner  node["nginx"]["user"]
      group node["nginx"]["group"]
    end
  end

  # /home/work/logs/nginx_logs dir
  %w{/home/work/local/logs /home/work/local/logs/nginx_logs}.each do |dir|
    directory dir do
      owner  node["nginx"]["user"]
      group  node["nginx"]["group"]
    end
  end
   

  # delete if exists
  #dirty_nginx_dir = "/tmp/nginx_" + Time.now.to_i.to_s
  back_dir = node['nginx']['package_name_dir'] +"_"+Time.now.to_i.to_s
  bash "back" do
    cwd   node["nginx"]["dir"]    # /home/work/loacl
    user  node["nginx"]["user"]
    group node['nginx']['group']
    
    code <<-EOH
      mv  #{node["nginx"]["package_name_dir"]}  #{back_dir}
    EOH
    only_if "test -d  #{node["nginx"]["dir"]}/#{node["nginx"]["package_name_dir"]}"
  end


  
  # download nginx tar file to /tmp
  cookbook_file "#{node['nginx']['package_download_dir']}/#{node["nginx"]["package_name"]}" do
    source node["nginx"]["package_name"]
    owner   node["nginx"]["user"]
    group  node["nginx"]["group"]
  end
  
  # delete link if exist
  bash "delete_link"  do 
    cwd node['nginx']['dir'] 
    code <<-EOH
      rm -fr nginx
    EOH
    only_if "test -L #{node['nginx']['nginx_dir'] }"
  end
  

  # untar file
  bash 'install' do
    #cwd node["nginx"]["nginx_dir"]
    cwd node["nginx"]["package_download_dir"]
    user node['nginx']['user']
    group node['nginx']['group']
    code <<-EOH
      tar -xzf #{node["nginx"]["package_name"]} -C #{node["nginx"]["dir"]} 
      cd #{node["nginx"]["dir"]}
      ln -s  #{node["nginx"]["dir"]}/#{node["nginx"]["package_name_dir"]}   #{node["nginx"]["nginx_dir"]}  
    EOH
    only_if "test -f #{node["nginx"]["package_download_dir"]}/#{node["nginx"]["package_name"]}"
  end

  

  # mkdir /home/work/local/nginx/conf/conf.d
  directory node["nginx"]["conf_dir"] do
    owner  node["nginx"]["user"]
    group node["nginx"]["group"]
    not_if "test -d #{node["nginx"]["conf_dir"]}"
  end

  # config file: download.conf 
  template "#{node["nginx"]["conf_dir"]}/#{node["nginx"]["download_conf"]}" do
    source node["nginx"]["download_conf_erb"]
    owner   node["nginx"]["user"]
    group  node["nginx"]["group"]
  end
  
  template "#{node['nginx']['conf']}/#{node['nginx']['nginx_conf']}"  do
    source node['nginx']['nginx_conf_erb']
    owner  node['nginx']['user']
    group  node['nginx']['group']
  end
 
  # links 
#  bash 'links' do
#    cwd node["nginx"]["conf_dir"]
#    user node['nginx']['user']
#    code <<-EOH
#      ln -s #{node["nginx"]["aquecucts_conf"]}    #{node["nginx"]["aqeuducts_conf_name"]}
#      ln -s #{node["nginx"]["aquecucts_ui_conf"]} #{node["nginx"]["aquecucts_ui_conf_name"]}
#      ln -s #{node["nginx"]["bigdesk_conf"]}      #{node["nginx"]["bigdesk_conf_name"]}
#      ln -s #{node["nginx"]["clog_conf"]}         #{node["nginx"]["clog_conf_name"]}
#      ln -s #{node["nginx"]["es_head_conf"]}      #{node["nginx"]["es_head_conf_name"]}     
#    EOH
#  end
 

  bash 'log' do
    cwd node["nginx"]["nginx_dir"]
    user node['nginx']['user']
    group node['nginx']['group']
    code <<-EOH
       ln -s #{node['nginx']['log_dir']}  #{node['nginx']['nginx_logs']}
    EOH
  end 

  # make nginx and start nginx
  bash 'make' do
    cwd node["nginx"]["nginx_dir"]
    user  node['nginx']['user']
    group node['nginx']['group']
    code <<-EOH
      ./configure --prefix=/home/work/local/nginx
      make
      make install
      cd ./sbin
      ./nginx
    EOH
  end
 
end





