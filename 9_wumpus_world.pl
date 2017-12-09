% Wumpus World - 4 * 4 cave.
% Coordinate System - (C, R)

%%%%%%%%%%%%%%%%%%%%%%%%%
% Give your input here
% Facts - Predicates

visited(4,1).
visited(4,2).
visited(4,3).
visited(4,4).
stench(4,2).
breeze(4,3).
breeze(4,4).

%%%%%%%%%%%%%%%%%%%%%%%
% List unvisted rooms adjacent to visited ones
candidate(C, R) :-
	visited(C_old, R),
	C is C_old + 1,
	C =< 4,
	\+ visited(C, R).

candidate(C, R) :-
	visited(C_old, R),
	C is C_old - 1,
	C > 0,
	\+ visited(C, R).

candidate(C, R) :-
	visited(C, R_old),
	R is R_old + 1,
	R =< 4,
	\+ visited(C, R).

candidate(C, R) :-
	visited(C, R_old),
	R is R_old - 1,
	R > 0,
	\+ visited(C, R).

possible_pit(C, R) :-
	breeze(C1, R),
	C is C1 + 1,
	 C < 5.


possible_pit(C, R) :-
        breeze(C1, R),
        C is C1 - 1, C > 0.


possible_pit(C, R) :-
        breeze(C, R1),
        R is R1 + 1, R < 5.


possible_pit(C, R) :-
        breeze(C, R1),
        R is R1 - 1, R > 0.

possible_wumpus(C, R) :-
        stench(C1, R),
        C is C1 + 1,
         C < 5.


possible_wumpus(C, R) :-
        stench(C1, R),
        C is C1 - 1, C > 0.


possible_wumpus(C, R) :-
        stench(C, R1),
        R is R1 + 1, R < 5.


possible_wumpus(C, R) :-
        stench(C, R1),
        R is R1 - 1, R > 0.

no_wumpus_no_pit(C, R) :- 
	possible_wumpus(C,R), 
	possible_pit(C,R).

move(C, R) :- 
	candidate(C, R),
	\+ possible_wumpus(C, R),
	\+ possible_pit(C, R).

move(C, R) :-
        candidate(C, R),
	no_wumpus_no_pit(C,R).
	
