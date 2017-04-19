node default {
	notify{"Hello World":}
#}

#node 'rhel.al.local' {
#	include myuser
	include mywebapp
}
