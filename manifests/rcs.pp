# puppet module: debian
#         class: debian::rcs
#
# Copyright © 2010 martin f. krafft <madduck@madduck.net>
# Released under the terms of the Artistic Licence 2.0
#
class debian::rcs(
    $debian_rcs_tmptime = 7,
    $debian_rcs_sulogin = false,
    $debian_rcs_delaylogin = true,
    $debian_rcs_utc = true,
    $debian_rcs_verbose = false,
    $debian_rcs_fsckfix = false,
    $debian_rcs_ramrun = false,
    $debian_rcs_ramlock = false,
    $debian_rcs_asyncmountnfs = false
) {
    file { "/etc/default/rcS":
        ensure  => file,
        owner   => root,
        group   => root,
        mode    => 444,
        content => template("debian/rcS")
    }
}
