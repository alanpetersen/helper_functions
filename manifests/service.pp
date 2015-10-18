# == Class helper_functions::service
#
# This class is meant to be called from helper_functions.
# It ensure the service is running.
#
class helper_functions::service {

  service { $::helper_functions::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
