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
    ensure => present,
    owner  => 'root',
    group  => 'root',
    source => 'puppet:///modules/packages/sources.list',
  }

  exec { 'apt resync':
    command => 'apt-get update',
    require => File['/etc/apt/sources.list'],
    unless  => 'ls /var/lib/apt/lists/mirrors.ubuntu.com_mirrors.txt_*',
  }

  package { $packages:
    ensure  => installed,
    require => Exec['apt resync'],
  }
}
