span(_,[],[],[]).
span(X,[X|Xs],[X|Ys],Zs) :- span(X,Xs,Ys,Zs), !.
span(X,[Y|Ys],[],[Y|Ys]) :- X \= Y.

compress([],[]).
compress([X|Uncompressed], [X|Compressed]) :-
    span(X,[X|Uncompressed],_,Remaining),
    compress(Remaining,Compressed).