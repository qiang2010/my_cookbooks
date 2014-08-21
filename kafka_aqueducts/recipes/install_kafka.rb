


if node['platform'] == 'centos'
  
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
   
  
  
end
