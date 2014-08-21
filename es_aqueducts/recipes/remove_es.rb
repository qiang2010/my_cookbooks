

# this recipe used to delete es 

  service 'elasticsearch' do
    action :stop
  end

  file "#{node['es']['delete_dir']}/#{node['es']['delete_package_name']}" do
    action :delete
    only_if "test -f #{node['es']['delete_dir']}/#{node['es']['delete_package_name']}"
  end

  bash node['es']['delete_dir_name'] do
    cwd node['es']['delete_dir']
    code <<-EOH
      rm -fr #{node['es']['delete_dir_name']}
    EOH
  end


