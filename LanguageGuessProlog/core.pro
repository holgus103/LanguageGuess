:- dynamic attribute/2.
:- dynamic language/1.
consult('language.pro').

queryUser(X, Y) :- 
    write(X),
    write(' : '),
	write(Y),
	write('? '),
	read(Reply),
	nl,
	(Reply == yes ; Reply = y).
	
attribute(X, Y) :- queryUser(X, Y).