

class Chef::Recipe::IP_test
  def self.in_ip_list?(host,ip,ip_list)
    fqdn = host
    if ip_list.include?(fqdn) || ip_list.include?(ip)
      return true
    end
    return false
  end
end
