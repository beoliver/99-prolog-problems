# Problem 12 \*

## Decode a run-length encoded list.

Given a run-length code list generated as specified in problem `P11`. Construct its uncompressed version.

```prolog
replicate(0,_,[]).
replicate(N,X,[X|Xs]) :-
    M is N-1,
    replicate(M,X,Xs).
```

```prolog
decode([],[]).
decode([[N, E]|Encoding], Decoded) :-
    replicate(N,E,Replicated),
    append(Replicated,Remaining,Decoded),
    decode(Encoding,Remaining),
    !.
decode([E|Encoding], [E|Decoded]) :-
    decode(Encoding, Decoded).
```

## Program

```prolog
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
```

Example

```prolog
?- encode_modified([a,a,b,c,c,a,d,e,e],X), decode(X,Y).
X = [[2, a], b, [2, c], a, d, [2, e]],
Y = [a, a, b, c, c, a, d, e, e].
```
