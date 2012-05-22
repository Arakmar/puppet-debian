#
# This resource manages the /etc/inittab file
# It's possible to add new config entries
#

define inittab_conf (
                $id,
                $runlevels = '123456',
                $action = 'respawn',
                $process
        ) 
        {
                augeas {"inittab_$id":
                        context => "/files/etc/inittab",
                        changes => [
                                "set $id/runlevels $runlevels",
                                "set $id/action $action",
                                "set $id/process '$process'",
                                ],
                }
        }
}
