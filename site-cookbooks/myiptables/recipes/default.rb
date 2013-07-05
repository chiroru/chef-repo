#
# Cookbook Name:: myiptables
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "iptables" do
end

case node[:platform]
when "centos"
  iptables_save_file = "/etc/sysconfig/iptables"

  template "iptables_save_file" do
    source "iptables_load.erb"
    mode 0600
    variables :iptables_save_file => iptables_save_file
  end
end

iptables_rule "all_established"
iptables_rule "all_icmp"
iptables_rule "ssh"
iptables_rule "http"
