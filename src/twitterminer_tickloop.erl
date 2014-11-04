-module(twitterminer_tickloop).


-export([start/0]).

%% ===================================================================
%% Module Functions
%% ===================================================================

start() ->
	io:format("Starting tickloop"),
	Pid = spawn_link(fun() -> tickLoop() end),
	io:format("continuing tickloop"),
	{ok, Pid}.

tickLoop() ->
	timer:sleep(30000),
	gen_server:cast(twitterminer_riak, tick),
	timer:sleep(30000),
	gen_server:cast(twitterminer_updatelist, tick),
	tickLoop().
