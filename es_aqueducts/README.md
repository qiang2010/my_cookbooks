es_aqueducts Cookbook
=====================
TODO: install es or update es cluster info.


Requirements
------------
TODO: List your cookbook requirements. Be sure to include any requirements this cookbook has on platforms, libraries, other cookbooks, packages, operating systems, etc.


e.g.
#### packages
It requires a working Java installation on the target node; 

### attributes 

default['es']['package_name'] = 'elasticsearch-1.3.1.tar.gz'

default['es']['dir_name'] = 'elasticsearch-1.3.1'

default['es']['dir'] = '/home/work/local/elasticsearch'

default['es']['bin_dir'] = "#{default['es']['dir']}/#{default['es']['dir_name']}/bin"

default['es']['remote_conf_uil'] = 'work@ai-log-cc00.ai01.baidu.com:/home/work/nfs/provision-cloud/A-stream/conf/elasticsearch.yml'

# you can change file mode 
default['es']['user'] = 'root'
default['es']['group'] = 'root'
default['es']['mode'] = '0775'

# es cluster name
default['es']['cluster_name'] = 'es_cluster_aqueducts'

# es cluster ip list
default['es']['ip_list'] = ["10.202.77.48"]
~                                                                                                                                                                                                            
~                                                    

e.g.
#### es_aqueducts::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['es_aqueducts']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

Usage
-----
#### es_aqueducts::default

######### usage ###############
TODO: Write usage instructions for each cookbook.
 

before install or update cluster info, you should modify default['es']['cluster_name'] and default['es']['ip_list'] 

1. install 
knife node run_list set node_name es_aqueducts

2. updata(run command under cookbooks/ dir)
knife node run_list set node_name recipes[es_aqueducts::update_es_cluster]




e.g.
Just include `es_aqueducts` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[es_aqueducts]"
  ]
}
```

Contributing
------------
TODO: (optional) If this is a public cookbook, detail the process for contributing. If this is a private cookbook, remove this section.

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: TODO: List authors
