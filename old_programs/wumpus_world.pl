% Wumpus World - 4 * 4 cave.
% Coordinate System - (C, R)

% Facts - Predicates
visited(1, 1).
visited(2, 1).
visited(1, 2).

stench(2, 1).
breeze(1, 2).

% List unvisted rooms adjacent to visited ones
candidate(C, R) :-
	C_new is C + 1,
	C_new =< 4,
	\+ visited(C_new, R).

candidate(C, R) :-
	C_new is C - 1,
	C_new > 0,
	\+ visited(C_new, R).

candidate(C, R) :-
	R_new is R + 1,
	R_new =< 4,
	\+ visited(C, R_new).

candidate(C, R) :-
	R_new is R - 1,
	R_new > 0,
	\+ visited(C, R_new).


