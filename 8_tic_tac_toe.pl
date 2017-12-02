% Tic Tac Toe

% Since we are playing this game as 'x' player.

% Facts: Initial position of the board
p(x, 1, 1).
p(x, 2, 3).
p(o, 3, 1).
p(o, 3, 3).

player(x).
player(o).

row(1).
row(2).
row(3).

column(1).
column(2).
column(3).

opponent(x, o).
opponent(o, x).

comp(A, B) := B is 4 - A. 
% ------------ When two similar moves in row, column, or diagnol----
twoInRow(P, R) :-
	row(R),
	player(P),
	p(P, R, A),
	column(A),
	column(B),
	p(P, R, B),
	A =\= B, !.

twoInCol(P,C) :-
	player(P),
	column(C),
	p(P, A, C),
	row(A),
	p(P, B, C),
	row(B),
	A =\= B, !.

twoInMainDiag(P) :-
	player(P),
	p(P, A, A),
	p(P, B, B),
	row(A), column(A),
	row(B), column(B),
	A =\= B, !.

twoInOffDiag(P) :-
	player(P),
	p(P, A, comp(A, B)),
	row(A),
	p(P, B, comp(B, A)),
	row(B),
	A =\= B, !.

% ------------canWin Rules ---------------	
canWin(P, R, C) :- 
	row(R),
	column(C),
	twoInRow(P, R), 
	\+ p(x, R, C),
	\+ p(o, R, C).

canWin(P, R, C) :-
        row(R),
        column(C),
	twoInCol(P,C),
        \+ p(x, R, C),
        \+ p(o, R, C).

canWin(P, R, C) :-
        row(R),
        column(C),
	twoInMainDiag(P),
	R = C,
        \+ p(x, R, C),
        \+ p(o, R, C).

canWin(P, R, C) :-
        row(R),
        column(C),
	twoInOffDiag(P),
	comp(R, C),
        \+ p(x, R, C),
        \+ p(o, R, C).


% -------------forcedMove Rules -----------
forcedMove(P, R, C) :-
        row(R),
        column(C),
	player(P),
	player(Q),
	opponent(P,Q),
	\+ canWin(P, R, C),
	canWin(Q, R, C).

% ----------- Rule invoked from the Prolog interpretor --------
ttt_move(P, R, C) :-
        row(R),
        column(C),
	player(P),
	canWin(P, R, C).

ttt_move(P, R, C) :-
	row(R),
        column(C),
	player(P),
	forcedMove(P, R, C).

