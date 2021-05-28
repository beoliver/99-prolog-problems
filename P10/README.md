# Problem 10 \*

## Run-length encoding of a list

Use the result of problem P09 to implement the so-called run-length encoding data compression method.
Consecutive duplicates of elements are encoded as terms `[N,E]` where `N` is the number of duplicates of the element `E`.

Example:

```prolog
?- encode([a,a,a,a,b,c,c,a,a,d,e,e,e,e],X).
X = [[4,a],[1,b],[2,c],[2,a],[1,d][4,e]]
```

We will use the predicate `pack/2` defined in the previous problem `P09`.
To make life easier we will define a "helper" function that takes the packed data and produces an encoding.

```prolog
encode_helper([],[]).
encode_helper([P|Packed],[[N,E]|Encoding]) :-
    [E|_] = P,
    length(P, N),
    encode_helper(Packed, Encoding).
```

Now we can encode in the following way

```prolog
encode([],[]).
encode(Data,Encoding) :-
    pack(Data, Packed),
    encode_helper(Packed, Encoding).
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

encode_helper([],[]).
encode_helper([P|Packed],[[N,E]|Encoding]) :-
    [E|_] = P,
    length(P, N),
    encode_helper(Packed, Encoding).

encode([],[]).
encode(Data,Encoding) :-
    pack(Data, Packed),
    encode_helper(Packed, Encoding).
```
