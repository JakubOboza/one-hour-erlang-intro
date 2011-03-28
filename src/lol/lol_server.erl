-module(lol_server).
-export([start/0, compute/1]).

start() -> register(fib, spawn(fun() -> loop() end) ).

loop() ->
   receive
     {Pid, Num} -> Pid ! lol:fib(Num)
   end,
   loop().


compute(Num) ->
    fib ! {self(), Num},
    receive
      Result -> Result
    end.

