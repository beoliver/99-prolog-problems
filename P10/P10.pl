span(_,[],[],[]).
span(X,[X|Xs],[X|Ys],Zs) :- span(X,Xs,Ys,Zs), !.
span(X,[Y|Ys],[],[Y|Ys]) :- X \= Y.

pack([],[]).
pack([X|Xs],[Partition|Partitions]) :-
    span(X,[X|Xs],Partition,Remaining),
    pack(Remaining,Partitions).

encode_helper([],[]).
encode_helper([P|Packed],[[N,E]|Encoding]) :-
    [E|_] = P,
    length(P, N),
    encode_helper(Packed, Encoding).

encode([],[]).
encode(Data,Encoding) :-
    pack(Data, Packed),
    encode_helper(Packed, Encoding).