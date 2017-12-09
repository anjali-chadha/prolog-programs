% Load the library
use_module(library(lists)).

% Base case of the recursion
remdups([], []).
%remdups([], _).

% Case: When the Head element is not present in the Tail.
remdups([Head | Tail], [Head| Result]):- 
	\+ lists:member(Head, Tail), 
	remdups(Tail, Result). 
	 
% Case: When the Head element is present in Tail of the list.
remdups([Head | Tail], List) :- 
	lists:member(Head, Tail), 
	remdups(Tail, List).