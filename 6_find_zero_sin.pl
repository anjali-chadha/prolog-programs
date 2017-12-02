% Compute zeros of sin(x) 

within_range(Y):-
	sin(Y) > -0.0001,
	sin(Y) < 0.0001.

sin_zero(X, Y) :-
	within_range(X),
	format(atom(Y),'~5f', [X]).

sin_zero(X, Y) :-
	\+ within_range(X),
	P is rdiv(rational(sin(X)), rational(cos(X))),
	X_new is X - P,
	sin_zero(X_new, Y).	
