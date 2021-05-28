# Problem 11 \*

## Modified run-length encoding.

Modify the result of problem `P10` in such a way that if an element has no duplicates it is simply copied into the result list. Only elements with duplicates are transferred as `[N,E]` terms.

Example:

```prolog
? - encode_modified([a,a,a,a,b,c,c,a,a,d,e,e,e,e],X).
X = [[4,a],b,[2,c],[2,a],d,[4,e]]
```

The solution is going to look **very** similar to that of `P09`.
The only difference will be in how our _helper_ works.

```prolog
encode_modified_helper([],[]).
encode_modified_helper([[E]|Packed],[E|Encoding]) :-
    encode_modified_helper(Packed, Encoding),!.
    %% we use a cut so we dont backtrack.
encode_modified_helper([P|Packed],[[N,E]|Encoding]) :-
    [E|_] = P,
    length(P, N),
    encode_modified_helper(Packed, Encoding).
```

Now we can encode in the following way

```prolog
encode_modified([],[]).
encode_modified(Data,Encoding) :-
    pack(Data, Packed),
    encode_modified_helper(Packed, Encoding).
```

## Program

```prolog
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
```
