replicate(0,_,[]).
replicate(N,X,[X|Xs]) :-
    M is N-1,
    replicate(M,X,Xs).

decode([],[]).
decode([[N, E]|Encoding], Decoded) :-
    replicate(N,E,Replicated),
    append(Replicated,Remaining,Decoded),
    decode(Encoding,Remaining),
    !.
decode([E|Encoding], [E|Decoded]) :-
    decode(Encoding, Decoded).