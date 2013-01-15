class packages {
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

  $packages = [
    'git',
    'vim',
  ]

  package { $packages:
    ensure  => installed,
    require => Exec['apt resync'],
  }
}
