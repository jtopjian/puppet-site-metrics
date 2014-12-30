class site::profiles::sensu::server {

  # Hiera
  $rabbitmq_user     = hiera('sensu::rabbitmq::user')
  $rabbitmq_password = hiera('sensu::rabbitmq::password')
  $rabbitmq_host     = hiera('sensu::rabbitmq::host')
  $rabbitmq_vhost    = hiera('sensu::rabbitmq::vhost')
  $plugins           = hiera_array('sensu::plugins', [])

  # Resources
  anchor { 'site::profiles::sensu::server::begin': } ->
  class { '::sensu':
    server            => true,
    api               => true,
    rabbitmq_user     => $rabbitmq_user,
    rabbitmq_password => $rabbitmq_user,
    rabbitmq_host     => $rabbitmq_user,
    rabbitmq_vhost    => $rabbitmq_vhost,
    plugins           => $plugins,
  } ->
  anchor { 'site::profiles::sensu::server::end': }

}
