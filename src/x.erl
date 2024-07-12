-module(x).

-export([main/1]).

main(Args) ->
    io:format(">>> [erlang] args: ~p~n", [Args]),
    io:format(">>> [erlang] received from hello: ~p~n", [x_nif:hello()]),
    io:format(">>> [erlang] received from add(2, 3): ~p~n", [x_nif:add(2, 3)]),
    erlang:halt(0).
