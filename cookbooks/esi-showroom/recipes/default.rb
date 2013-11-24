
node['nginx']['default_site_enabled'] = false

node['varnish']['listen_port'] = 80
node['varnish']['vcl_cookbook'] = "esi-showroom"
node['varnish']['ttl'] = 0

include_recipe "apt"
include_recipe "nginx"
include_recipe "php"
include_recipe "php-fpm"
include_recipe "varnish"
include_recipe "composer"

package "ant" do
    action :install
end

template "/etc/nginx/sites-enabled/symfony.conf" do
    source "symfony.conf.erb"
    mode 0644
    notifies :restart, 'service[nginx]'
end

template "/etc/nginx/sites-enabled/legacy.conf" do
    source "legacy.conf.erb"
    mode 0644
    notifies :restart, 'service[nginx]'
end
