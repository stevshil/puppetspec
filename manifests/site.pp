node default {
	notify{"Hello World":}
}

node /^web/ {
	include mywebapp
}

node 'rhel.al.local' {
	include myuser
	include mywebapp
}
