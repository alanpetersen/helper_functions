# == Class helper_functions::install
#
# This class is called from helper_functions for install.
#
class helper_functions::install {

  package { $::helper_functions::package_name:
    ensure => present,
  }
}
