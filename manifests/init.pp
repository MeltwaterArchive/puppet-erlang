# building erlang from source.
# 
# example usage:
#    include erlang
#
# usage with version parameter:
#    class { 'erlang': version => '14B04' }
#

class erlang ( $version => "15B01" ) {

    $gpp = $operatingsystem ? {
      RedHat,CentOS => 'gcc-c++',
      Debian,Ubuntu => 'g++'
    }

    $openssl = $operatingsystem ? {
      RedHat,CentOS => 'openssl-devel',
      Debian,Ubuntu => 'libssl-dev'
    }

    package { "ncurses-devel":
      ensure => present
    }

    package { $openssl:
      ensure => present
    }

    package { $gpp:
      ensure => present
    }

    include java

    archive { "erlang$version":
      url => "http://www.erlang.org/download/otp_src_R$version.tar.gz",
      checksum => false,
    }

    exec { "configure erlang $version":
      cwd => "/usr/src/otp_src_R$version",
      command => "bash -c './configure',
      require => [ Package["ncurses-devel"], Package[$openssl], Package[$gpp], Archive["erlang$version"] ]
    }

    exec { "build and install erlang $version":
      cwd => "/usr/src/otp_src_R$version",
      command => "bash -c 'make && make install',
      require => Exec["configure erlang $version"],
    }

}
