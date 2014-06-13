case node['platform']
when "centos","amazon"
  package "libcgroup" do
    action :install
  end
end

case node['platform']
when "centos"
  template "/etc/cgconfig.conf" do
    source "cgconfig.conf.erb"
    notifies :restart, "service[cgconfig]", :immediately
  end
when "amazon"
  template "/etc/cgconfig.conf" do
    source "cgconfig.conf.amazon.erb"
    notifies :restart, "service[cgconfig]", :immediately
  end
end

service "cgconfig" do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end
