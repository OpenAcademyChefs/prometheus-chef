prometheus-chef cookbook
========================
This cookbook installs and configures Promtheus server.

Requirements
------------

Note that if you want to use docker it requires your that your kernel version is at least 3.8. This cookbook doesn't update your kernel.

Supported platforms
  - Ubuntu 14.04
  - Ubuntu 12.04
  - CentOS 6.6
  - Debian 7

Cookbooks
 - docker cookbook
 - build-essential 

Packages (when building from the source)
 - curl 
 - git
 - gzip
 - mercurial
 - sed
 - vim-common


Attributes
----------
See <a href="https://github.com/OpenAcademyChefs/prometheus-chef/attributes/default">attributes/default.rb</a> for default values.</a>

Attribute  | Description
------------- | -------------
['prometheus']['install_type']  | How installation is done. Either 'docker' or 'source'
['prometheus']['port']  | What port prometheus uses
['prometheus']['install_path'] | Where prometheus is installed.
['prometheus']['config'] | Configurations as one big string
['prometheus'][gomaxproc'] | Max number of threads used. 

Usage
-----
Add default recipe as a dependency and include it from inside another cookbook.
By default the recipe configures prometheus to monitor itself.
This probably isn't what you want so you should override at least configuration attribute.

For example you could add the following to your cookbook
```ruby
node.override['prometheus']['install_type'] = 'docker'

node.override['prometheus']['config'] = "
global: {
  scrape_interval: '20s'     
}

job: {
  
  name: 'prometheus'
  scrape_interval: '10s'

  target_group: {
    target: 'http://localhost:9090/metrics'
  }
}
"

include_recipe 'prometheus-chef::default'
```

Contributing
------------
Currently, just make a new branch and name it 'your_name/new_feature'.
Make a pull request to develop branch.

License and Authors
-------------------

- Author: Kristian Järvenpää <kristian.jarvenpaa@gmail.com>

Copyright (c) 2015 Kristian Järvenpää

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
