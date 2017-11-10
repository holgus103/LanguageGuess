:- dynamic attribute/2.
:- dynamic language/1.
:- dynamic no/2.
:- dynamic yes/2.
consult('./language.pro').


queryUser(X, Y) :- 
	
    write(X),
    write(' : '),
	write(Y),
	write('? '),
	read(Reply),
	nl,
	((Reply == yes ; Reply = y) -> asserta(yes(X, Y)) ; asserta(no(X,Y)), fail).
	
attribute(X, Y) :-  (yes(X, Y) -> true ; (no(X, Y) -> fail ; queryUser(X, Y))). 

run :- language(X),
	   write(X),
	   (retract(yes(_, _)),fail ; retract(no(_, _)),fail).