current_dir = File.dirname(__FILE__)
hogehopge
cookbook_path    ["#{current_dir}/../cookbooks", "#{current_dir}/../site-cookbooks"]
node_path        "nodes"
role_path        "roles"
environment_path "environments"
data_bag_path    "data_bags"
#encrypted_data_bag_secret "data_bag_key"

knife[:berkshelf_path] = "#{current_dir}/../cookbooks"
