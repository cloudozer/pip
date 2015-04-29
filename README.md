
# pip: a connectivity tester for LING

To build the pip image run 'make'. You need to have 'railing' tool on your PATH.

Or, use pre-built 'pip.img'.

To configure the image edit the 'domain\_config' file. Look for '-ipaddr', '-netmask', '-gateway'.

To boot the image run 'sudo xl create -c domain\_config'.

pip adds two new commands to the Erlang shell.

ip() -- returns the IP address of the current pip instance.

ping() -- pings google.com to test public Internet connectivity.

ping(Addr) -- tests TCP connectivity (port 80) with Addr. There must be a TCP server running on
the other side. Every pip instance has a small TCP server to support pings.

ping(Addr, Port) -- uses an explicitely specified TCP port when pinging.

