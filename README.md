# filebeat

A puppet module to manage filebeat (https://www.elastic.co/products/beats/filebeat)

## Requirements

* Puppet 2.7.x or better.
* The [stdlib](https://forge.puppetlabs.com/puppetlabs/stdlib) Puppet library.

## Usage

### Main class

```
class ( '::filebeat' )
```

### Prospectors

```
filebeat::prospector { 'apache':
	paths => [ 'var/log/httpd/*.log' ],
	doctype => 'apache'
}
```
