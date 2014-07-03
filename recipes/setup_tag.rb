o = ohai "reload" do
  action :nothing
end
o.run_action(:reload)

aws_resource_tag node['ec2']['instance_id'] do
  aws_access_key "#{node["aws"]["_ACCESS_KEY"]}"
  aws_secret_access_key "#{node["aws"]["_SECRET_KEY"]}"
  tags({"Name" => "#{node["aws"]["name"]}"})
  action :update
end
