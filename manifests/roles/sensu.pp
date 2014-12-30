class site::roles::sensu {
  class { 'site::profiles::base': } ->
  class { 'site::profiles::redis::server': } ->
  class { 'site::profiles::sensu::server': }
}
