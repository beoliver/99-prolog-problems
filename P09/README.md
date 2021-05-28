# Problem 9 \*\*

## Pack consecutive duplicates of list elements into sublists.

If a list contains repeated elements they should be placed in separate sublists.

Example:

```prolog
?- pack([a,a,a,a,b,c,c,a,a,d,e,e,e,e],X).
X = [[a,a,a,a],[b],[c,c],[a,a],[d],[e,e,e,e]]
```

## Base Case

If a list is empty then we should return an empty list.

```prolog
pack([],[]).
```

We will use the predicate `span/4` defined in the previous problem `P08`.

## General Case

```prolog
pack([X|Xs],[Partition|Partitions]) :-
    span(X,[X|Xs],Partition,Remaining),
    pack(Remaining,Partitions).
```

## Program

```prolog
pack([],[]).
pack([X|Xs],[Partition|Partitions]) :-
    span(X,[X|Xs],Partition,Remaining),
    pack(Remaining,Partitions).
```
