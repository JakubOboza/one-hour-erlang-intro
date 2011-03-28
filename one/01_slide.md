!SLIDE
# Erlang Workshops #
    $> erl

!SLIDE bullets incremental
# What is Erlang ? #

* pure functional,
* single variable assigment,
* heavy pattern matching language

!SLIDE
# pure functional #
    fib(1) -> 1;
    fib(2) -> 1;
    fib(N) -> fib(N-1) + fib(N-2).

!SLIDE
# single variable assigment #
    X = 1.
    >> 1
    X.
    >> 1
    X = 1.
    >> 1
    ** exception error: no match \
    of right hand side value 2

!SLIDE
# heavy pattern matching language
    {o, {t, {t, X}}} = {o, {t, {t, 10}}}.
    X.
    >> 10

!SLIDE code
# module #
    -module(lol).
    -export([fib/1]).
    fib(0) -> 1;
    fib(1) -> 1;
    fib(N) -> fib(N-1) + fib(N-2);
    fib(_) -> "forever alone :(".

!SLIDE code smaller
# spawn! #
    -module(lol_server).
    -export([start/0, compute/1]).
    start() -> register(fib, spawn(fun() -> loop() end) ).
    loop() ->
      receive
      {Pid, Num} -> Pid ! lol:fib(Num)
      end,
      loop().

!SLIDE
# Behaviour. Just give me callback module #
    -behaviour(gen_server).

!SLIDE
# rebar #
    rebar create-app appid=my_pro_app_name

    rebar compile
    rebar compile eunit

!SLIDE
# eunit Tdd #
    -ifdef(TEST).
    -include_lib("eunit/include/eunit.hrl").
    -endif.

!SLIDE
# eunit tDd #
    -ifdef(TEST).
    for_test() ->
        [1,2,3,4,5] = for(1,5, fun(X) -> X end).
    -endif.

!SLIDE
# eunit tdD #
    %% for
    for(Max, Max, Foo) -> [Foo(Max)];
    for(I, Max, Foo) ->
       [Foo(I) | for(I+1, Max, Foo)].

!SLIDE bullets incremental small
# Inspiration #

* mochiweb - webservice framework ( check also webmachine )
* yaws - web server
* nitrogen - web framework
* ejabberd is a Jabber/XMPP instant messaging server
