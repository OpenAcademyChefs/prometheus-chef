prometheus-chef Cookbook
========================
This cookbook installs and configures Promtheus.io

Requirements
------------

Platforms
- Ubuntu 14.04

#### packages
- docker - if using docker to install prometheus

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
