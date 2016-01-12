#
class filebeat::config (
){

    concat { $filebeat::configfile: 
    	notify => Service['filebeat']
    }

    $sniffer_conf = deep_merge($filebeat::params::sniffer, $filebeat::sniffer)

    concat::fragment { 'sniffer':
        target => $filebeat::configfile,
        order => 10,
        content => template('filebeat/config/10_sniffer.erb'),
    }

    concat::fragment { 'protocols_header':
        target => $filebeat::configfile,
        order => 20,
        content => template('filebeat/config/20_protocols_header.erb'),
    }

    concat::fragment { 'procs_header':
        target => $filebeat::configfile,
        order => 30,
        content => template('filebeat/config/30_procs_header.erb'),
    }

    $output_conf = deep_merge($filebeat::params::output, $filebeat::output)

    concat::fragment { 'output':
        target => $filebeat::configfile,
        order => 40,
        content => template('filebeat/config/40_output.erb'),
    }

    $shipper_conf = deep_merge($filebeat::params::shipper, $filebeat::shipper)

    concat::fragment { 'shipper':
        target => $filebeat::configfile,
        order => 50,
        content => template('filebeat/config/50_shipper.erb'),
    }

    $logging_conf = deep_merge($filebeat::params::logging, $filebeat::logging)

    concat::fragment { 'logging':
        target => $filebeat::configfile,
        order => 60,
        content => template('filebeat/config/60_logging.erb'),
    }

}