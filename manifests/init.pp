# Install Erlang from package.
#
# Example usage to install the latest version from the repository:
#    include erlang
#
# Usage with version parameter:
#    class { 'erlang':
#      version => '16B02-1',
#    }
class erlang ($version = undef) {
  include erlang::repo

  include erlang::install

  Class[erlang::repo] -> Class[erlang::install]
}
