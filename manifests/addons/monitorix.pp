class alfresco::addons::monitorix inherits alfresco::addons {
  if ( $osfamily == "Debian" ) {
    # deb http://apt.izzysoft.de/ubuntu generic universe

    apt::source { 'izzysoft':
      location => 'http://apt.izzysoft.de/ubuntu',
      repos => 'generic universe',
      before => Package['monitorix'],
    } 
  }

  if ( $osfamily == "RedHat" ) {
    yumrepo { 'izzysoft':
      baseurl => 'http://apt.izzysoft.de/redhat',
      gpgkey => 'http://apt.izzysoft.de/izzysoft.asc',    
      before => Package['monitorix'],
    }
  }

  package { 'monitorix':
    ensure => installed,
  }

}
