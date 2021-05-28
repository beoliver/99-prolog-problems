rev([],[]).
rev([X|XS],SXX) :-
    rev(XS,SX),
    append(SX,[X],SXX).