

#  bash 'kill' do
#    ignore_failure true
#    code <<-EOH
#    ps aux | grep elasticsearch | awk  '{ print $2 }' | xargs kill  
#    EOH
#  end

  bash 'kill' do
    cwd node['es']['dir']
    code <<-EOH
      var=`jps | grep Elasticsearch | awk '{print $1}'`
      if [ var != '' ]; then
        jps | grep Elasticsearch | awk '{print $1}' | xargs kill
      fi
    EOH
    #only_if "(test -L #{node['es']['dir']})"
  end

