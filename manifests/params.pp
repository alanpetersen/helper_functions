# == Class helper_functions::params
#
# This class is meant to be called from helper_functions.
# It sets variables according to platform.
#
class helper_functions::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'helper_functions'
      $service_name = 'helper_functions'
    }
    'RedHat', 'Amazon': {
      $package_name = 'helper_functions'
      $service_name = 'helper_functions'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
