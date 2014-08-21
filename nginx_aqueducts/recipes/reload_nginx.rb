

#include_recipe "nginx_aqueducts::kill_nginx"

include_recipe "nginx_aqueducts::shutdown_nginx"

include_recipe "nginx_aqueducts::start_nginx"
