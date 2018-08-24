# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include puppet_reddit::reddit
class puppet_reddit::reddit {
  package { 'git':
    ensure   => present,
    provider => apt,
  }

  vcsrepo { '/root/reddit':
    ensure   => latest,
    provider => git,
    source   => 'https://github.com/express42/reddit'
  }

  file { '/etc/systemd/system/puma.service':
    source => 'puppet:///modules/puppet_reddit/puma.service'
  }

  service { 'puma':
    ensure   => running,
    provider => systemd,
    enable   => true,
  }
}
