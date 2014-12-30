class site::roles::redis {
  class { 'site::profiles::base': } ->
  class { 'site::profiles::redis::server': }
}
