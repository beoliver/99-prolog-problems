span(_,[],[],[]).
span(X,[X|Xs],[X|Ys],Zs) :- span(X,Xs,Ys,Zs), !.
span(X,[Y|Ys],[],[Y|Ys]) :- X \= Y.

pack([],[]).
pack([X|Xs],[Partition|Partitions]) :-
    span(X,[X|Xs],Partition,Remaining),
    pack(Remaining,Partitions).