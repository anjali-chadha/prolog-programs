% Predicates (Given)
parent(bart,homer).
parent(bart,marge).
parent(lisa,homer).
parent(lisa,marge).
parent(maggie,homer).
parent(maggie,marge).
parent(homer,abraham).
parent(herb,abraham).
parent(tod,ned).
parent(rod,ned).
parent(marge,jackie).
parent(patty,jackie).
parent(selma,jackie).
female(maggie).
female(lisa).
female(marge).
female(patty).
female(selma).
female(jackie).
male(bart).
male(homer).
male(herb).
male(burns).
male(smithers).
male(tod).
male(rod).
male(ned).
male(abraham).

% Rules
equal(X,Y) :-
   X == Y.

% The brother of X is Y.
brother(X, Y) :- 
	male(Y), 
	parent(X, P), 
	parent(Y, P),
	X \= Y.

% The sister of X is Y
sister(X, Y) :-
	female(Y), 
	parent(X,P), 
	parent(Y, P),
	X \= Y.
	
% The aunt of X is Y
aunt(X, Y) :- 
	sister(Z, Y), 
	parent(X, Z).

% The uncle of X is Y.
uncle(X, Y) :- 
	brother(Z, Y), 
	parent(X, Z).

% The grandfather of X is Y.
grandfather(X, Y) :- 
	male(Y), 
	parent(X, P), 
	parent(P, Y).

% The granddaughter of X is Y.
granddaughter(X, Y) :- 
	female(Y), 
	parent(Y, P), 
	parent(P, X).
	
% The ancestor of X is Y.
ancestor(X, Y) :-
	parent(X, Y).

ancestor(X, Y) :- 
	parent(X, P),
	ancestor(P, Y).

% The descendant of X is Y.
descendant(X, Y) :- 
	parent(Y, P), 
	ancestor(P, X).

% X and Y are not related to each other.
unrelated(X, Y) :- 
	\+ ancestor(X,Y), 
	\+ descendant(X,Y),
	\+ aunt(X, Y),
	\+ aunt(Y, X),
	\+ uncle(X,Y),
	\+ uncle(Y, X).
