#
# Cookbook:: workstation-recipe
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

directory '/var/cache/workstation' do
  owner 'root'
  group 'root'
  mode '0755'
end

yum_repository 'chrome' do
  baseurl 'http://dl.google.com/linux/chrome/rpm/stable/x86_64'
  gpgcheck true
  gpgkey 'https://dl.google.com/linux/linux_signing_key.pub'
end

yum_repository 'slack' do
  baseurl 'https://packagecloud.io/slacktechnologies/slack/fedora/26/$basearch'
  gpgcheck false
  gpgkey 'https://packagecloud.io/slacktechnologies/slack/gpgkey'
  repo_gpgcheck true
  sslverify true
  sslcacert '/etc/pki/tls/certs/ca-bundle.crt'
end

yum_repository 'mongodb' do
  baseurl 'https://repo.mongodb.org/yum/redhat/7/mongodb-org/3.2/x86_64/'
  gpgcheck true
  gpgkey 'https://www.mongodb.org/static/pgp/server-3.2.asc'
end

dnf_package %w(
  byobu
  deja-dup
  htop
  icedtea-web
  java-1.8.0-openjdk
  nano
  remmina
  freerdp
  u2f-hidraw-policy
  google-chrome-stable
  slack
  mongodb-org-shell
  mongodb-org-tools
)

# Teraform, vagrant, virtualbox, chefdk, rubocop gem,
