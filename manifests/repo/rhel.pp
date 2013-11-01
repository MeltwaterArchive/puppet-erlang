# erlang::repo::rhel
class erlang::repo::rhel {
  yumrepo { 'erlang-solutions':
    descr    => 'Erlang Solutions',
    baseurl  => "http://packages.erlang-solutions.com/rpm/centos/${::operatingsystemmajrelease}/\$basearch",
    gpgkey   => 'http://packages.erlang-solutions.com/rpm/erlang_solutions.asc',
    gpgcheck => 1,
    enabled  => 1,
  }

  exec { 'rpm --import http://packages.erlang-solutions.com/rpm/erlang_solutions.asc':
    unless => 'rpm --query gpg-pubkey|grep gpg-pubkey-a14f4fca-4f2ffae0',
  }
}
