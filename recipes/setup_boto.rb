template "/root/.boto" do
  source "boto.erb"
  owner "root"
  group "root"
  mode 0600
end

include_recipe "awstool::setup_boto_#{node["boto"]["install_method"]}"
