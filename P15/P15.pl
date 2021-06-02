repeat(_,0,[]) :- !.
repeat(X,1,[X]) :- !.
repeat(X,K,[X|Repeated]) :-
    J is K-1,
    repeat(X,J,Repeated).

dupli([X],N,Repeated) :-
    repeat(X,N,Repeated),
    !.
dupli([Elem|L],N,Result) :-
    dupli(L,N,LN),
    repeat(Elem,N,ListOfElem),
    append(ListOfElem,LN,Result).