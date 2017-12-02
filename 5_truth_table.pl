% Recursion Base Case
bitvec(0, []).

bitvec(K, [0 | Out]) :-
	K > 0,
	K_new is K - 1,
	bitvec(K_new, Out).

bitvec(K, [1 | Out]) :-
        K > 0,
        K_new is K - 1,
        bitvec(K_new, Out).


code(X, Y, Out) :-
	bitvec(X, Out),
	one_count(Out, Count),
	Count =:= Y.
	
one_count([], 0).


one_count([H | T], K_new) :-
	H =:= 1,
	one_count(T, K),
	K_new is K + 1.

one_count([H | T], K) :-
        H =\= 1,
        one_count(T, K).

