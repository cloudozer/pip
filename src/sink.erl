-module(sink).
-export([start/0]).

%% TCP ping server

start() -> spawn(fun() -> {ok,L} = gen_tcp:listen(80, []), loop(L) end).

loop(L) ->
	{ok,S} = gen_tcp:accept(L),
	{ok,{{A,B,C,D},_}} = inet:peername(S),
	io:format("pinged from ~w.~w.~w.~w\n", [A,B,C,D]),
	gen_tcp:close(S),
	loop(L).

