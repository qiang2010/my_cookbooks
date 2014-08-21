default['es']['package_name'] = 'elasticsearch-1.3.1.tar.gz'

default['es']['dir_name'] = 'elasticsearch-1.3.1'

default["es"]["download_dir"] = "/tmp"

default['es']['dir'] = '/home/work/local/elasticsearch'

default['es']['local_dir'] = '/home/work/local'

default['es']['bin_dir'] = "#{default['es']['dir']}/bin"

default['es']['remote_conf_uil'] = 'work@ai-log-cc00.ai01.baidu.com:/home/work/nfs/provision-cloud/A-stream/conf/elasticsearch.yml'

default['es']['user'] = 'work'
default['es']['group'] = 'work'
default['es']['mode'] = '0775'

# log 
default['es']['es_logs'] = '/home/work/local/elasticsearch/logs'

default['es']['log_dir'] = '/home/work/local/logs/es_logs'


#conf
default['es']['logging_yml_erb'] = 'logging.yml.erb'

default['es']['logging_yml']  = 'logging.yml'

default['es']['cluster_name'] = 'es_cluster_aqueducts'

#discovery.zen.ping.unicast.hosts
default['es']['ip_list'] = ["10.216.100.22"]

# Set the number of shards (splits) of an index (5 by default):
default['es']['number_of_shards'] = 5

# Set the number of replicas (additional copies) of an index (1 by default):
default['es']['number_of_replicas'] = 2

# Path to directory containing configuration (this file and logging.yml):
default['es']['path_conf'] = './conf'

# Path to directory where to store index data allocated for this node.
default['es']['path_data'] = './data'

# Path to log files:
default['es']['path_logs'] = './logs'

# Set a custom port for the node to node communication (9300 by default):
default['es']['transport_tcp_port'] = 8300

# Set a custom port to listen for HTTP traffic:
default['es']['http_port'] = 8200


#### used for delete es ###
default['es']['delete_package_name'] = 'elasticsearch-1.3.1.tar.gz'

default['es']['delete_dir_name'] = 'elasticsearch-1.3.1'

default['es']['delete_dir'] = '/home/work/local/elasticsearch'








