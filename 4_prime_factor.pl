% Is N fully divisible by X?
divisible(N, X):- 0 is mod(N, X).

% Base Case - If the input number is less than 2, return empty list.
% factor(1, _).
% factor(1, []).
factor(Num, []) :- Num < 2, !.		

% If the number is divisible by 2.
factor(Num, [2 | Out]) :-
	Num >= 2,
	divisible(Num, 2),
	Quotient is div(Num, 2),
	factor(Quotient, Out), !.

% If the number is not divisible by 2. 
% Start iterating from 3 till the sqrt(N). Increment by 2. 
factor(Num, Out) :-
	Num > 2,
	\+ divisible(Num, 2),
	factors(Num, 3, Out), !.
	
% When the Divisor is divisible with the number.
factors(Num, Divisor, [Divisor| Out]) :-
	Num > 2,
	Num >= Divisor * Divisor,
	divisible(Num, Divisor),
	Quotient is div(Num, Divisor),
	factors(Quotient, Divisor, Out), !.
	
% When the divisor is not divisible with the number. 
% Increment the divisor by 2.
factors(Num, Divisor, Out) :-
	Num > 2,
	Num >= Divisor * Divisor,
	\+ divisible(Num, Divisor),
	New_Divisor is Divisor + 2,
	factors(Num, New_Divisor, Out), !.

% When the divisor exceeds the sqrt(Num), put that number in the output list.
factors(Num, Divisor, [Num]):-
         Num > 2,
         Num < Divisor* Divisor,
         !.
