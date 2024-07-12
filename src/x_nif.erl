-module(x_nif).

-include("cargo.hrl").

-export([hello/0, add/2]).

-on_load(init/0).

init() ->
    ?load_nif_from_crate(x_nif, 0).

hello() ->
    erlang:nif_error(nif_not_loaded).

add(_A, _B) ->
    erlang:nif_error(nif_not_loaded).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

add_test() ->
    ?assertEqual(5, add(2, 3)).

-endif.
