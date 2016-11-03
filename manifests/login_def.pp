class debian::login_def(
    $umask = '022',
) {

	file { "/etc/login.defs":
	    ensure  => file,
	    owner   => root,
	    group   => root,
	    mode    => '644',
	    content => template("debian/login.defs.erb")
	}
}
