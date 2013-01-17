include packages
include mysql::server::account_security

class { 'mysql::server':
  config_hash => {
    'bind_address'  => '127.0.0.1',
    'root_password' => 'vagrant',
  },
}

Class['packages'] -> Class['mysql::server']

database_user { 'vagrant@localhost':
  password_hash => mysql_password('vagrant'),
  require       => Class['mysql::server'],
}

database_grant { 'vagrant@localhost':
  privileges => ['all'],
  require    => Class['mysql::server'],
}

file { '/home/vagrant/.my.cnf':
  ensure  => present,
  owner   => 'vagrant',
  group   => 'vagrant',
  mode    => '0600',
  content => "[client]\nuser=vagrant\npassword=vagrant\n"
}

class { 'timezone':
  timezone => 'UTC',
}
