#
class filebeat::service (
  $ensure = $::filebeat::ensure
){
  
  $_ensure = $::filebeat::ensure ? {
    present => 'running',
    absent  => 'stopped',
    default => 'running'
  }

  service { 'filebeat':
    enable => true,
    ensure => $_ensure
  }
  
}
