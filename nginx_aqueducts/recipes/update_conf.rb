

include_recipe 'nginx_aqueducts::shutdown_nginx'

template "#{node["nginx"]["conf_dir"]}/#{node["nginx"]["download_conf"]}" do
  source node["nginx"]["download_conf_erb"]
  owner   node["nginx"]["user"]
  group  node["nginx"]["group"]
  only_if "test -d #{node["nginx"]["conf_dir"]}"
end

template "#{node['nginx']['conf']}/#{node['nginx']['nginx_conf']}"  do
  source node['nginx']['nginx_conf_erb']
  owner  node['nginx']['user']
  group  node['nginx']['group']
  only_if "test -d #{node['nginx']['conf']}"
end

include_recipe 'nginx_aqueducts::start_nginx'
