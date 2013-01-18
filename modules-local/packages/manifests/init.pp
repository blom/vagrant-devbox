class packages {
  $packages = [
    'autoconf',
    'automake',
    'bison',
    'build-essential',
    'curl',
    'git',
    'gnupg',
    'libc6-dev',
    'libreadline6',
    'libreadline6-dev',
    'libsqlite3-dev',
    'libssl-dev',
    'libtool',
    'libxml2-dev',
    'libyaml-dev',
    'nodejs',
    'npm',
    'openjdk-6-jdk',
    'openssl',
    'pkg-config',
    'sqlite3',
    'subversion',
    'vim',
    'zlib1g',
    'zlib1g-dev',
  ]

  Exec { path => [ '/bin', '/sbin' , '/usr/bin', '/usr/sbin' ] }

  file { '/etc/apt/sources.list':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    content => template('packages/sources.list.erb'),
  }

  exec { 'apt resync':
    command     => 'apt-get update',
    subscribe   => File['/etc/apt/sources.list'],
    refreshonly => true,
  }

  package { $packages:
    ensure  => installed,
    require => Exec['apt resync'],
  }

  apt::source { 'puppetlabs':
    location   => 'http://apt.puppetlabs.com/',
    repos      => 'main',
    key        => '4BD6EC30',
    key_server => 'pool.sks-keyservers.net',
    require    => Package[$packages],
  }

  package { 'puppet':
    ensure  => latest,
    require => Apt::Source['puppetlabs'],
  }
}
