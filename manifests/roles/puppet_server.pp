class site::roles::puppet_server {
  contain site::profiles::base
  contain puppet::server
  contain puppetdb
  contain puppetdb::master::config
}
