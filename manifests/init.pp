# puppet module: rcS
#         class: rcS
#
# Copyright © 2010 martin f. krafft <madduck@madduck.net>
# Released under the terms of the Artistic Licence 2.0
#
class rcS {

    define rcS_setting($value) {
        $shellvalue = $value ? {
            true    => "yes",
            false   => "no",
            default => $value
        }
        augeas { "set_rcS_${name}":
            context => "/files/etc/default/rcS",
            changes => "set ${name} '${shellvalue}'",
            require => Package["libaugeas-ruby1.8"]
        }
    }

    rcS_setting { TMPTIME:
       value => $debian_rcS_tmptime ? {
          ""      => 7,
          default => $debian_rcS_tmptime
       }
    }

    rcS_setting { SULOGIN:
       value => $debian_rcS_sulogin ? {
          ""      => true,
          default => $debian_rcS_sulogin
       }
    }

    rcS_setting { DELAYLOGIN:
       value => $debian_rcS_delaylogin ? {
          ""      => true,
          default => $debian_rcS_delaylogin
       }
    }

    rcS_setting { UTC:
       value => $debian_rcS_utc ? {
          ""      => true,
          default => $debian_rcS_utc
       }
    }

    rcS_setting { VERBOSE:
       value => $debian_rcS_verbose ? {
          ""      => false,
          default => $debian_rcS_verbose
       }
    }

    rcS_setting { FSCKFIX:
       value => $debian_rcS_fsckfix ? {
          ""      => true,
          default => $debian_rcS_fsckfix
       }
    }

    rcS_setting { RAMRUN:
       value => $debian_rcS_ramrun ? {
          ""      => true,
          default => $debian_rcS_ramrun
       }
    }

    rcS_setting { RAMLOCK:
       value => $debian_rcS_ramlock ? {
          ""      => true,
          default => $debian_rcS_ramlock
       }
    }

    rcS_setting { ASYNCMOUNTNFS:
       value => $debian_rcS_asyncmountnfs ? {
          ""      => true,
          default => $debian_rcS_asyncmountnfs
       }
    }
}
