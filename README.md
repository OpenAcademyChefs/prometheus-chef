prometheus-chef Cookbook
========================
This cookbook installs and configures Promtheus server


Requirements
------------

Supported platforms
  - Ubuntu 14.04
  - Ubuntu 12.04

Cookbooks
 - docker cookbook
 - build-essential 

Packages (when building from the source)
 - curl 
 - git
 - gzip
 - mercurial
 - sed

Attributes
----------
TODO: List your cookbook attributes here.

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['prometheus']['install_type']</tt></td>
    <td>String</td>
    <td>Choose how to install prometheus server either from source or using docker</td>
    <td><tt>true</tt></td>
  </tr>
  

</table>


Usage
-----

Contributing
------------

License and Authors
-------------------
 
Authors: Kristian Järvenpää <kristian.jarvenpaa@gmail.com>
