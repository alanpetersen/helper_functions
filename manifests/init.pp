# Class: helper_functions
# ===========================
#
# Full description of class helper_functions here.
#
# Parameters
# ----------
#
# * `sample parameter`
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
class helper_functions (
  $package_name = $::helper_functions::params::package_name,
  $service_name = $::helper_functions::params::service_name,
) inherits ::helper_functions::params {

  # validate parameters here

  class { '::helper_functions::install': } ->
  class { '::helper_functions::config': } ~>
  class { '::helper_functions::service': } ->
  Class['::helper_functions']
}
