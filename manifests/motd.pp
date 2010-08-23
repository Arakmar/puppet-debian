# puppet module: debian
#         class: debian::motd
#
# Copyright © 2010 martin f. krafft <madduck@madduck.net>
# Released under the terms of the Artistic Licence 2.0
#
class debian::motd::files {

    file { "/etc/motd.tail":
        ensure  => file,
        owner   => root,
        group   => root,
        mode    => 444,
        content => template("debian/motd.tail"),
    }

    file { "/etc/motd":
        ensure  => "/var/run/motd",
                require => File["/etc/motd.tail"],
    }
}

class debian::motd::update {

    # from /etc/init.d/bootmisc.sh
    # see http://bugs.debian.org/437176
    exec { "/var/run/motd":
        cwd         => "/var/run",
        path        => "/usr/bin:/bin",
        command     => "sh -c '{ uname -snrvm; cat /etc/motd.tail; } > /var/run/motd'",
        refreshonly => true,
        subscribe   => Class["debian::motd::files"]
    }
}

class debian::motd {

    $greeting_before_fqdn = $debian_motd_greeting_before_fqdn
    $lead = $debian_motd_lead
    $headeritems = $debian_motd_headeritems ? {
        ""      => [],
        default => $debian_motd_headeritems
    }
    $newsitems = $debian_motd_newsitems ? {
        ""      => [],
        default => $debian_motd_newsitems
    }
    $services = $debian_motd_services ? {
        ""      => [],
        default => $debian_motd_services
    }

    include debian::motd::files, debian::motd::update
}

# vim:ft=puppet
