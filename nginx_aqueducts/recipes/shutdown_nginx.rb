

  # stop nginx softly
  
  bash "stop" do
    cwd node["nginx"]["nginx"]
    code <<-EOH
       ./nginx -s stop
    EOH
    only_if "test -f #{node["nginx"]["nginx_logs"]}/nginx.pid"
  end
