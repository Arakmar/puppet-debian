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
       value => $debian_rcs_tmptime ? {
          ""      => 7,
          default => $debian_rcs_tmptime
       }
    }

    rcS_setting { SULOGIN:
       value => $debian_rcs_sulogin ? {
          ""      => false,
          default => $debian_rcs_sulogin
       }
    }

    rcS_setting { DELAYLOGIN:
       value => $debian_rcs_delaylogin ? {
          ""      => true,
          default => $debian_rcs_delaylogin
       }
    }

    rcS_setting { UTC:
       value => $debian_rcs_utc ? {
          ""      => true,
          default => $debian_rcs_utc
       }
    }

    rcS_setting { VERBOSE:
       value => $debian_rcs_verbose ? {
          ""      => false,
          default => $debian_rcs_verbose
       }
    }

    rcS_setting { FSCKFIX:
       value => $debian_rcs_fsckfix ? {
          ""      => true,
          default => $debian_rcs_fsckfix
       }
    }

    rcS_setting { RAMRUN:
       value => $debian_rcs_ramrun ? {
          ""      => true,
          default => $debian_rcs_ramrun
       }
    }

    rcS_setting { RAMLOCK:
       value => $debian_rcs_ramlock ? {
          ""      => true,
          default => $debian_rcs_ramlock
       }
    }

    rcS_setting { ASYNCMOUNTNFS:
       value => $debian_rcs_asyncmountnfs ? {
          ""      => true,
          default => $debian_rcs_asyncmountnfs
       }
    }

    augeas { add-comment:
        context => "/files/etc/default/rcS",
        changes => [
          "ins '#comment' after /files/etc/default/rcS/#comment[last()]",
          "set /files/etc/default/rcS/#comment[last()] 'THE INDIVIDUAL SETTINGS ARE MANAGED BY PUPPET'"
        ],
        onlyif  => "match /files/etc/default/rcS/*[. = 'THE INDIVIDUAL SETTINGS ARE MANAGED BY PUPPET'] size < 1",
        require => Package["libaugeas-ruby1.8"]
    }
}
