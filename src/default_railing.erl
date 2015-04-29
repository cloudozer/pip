-module(default_railing).
-compile(export_all).

railing() ->
	[{name,		"pip"},
	 {kernel,	"pip.img"},
	 {extra,	"-ipaddr 10.1.1.10"},
	 {extra,	"-netmask 10.1.1.255"},
	 {extra,	"-gateway 10.1.1.1"},
	 {extra,	"-eval 'sink:start()'"},
	 {home,		"/pip"},
	 {pz,		"/pip/ebin"},
	 {vif,		"bridge=xenbr0"}].

