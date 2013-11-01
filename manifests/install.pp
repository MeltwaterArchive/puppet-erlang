# erlang::repo
class erlang::install {
  case $::osfamily {
    'RedHat', 'SUSE': {
      include erlang::install::rhel
    }
    #'Debian': {
    #  include erlang::repo::apt
    #}
    default: {
      notify { 'Unsupported OS.': }
    }
}
}
