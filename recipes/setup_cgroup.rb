ohai "reload" do
  action :reload
end

case node['platform']
when "centos","amazon"
  package "libcgroup" do
    action :install
    only_if { not node[:ec2].nil? and node[:ec2][:instance_type] == 't1.micro'}
  end
end

case node['platform']
when "centos"
  template "/etc/cgconfig.conf" do
    source "cgconfig.conf.erb"
    notifies :restart, "service[cgconfig]", :immediately
    only_if { not node[:ec2].nil? and node[:ec2][:instance_type] == 't1.micro'}
  end
when "amazon"
  template "/etc/cgconfig.conf" do
    source "cgconfig.conf.amazon.erb"
    notifies :restart, "service[cgconfig]", :immediately
    only_if { not node[:ec2].nil? and node[:ec2][:instance_type] == 't1.micro'}
  end
end

service "cgconfig" do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
  only_if { not node[:ec2].nil? and node[:ec2][:instance_type] == 't1.micro'}
end
