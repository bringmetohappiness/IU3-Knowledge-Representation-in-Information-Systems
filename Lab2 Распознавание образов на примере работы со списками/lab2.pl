% Решение для https://swish.swi-prolog.org/:

% CLAUSES 

% формирует список разностей
absDev([A], [B], []).

absDev([H1 | T1], [H2, H3 | T2], [H | T]) :-
	H is H1 - H3,
	absDev(T1, [H3 | T2], T).


% 
devquat([], [], []).

devquat([H1 | T1], [H2 | T2], [H | T]) :-
	H is (H1 - H2) * (H1 - H2),
	abs_dev(T1, T2, T).


% 
sum([], 0).

sum([H | T], S) :-
	sum(T, S2),
	S is S2 + H.


% подсчёт длины списка
length_([], 0).

length_([_ | T], L) :-
	length_(T, L_T),
	L is L_T + 1. 


% выбирает первые N элементов списка в новый список
firstN([], _, []).

firstN(_, 0, []).

firstN([H | T], N, [H | T1]) :-
	N2 is N - 1,
	firstN(T, N2, T1).


% 
absDev2([], [], []).

absDev2(List1, List2, []) :-
	length_(List1, L1),
	length_(List2, L2),
	L1 < L2.

absDev2([H1 | T1], List2, [H3 | T3]) :-
	length_(List2, L2),
	first_N([H1 | T1], L2, NewList1),
	devquat(NewList1, List2, Dev),
	sum(Dev, H3),
	absDev2(T1, List2, T3).


% 
getMax([X], X).

getMax([H | Tail], H) :-
	getMax(Tail, TailMax),
	H < TailMax.

getMax([H | Tail], TailMax) :-
	getMax(Tail, TailMax),
	not(TailMax > H).


% 
numeEl([], A, B, -1).

numeEl([H1 | Tail], X, CountN, TailCount) :-
	not(H1 = X),
	Count is CountN + 1,
	numeEl(Tail, X, Count, TailCount).

numeEl([H1 | Tail], X, CountN, TailCount) :-
	H1 = X,
	TailCount is CountN + 1, !.


% GOAL

absDev([1,2,4,6,7,4,3,2,1], [1,2,4,6,7,4,3,2,1], A), nl,
absDev([1,2,4], [1,2,4],B), nl,
absDev2(A,B,Res), nl,
getMax(Res, X), nl,
numeEl(Res, X, 0, L), nl.
