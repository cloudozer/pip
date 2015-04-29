-module(user_default).
-export([ip/0]).
-export([ping/0,ping/1]).

ip() ->
	{ok,Ifaddrs} = inet:getifaddrs(),
	case [ X || {If,Props} =X <- Ifaddrs, If =/= "lo", lists:keymember(addr, 1, Props) ] of
		[] -> unassigned;
		[{_,Props}|_] -> print_ip(proplists:get_value(addr, Props)) end.

print_ip({A,B,C,D}) -> lf(io_lib:format("~w.~w.~w.~w", [A,B,C,D])).

ping() -> ping("google.com").
ping(IpAddr) -> ping(IpAddr, 80).
ping(IpAddr, Port) ->
	case gen_tcp:connect(IpAddr, Port, []) of
		{ok,Sock} -> gen_tcp:close(Sock), pong;
		{error,Error} -> Error end.

lf(X) -> lists:flatten(X).

