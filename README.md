Erlang
======

This module installs Erlang from Erlang Solutions' package repository.

Usage
-----
To use the latest version available:

    include erlang

To install a specific version:

    class { 'erlang':
      version => 'R16B02-1',
    }

To check available package versions, see [the package repository](http://packages.erlang-solutions.com/rpm/centos/).
