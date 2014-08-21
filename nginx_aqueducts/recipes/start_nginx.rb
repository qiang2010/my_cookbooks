

  # start nginx
  bash "start_nginx" do
    cwd node["nginx"]["nginx"]
    user  node['nginx']['user']
    group node['nginx']['group']
    code <<-EOH
      ./nginx
    EOH
    only_if "test -f #{node['nginx']['nginx']}/nginx"
  end 
