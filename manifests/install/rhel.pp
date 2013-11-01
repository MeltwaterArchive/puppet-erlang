# erlang::install::rhel
class erlang::install::rhel {
  $pkg_provider = 'yum'

  if $erlang::version != undef {
    $pkg_name = "erlang-${erlang::version}"
    $pkg_ensure = 'installed'
  } else {
    $pkg_name = 'erlang'
    $pkg_ensure = 'latest'
  }

  package { $pkg_name:
    ensure   => $pkg_ensure,
    provider => $pkg_provider,
  }
}
