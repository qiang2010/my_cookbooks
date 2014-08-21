# this recipe used to update es cluster
# will update elasticsearch.yml file

  include_recipe 'es_aqueducts::kill_es'


  template "#{node['es']['dir']}/config/elasticsearch.yml" do
    source "elasticsearch.yml.erb"
    user   node['es']['user']
    group  node['es']['group']
    only_if "test -d #{node['es']['dir']}/config"
  end

  template "#{node['es']['dir']}/config/#{node['es']['logging_yml']}" do
    source node['es']['logging_yml_erb']
    owner node['es']['user']
    group node['es']['group']
    only_if "test -d #{node['es']['dir']}/config"
  end


  include_recipe 'es_aqueducts::start_es'

