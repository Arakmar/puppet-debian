# puppet module: debian
#         class: debian::rcs
#
# Copyright © 2010 martin f. krafft <madduck@madduck.net>
# Released under the terms of the Artistic Licence 2.0
#
class debian::rcs {

    $debian_rcs_tmptime = $debian_rcs_tmptime ? {
        ""      => 7,
        default => $debian_rcs_tmptime
    }
    $debian_rcs_sulogin = $debian_rcs_sulogin ? {
        ""      => false,
        default => $debian_rcs_sulogin
    }
    $debian_rcs_delaylogin = $debian_rcs_delaylogin ? {
        ""      => true,
        default => $debian_rcs_delaylogin
    }
    $debian_rcs_utc = $debian_rcs_utc ? {
        ""      => true,
        default => $debian_rcs_utc
    }
    $debian_rcs_verbose = $debian_rcs_verbose ? {
        ""      => false,
        default => $debian_rcs_verbose
    }
    $debian_rcs_fsckfix = $debian_rcs_fsckfix ? {
        ""      => false,
        default => $debian_rcs_fsckfix
    }
    $debian_rcs_ramrun = $debian_rcs_ramrun ? {
        ""      => false,
        default => $debian_rcs_ramrun
    }
    $debian_rcs_ramlock = $debian_rcs_ramlock ? {
        ""      => false,
        default => $debian_rcs_ramlock
    }
    $debian_rcs_asyncmountnfs = $debian_rcs_asyncmountnfs ? {
        ""      => false,
        default => $debian_rcs_asyncmountnfs
    }

    file { "/etc/default/rcS":
        ensure  => file,
        owner   => root,
        group   => root,
        mode    => 444,
        content => template("debian/rcS")
    }
}
