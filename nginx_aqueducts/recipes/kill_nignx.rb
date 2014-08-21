


#  bash 'kill' do
#    code <<-EOH
#    ps aux | grep nginx | awk  '{ print $2 }' | xargs kill
#    EOH
#  end

  bash 'kill_nginx' do
    code <<-EOH
      var=`ps aux | grep nginx| awk '{ print $2, $12}' | grep master | awk '{ print $1}'`
      if [var != '']; then
        ps aux | grep nginx| awk '{ print $2, $12}' | grep master | awk '{print $1}' | xargs kill
      fi
    EOH
  end
