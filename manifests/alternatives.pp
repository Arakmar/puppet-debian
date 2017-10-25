define debian::alternatives
(
	$alternative_name = $name,
	$linkto = ''
)
{
	if $linkto != '' {
		exec { "update-alternatives --set ${name} ${linkto}":
			unless => "/bin/sh -c '[ -L /etc/alternatives/$name ] && [ /etc/alternatives/$name -ef $linkto ]'"
		}
	}
}
