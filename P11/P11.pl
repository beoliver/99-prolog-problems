span(_,[],[],[]).
span(X,[X|Xs],[X|Ys],Zs) :- span(X,Xs,Ys,Zs), !.
span(X,[Y|Ys],[],[Y|Ys]) :- X \= Y.

pack([],[]).
pack([X|Xs],[Partition|Partitions]) :-
    span(X,[X|Xs],Partition,Remaining),
    pack(Remaining,Partitions).

encode_modified_helper([],[]).
encode_modified_helper([[E]|Packed],[E|Encoding]) :-
    encode_modified_helper(Packed, Encoding),!.
encode_modified_helper([P|Packed],[[N,E]|Encoding]) :-
    [E|_] = P,
    length(P, N),
    encode_modified_helper(Packed, Encoding).

encode_modified([],[]).
encode_modified(Data,Encoding) :-
    pack(Data, Packed),
    encode_modified_helper(Packed, Encoding).