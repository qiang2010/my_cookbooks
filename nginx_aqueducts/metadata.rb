name             'nginx_aqueducts'
maintainer       'Baidu'
maintainer_email 'jiqiang@baidu.com'
license          'All rights reserved'
description      'Installs/Configures nginx'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.2.4'

recipe "nginx_aqueducts::default", "install nginx on node"

recipe "nginx_aqueducts::shutdown_nginx", "shutdown nginx in soft manner"

recipe "nginx_aqueducts::kill_nginx", "kill nginx process"

recipe "nginx_aqueducts::start_nginx", "start nginx"

recipe "nginx_aqueducts::reload_nginx", "restart nginx"

recipe "nginx_aqueducts::updata_nginx_conf", "update nginx conf"

 
supports 'centos'
