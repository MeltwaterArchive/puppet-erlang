# erlang::repo
class erlang::repo {
  case $::osfamily {
    'RedHat', 'SUSE': {
      include erlang::repo::rhel
    }
    #'Debian': {
    #  include erlang::repo::apt
    #}
    default: {
      notify { 'Unsupported OS.': }
    }
  }
}
