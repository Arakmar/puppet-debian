class debian::debconf
{
  package{'debconf': ensure => installed}
}

define debian::debconf::set_selection (
  $selection = '',
  $value_type = 'string',
  $value = ''
) {
  require debian::debconf
  exec{ $name:
    command => "/bin/echo debconf ${selection} ${value_type} ${value} | /usr/bin/debconf-set-selections",
    require => Package['debconf'],
    unless => "/usr/bin/debconf-get-selections | /bin/egrep 'debconf[[:space:]]+${selection}+[[:space:]]+${value_type}+[[:space:]]+${value}'",
  }
}