case node['platform']
when "centos"
  package "libcgroup" do
    action :install
  end
end

template "/etc/cgconfig.conf" do
  source "cgconfig.conf.erb"
  notifies :restart, "service[cgconfig]", :immediately
end

service "cgconfig" do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end
