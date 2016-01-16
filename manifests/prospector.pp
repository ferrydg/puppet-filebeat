#
define filebeat::prospector (
    $paths = [],
    $doctype = $filebeat::params::default_document_type
) {
    concat::fragment { "filebeat_prospector_$name":
        target => $filebeat::configfile,
        order => 31,
        content => template('filebeat/config/31_prospector.erb'),
    }
}