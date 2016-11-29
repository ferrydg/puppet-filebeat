#
class filebeat::package (
  $ensure = $::filebeat::ensure
) {

  package { 'filebeat':
    ensure => $ensure
  }
}
