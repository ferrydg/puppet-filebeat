# == Class packetbeat::params
#
# === Parameters
#
# This class does not provide any parameters.

#
# === Examples
#
# This class is not intended to be used directly.
class filebeat::params {

    $configfile = '/etc/filebeat/filebeat.yml'

    $ensure = 'present'

    $status = 'enabled'

    $default_document_type = 'log'
    
    $output = {
        elasticsearch => {
            enabled => false
        },
        logstash => {
            enabled => false,
            hosts => [],
            worker => 1,
            loadbalance => false,
            port => 10200,
            index => 'packetbeat',
            tls => {},
            timeout => 30,
            max_retries => 3
        },
        file => {
            enabled => false,
            path => '/tmp/packetbeat',
            filename => 'packetbeat',
            rotate_every_kb => 10000,
            number_of_files => 7
        }
    }

    $shipper = {
        name => $fqdn,
        tags => [],
        ignore_outgoing => false,
        refresh_topology_freq => 10,
        topology_expire => 15,
    }

    $logging = {
        to_syslog => true,
        to_files => false,
        files => {
            path => '/var/log/mybeat',
            name => 'mybeat',
            rotateeverybytes => 10485760,
            keepfiles => 7
        },
        selectors => [],
        level => 'error'
    }
}