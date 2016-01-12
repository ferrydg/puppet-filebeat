#
class filebeat::service (
  $ensure             = $filebeat::ensure
){
  
  service { 'filebeat':
    enable => true,
    ensure => 'running'
  }
  
}