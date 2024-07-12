-cargo_header_version 1.
-ifndef(CARGO_LOAD_APP).
-define(CARGO_LOAD_APP, x).
-endif.
-ifndef(CARGO_HRL).
-define(CARGO_HRL, 1).
-define(load_nif_from_crate(__CRATE, __INIT),
    (fun() ->
        % FIXME Find a more robust way of managing our dylib file location.
        % XXX code:priv_dir roots at location of executable script, which
        %     is not where our .so is, so using this manual hack to root in
        %     current directory, assuming we're in project root:
        % __APP=?CARGO_LOAD_APP,
        % __PRIV=code:priv_dir(__APP),
        __PRIV="priv",

        __PATH=filename:join([
            __PRIV,
            "crates",
            __CRATE,
            __CRATE
        ]),
        __RES = erlang:load_nif(__PATH, __INIT),
        io:format(">>> [erlang] load_nif: ~p~n", [__RES]),
        __RES
     end)()).
-endif.
