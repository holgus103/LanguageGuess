
/* data */
language(chinese) :- logograms, !.
language(arabic) :- leftToRight, abjad, !.
language(hebrew) :- leftToRight, !.
language(russian) :- cyrulic, !.
language(french) :- accents, !.
language(german).

/* attributes */
logograms :- attribute(logograms, 'Does the language use logograms?').
leftToRight :- attribute(leftToRight, 'Is it written from left to right?').
abjad :- attribute(abjad, 'Does it use the abjad?').
cyrulic :- attribute(cyrulic, 'Does it use the cyrulic alphabet?').
accents :- attribute(accents, 'Does it feature accents?').


