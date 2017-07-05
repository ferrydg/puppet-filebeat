# Class: filebeat
# ===========================
#
# Full description of class filebeat here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'filebeat':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2016 Your name here, unless otherwise noted.
#
class filebeat (
    $ensure = $::filebeat::params::ensure,
    $status = $::filebeat::params::status,
    $manage_repo = false,
    $configfile = $::filebeat::params::configfile,
    $major_version = $::filebeat::params::major_version,
    $sniffer = {},
    $output = {},
    $shipper = {},
    $logging = {}
) inherits filebeat::params {

    ### Validate input ###

    # output
    validate_hash($output)

    ###
    if ($manage_repo == true) {
        include filebeat::repo
    }
    include filebeat::package
    include filebeat::config
    include filebeat::service
}
