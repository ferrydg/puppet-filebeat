#
class filebeat::config (
){

    concat { $filebeat::configfile: 
    	notify => Service['filebeat']
    }

    concat::fragment { 'filebeat_header':
        target => $filebeat::configfile,
        order => 00,
        content => template('filebeat/config/00_header.erb'),
    }

    concat::fragment { 'filebeat_filebeat':
        target => $filebeat::configfile,
        order => 20,
        content => template('filebeat/config/20_filebeat.erb'),
    }

    concat::fragment { 'filebeat_prospectors':
        target => $filebeat::configfile,
        order => 30,
        content => template('filebeat/config/30_prospectors_header.erb'),
    }

    $output_conf = deep_merge($filebeat::params::output, $filebeat::output)

    concat::fragment { 'filebeat_output':
        target => $filebeat::configfile,
        order => 40,
        content => template('filebeat/config/40_output.erb'),
    }

    $shipper_conf = deep_merge($filebeat::params::shipper, $filebeat::shipper)

    concat::fragment { 'filebeat_shipper':
        target => $filebeat::configfile,
        order => 50,
        content => template('filebeat/config/50_shipper.erb'),
    }

    $logging_conf = deep_merge($filebeat::params::logging, $filebeat::logging)

    concat::fragment { 'filebeat_logging':
        target => $filebeat::configfile,
        order => 60,
        content => template('filebeat/config/60_logging.erb'),
    }

}