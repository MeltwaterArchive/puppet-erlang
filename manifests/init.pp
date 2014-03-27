# building erlang from source.
#
# example usage:
#    include erlang
#
# usage with version parameter:
#    class { 'erlang': version => '14B04' }
#

class erlang ( $version = '15B01' ) {

  $gpp = $::operatingsystem ? {
    RedHat => 'gcc-c++',
    CentOS => 'gcc-c++',
    Debian => 'g++',
    Ubuntu => 'g++',
  }

  $openssl = $::operatingsystem ? {
    RedHat => 'openssl-devel',
    CentOS => 'openssl-devel',
    Ubuntu => 'libssl-dev',
    Debian => 'libssl-dev',
  }

  if !defined(Package['ncurses-devel']) { package { 'ncurses-devel': ensure => present } }

  if !defined(Package[$openssl]) { package { $openssl: ensure => present } }

  if !defined(Package[$gpp]) { package { $gpp: ensure => present } }

  archive { "erlang${version}":
    url      => "http://www.erlang.org/download/otp_src_R${version}.tar.gz",
    checksum => false,
    target   => '/usr/src',
    require  => Package['ncurses-devel',$openssl, $gpp ]
  }

  exec { "configure erlang ${version}":
    cwd     => "/usr/src/otp_src_R${version}",
    command => "bash -c './configure --without-javac'",
    require => Archive["erlang${version}"],
  }

  exec { "build and install erlang ${version}":
    cwd     => "/usr/src/otp_src_R${version}",
    command => "bash -c 'make && make install'",
    require => Exec["configure erlang ${version}"],
  }

}
