# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include puppet_reddit::reddit
class puppet_reddit::reddit {
  package { 'git':
    provider => apt,
    ensure   => present,
  }

  vcsrepo { '/root/reddit':
    provider => git,
    ensure   => latest,
    source   => 'https://github.com/express42/reddit'
  }

  file { '/etc/systemd/system/puma.service':
    source => 'puppet:///modules/puppet_reddit/puma.service'
  }

  service { 'puma':
    provider => systemd,
    enable   => true,
    ensure   => running,
  }
}
