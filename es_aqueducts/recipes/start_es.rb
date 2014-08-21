

  
  bash 'start' do
    cwd   node['es']['bin_dir']
    user  node['es']['user']
    group node['es']['group']
    code <<-EOH
       ./elasticsearch   & 
    EOH
    only_if "test -f #{node['es']['bin_dir']}/elasticsearch"
  end
