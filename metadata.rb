maintainer        "Opscode, Inc."
maintainer_email  "cookbooks@opscode.com"
license           "Apache 2.0"
description       "Installs and configures nginx"
version           "0.100.2"

recipe "nginx", "Installs nginx package and sets up configuration with Debian apache style with sites-enabled/sites-available"
recipe "nginx::source", "Installs nginx from source and sets up configuration with Debian apache style with sites-enabled/sites-available"

%w{ ubuntu debian centos redhat fedora freebsd }.each do |os|
  supports os
end

# moved to recipes/source.rb so that freebsd can be supported directly
#%w{ build-essential runit bluepill }.each do |cb|
#  depends cb
#end

attribute "nginx/dir",
  :display_name => "Nginx Directory",
  :description => "Location of nginx configuration files",
  :default => "/etc/nginx"

attribute "nginx/log_dir",
  :display_name => "Nginx Log Directory",
  :description => "Location for nginx logs",
  :default => "/var/log/nginx"

attribute "nginx/user",
  :display_name => "Nginx User",
  :description => "User nginx will run as",
  :default => "www-data"

attribute "nginx/binary",
  :display_name => "Nginx Binary",
  :description => "Location of the nginx server binary",
  :default => "/usr/sbin/nginx"

attribute "nginx/init_style",
  :display_name => "Nginx Init Style",
  :description => "Preferred init scripts style on this platform",
  :default => "init"

attribute "nginx/default_root",
  :display_name => "Nginx Default Root",
  :description => "Directory for default nginx webroot",
  :default => "/usr/sbin"

attribute "nginx/sbin_path",
  :display_name => "Nginx Sbin Path",
  :description => "Platform-specific path to the sbin directory",
  :default => "/usr/sbin"

attribute "nginx/gzip",
  :display_name => "Nginx Gzip",
  :description => "Whether gzip is enabled",
  :default => "on"

attribute "nginx/gzip_http_version",
  :display_name => "Nginx Gzip HTTP Version",
  :description => "Version of HTTP Gzip",
  :default => "1.0"

attribute "nginx/gzip_comp_level",
  :display_name => "Nginx Gzip Compression Level",
  :description => "Amount of compression to use",
  :default => "2"

attribute "nginx/gzip_proxied",
  :display_name => "Nginx Gzip Proxied",
  :description => "Whether gzip is proxied",
  :default => "any"

attribute "nginx/gzip_types",
  :display_name => "Nginx Gzip Types",
  :description => "Supported MIME-types for gzip",
  :type => "array",
  :default => [ "text/plain", "text/html", "text/css", "application/x-javascript", "text/xml", "application/xml", "application/xml+rss", "text/javascript", "application/javascript", "application/json" ]

attribute "nginx/keepalive",
  :display_name => "Nginx Keepalive",
  :description => "Whether to enable keepalive",
  :default => "on"

attribute "nginx/keepalive_timeout",
  :display_name => "Nginx Keepalive Timeout",
  :default => "65"

attribute "nginx/worker_processes",
  :display_name => "Nginx Worker Processes",
  :description => "Number of worker processes",
  :default => "1"

attribute "nginx/worker_connections",
  :display_name => "Nginx Worker Connections",
  :description => "Number of connections per worker",
  :default => "1024"

attribute "nginx/server_names_hash_max_size",
  :display_name => "Nginx Server Names Hash Max Size",
  :default => "512"

attribute "nginx/server_names_hash_bucket_size",
  :display_name => "Nginx Server Names Hash Bucket Size",
  :default => "64"

attribute "nginx/disable_access_log",
  :display_name => "Disable Access Log",
  :default => "false"
