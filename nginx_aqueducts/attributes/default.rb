default["nginx"]["user"] = "work"


default["nginx"]["group"] = "work"

default["nginx"]["package_download_dir"] = "/tmp"


default["nginx"]["package_name"] = "nginx-1.6.1.tar.gz"
default["nginx"]["package_name_dir"] = "nginx-1.6.1"

default["nginx"]["dir_name"] = "nginx"

default["nginx"]["dir"] = "/home/work/local" 

default['nginx']['log_dir'] = '/home/work/local/logs/nginx_logs'

default['nginx']['nginx_logs'] = '/home/work/local/nginx/logs'

default["nginx"]["nginx_dir"] = "/home/work/local/nginx"

# nginx start stop or reload script 
default["nginx"]["nginx"] = "/home/work/local/nginx/sbin/"


# dir userd for conf files
default["nginx"]["conf_dir"] = "/home/work/local/nginx/conf/conf.d"

default['nginx']['conf'] = "/home/work/local/nginx/conf"

# link files 
default["nginx"]["aqueducts_conf"] = "/home/work/local/Aqueducts/current/config/nginx.conf"
default["nginx"]["aqeuducts_conf_name"] = "aqueducts.conf"

default["nginx"]["aqueducts_ui_conf"] = "/home/work/local/aqueducts-ui/current/config/nginx.conf"
default["nginx"]["aqueducts_ui_conf_name"] = "aqueducts-ui.conf"

default["nginx"]["bigdesk_conf"] = "/home/work/local/bigdesk/nginx.conf"
default["nginx"]["bigdesk_conf_name"] = "bigdesk.conf"

default["nginx"]["clog_conf"] = "/home/work/local/kibana/nginx.conf"
default["nginx"]["clog_conf_name"] = "clog.conf"

default["nginx"]["es_head_conf"] = "/home/work/local/elasticsearch-head/nginx.conf"
default["nginx"]["es_head_conf_name"] = "elasticsearch-head.conf"
# conf file

default["nginx"]["download_conf"] = "download.conf"

default["nginx"]["download_conf_erb"] = "download.conf.erb"

default['nginx']['nginx_conf_erb'] = 'nginx.conf.erb'

default['nginx']['nginx_conf'] = 'nginx.conf'

default['nginx']['listen_port'] = 8089

default['nginx']['server_name'] = 'localhost'

default['nginx']['worker_connections'] = 1024
