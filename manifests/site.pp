node /puppet/ {
  include site::roles::puppet_server
}

node /rabbitmq/ {
  include site::roles::rabbitmq
}

node /sensu/ {
  include site::roles::sensu
}

node /redis/ {
  include site::roles::redis
}
