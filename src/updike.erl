-module(updike).

-behaviour(application).

-export(
  [ start/0
  , stop/0
  ]).
-export(
  [ start/2
  , stop/1
  ]).

%% PUBLIC API %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-spec start() -> {ok, _} | {error, term()}.
start() ->
  X = application:ensure_all_started(updike),
  lager:info("Applications started: ~p", [X]),
  X.

-spec stop() -> ok | {error, term()}.
stop() -> application:stop(updike).

%% BEHAVIOUR CALLBACKS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-spec start(application:start_type(), any()) -> {ok, pid()} | {error, term()}.
start(_StartType, _Args) -> ud_sup:start_link().

-spec stop(atom()) -> ok.
stop(_State) -> ok.

