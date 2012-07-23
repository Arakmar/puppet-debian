class debian::login_def {

    $umask = $debian_umask ? {
        ""      => 022,
        default => $debian_umask
    }

    file { "/etc/login.defs":
        ensure  => file,
        owner   => root,
        group   => root,
        mode    => 644,
        content => template("debian/login.defs.erb")
    }
}
