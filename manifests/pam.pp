# see http://bugs.debian.org/583958
class debian::pam(
    $pam_umask_fix = false
) {

  file { "/etc/pam.d/common-session":
    ensure  => file,
    owner   => root,
    group   => root,
    mode    => 644,
    content => template("debian/common-session.${::operatingsystem}-${::lsbdistcodename}.erb")
  }

}
