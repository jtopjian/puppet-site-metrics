class site::profiles::rabbitmq::server {

  anchor { 'site::profiles::rabbitmq::server::begin': }
  anchor { 'site::profiles::rabbitmq::server::end': }
  Class {
    require => Anchor['site::profiles::rabbitmq::server::begin'],
    before  => Anchor['site::profiles::rabbitmq::server::end']
  }

  # Hiera
  $rabbitmq_users       = hiera_hash('rabbitmq::users')
  $rabbitmq_vhosts      = hiera_hash('rabbitmq::vhosts')
  $rabbitmq_permissions = hiera_hash('rabbitmq::permissions')

  # Install and configure the rabbitmq server
  class { '::rabbitmq':
    admin_enable      => true,
    delete_guest_user => true,
  }

  # Create users, vhosts, and permissions
  create_resources(rabbitmq_user, $rabbitmq_users)
  create_resources(rabbitmq_vhost, $rabbitmq_vhosts)
  create_resources(rabbitmq_user_permissions, $rabbitmq_permissions)

}
