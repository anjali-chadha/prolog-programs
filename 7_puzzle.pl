use_module(library(lists)).

puzzle(S,E,N,D,M,O,R,Y) :-
	Send = D + 10*N + 100*E + 1000*S,
	More = E + R*10 + O*100 + M * 1000,
	Money = Y + E*10 + N * 100 + O * 1000 + M * 10000,
	lists:select(S, [0,1,2,3,4,5,6,7,8,9], WS),
	lists:select(E, WS, WSE),
	lists:select(N, WSE, WSEN),
	lists:select(D, WSEN, WSEND),
	lists:select(M, WSEND, WSENDM),
	lists:select(O, WSENDM, WSENDMO),
	lists:select(R, WSENDMO, WSENDMOR),
	lists:select(Y, WSENDMOR, _),
	Money =:= Send + More,
	S \= 0, M \= 0.
