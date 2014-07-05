include_recipe "route53"
aws = data_bag_item("#{node["aws"]["creds"]["databag"]}", "#{node["aws"]["creds"]["item"]}")

route53_record "create a record" do
  name "#{node['aws']['route53']['hostname']}.#{node['aws']['route53']['zonename']}"
  value node['ec2']['public_ipv4']
  type  "A"
  zone_id               node['aws']['route53']['zone_id']
  aws_access_key_id     aws['aws_access_key_id']
  aws_secret_access_key aws['aws_secret_access_key']
  overwrite true
  action :create
end

# route53_record "delete a record" do
#   name "#{node['aws']['route53']['hostname']}.#{node['aws']['route53']['zonename']}"
#   value node['ec2']['public_ipv4']
#   type  "A"
#   zone_id               node[:route53][:zone_id]
#   aws_access_key_id     aws['aws_access_key_id']
#   aws_secret_access_key aws['aws_secret_access_key']
#   overwrite true
#   action :delete
# end
