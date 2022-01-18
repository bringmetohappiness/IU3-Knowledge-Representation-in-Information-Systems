% Решение для https://swish.swi-prolog.org/:

% CLAUSES

name("Misha").
name("Masha").
name("Grisha").
name("Artem").

place("Lobnoe Mesto").
place("Historical Museum").
place("Mausoleum").
place("Kazan Cathedral").

visit("Misha", "Lobnoe Mesto").
visit("Misha", "Lobnoe Mesto").
visit("Misha", "Lobnoe Mesto").

visit("Masha", "Lobnoe Mesto").
visit("Masha", "Lobnoe Mesto").

visit("Grisha", "Lobnoe Mesto").
visit("Grisha", "Lobnoe Mesto").
visit("Grisha", "Lobnoe Mesto").

visit("Artem", "Lobnoe Mesto").
visit("Artem", "Lobnoe Mesto").
visit("Artem", "Lobnoe Mesto").
visit("Artem", "Lobnoe Mesto").

appear("Misha", 1).
appear("Masha", 2).
appear("Grisha", 3).
appear("Artem", 4).

goTo("Misha", "Historical Museum").
goTo("Misha", "Lobnoe Mesto").
goTo("Misha", "Mausoleum").
goTo("Misha", "Kazan Cathedral").
goTo("Misha", "Historical Museum").

goTo("Masha", "Kazan Cathedral").
goTo("Masha", "Mausoleum").
goTo("Masha", "Mausoleum").

goTo("Grisha", "Kazan Cathedral").
goTo("Grisha", "Historical Museum").
goTo("Grisha", "Mausoleum").
goTo("Grisha", "Mausoleum").

goTo("Artem", "Lobnoe Mesto").
goTo("Artem", "Historical Museum").
goTo("Artem", "Mausoleum").
goTo("Artem", "Mausoleum").
goTo("Artem", "Kazan Cathedral").
goTo("Artem", "Mausoleum").

% 1 задание
% подсчёт количества вхождений имени в список
nameCount([], 0, Name).

nameCount([H|Tail], Count, Name) :-
	nameCount(Tail, TailCount, Name),
	H =@= Name, !,
	Count is TailCount + 1.

nameCount([H|Tail], Count, Name) :-
	nameCount(Tail, TailCount, Name),
	Count is TailCount.


% формирует "журнал посещений"
getListVisitors(Place, ListVisitors) :-
	findall(Name, visit(Name, Place), ListVisitors).


% выдаёт имя посетителя с 3 и более посещениями
getVisitor3(Place, VisitorName) :-
	name(VisitorName),
	getListVisitors(Place, ListVisitors),
	nameCount(ListVisitors, Count, VisitorName),
	Count @>=3.


% формирует список посетителей с 3 и более посещениями
getListVisitors3(Place, ListVisitors3) :-
	findall(VisitorName , getVisitor3(Place, VisitorName), ListVisitors3).


% 2 задание
% формирует структуру
getAppear(data(Name, Time)) :- appear(Name, Time).


% формирует "журнал прибытия"
getAppearList(AppearList) :- findall(Data, getAppear(Data), AppearList).


% подсчёт людей на площади в период времени
getPresentCount([], 0, Period).

getPresentCount([data(_, Time)|Tail], Num, Period) :-
	Time @=< Period, !,
	getPresentCount(Tail, Num1, Period),
	Num is Num1 + 1.

getPresentCount([_|T], Num, Period) :- getPresentCount(T, Num, Period).


% 3 задание
% пишет путь по имени
getWay(Name) :-
	write("Path: start"), goto(Name, Y), write(" -> ["), write(Y), write("] "), fail.


% GOAL

% 1 задание
getListVisitors3("LobnoeMesto", ListVisitors3). 


% 2 задание
getAppearList(Appearlist), getPresentCount(Appearlist, Number, 3). 


% 3 задание
getWay("Misha").
