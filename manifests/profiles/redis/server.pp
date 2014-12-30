class site::profiles::redis::server {

  # Hiera
  $redis_user          = hiera('redis::user', 'redis')
  $redis_group         = hiera('redis::group', 'redis')
  $redis_settings      = hiera_hash('redis::settings', undef)

  # Resources
  anchor { 'site::profiles::redis::server::begin': } ->
  class { '::redis':
    user          => $redis_user,
    group         => $redis_group,
    settings      => $redis_settings,
  } ->
  anchor { 'site::profiles::redis::server::end': }

}
