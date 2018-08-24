# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include puppet_reddit::reddit
class puppet_reddit::reddit {
  file{'/etc/systemd/system/puma.service':
    source => 'puma.service'
  }

  service{'puma':
    enable => true,
    ensure => 'running',
  }
}
