class site::roles::rabbitmq {
  class { 'site::profiles::base': } ->
  class { 'site::profiles::rabbitmq::server': }
}
