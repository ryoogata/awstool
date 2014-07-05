aws = data_bag_item("#{node["aws"]["creds"]["databag"]}", "#{node["aws"]["creds"]["item"]}")

o = ohai "reload" do
  action :nothing
end
o.run_action(:reload)

aws_resource_tag node['ec2']['instance_id'] do
  aws_access_key aws['aws_access_key_id']
  aws_secret_access_key aws['aws_secret_access_key']
  tags({"Name" => "#{node["aws"]["tag_name"]}"})
  action :update
end
