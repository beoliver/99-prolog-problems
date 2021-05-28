# Problem 5 \*

## Reverse a list.

## Base Case

```prolog
rev([],[]).
```

## General Case

1. If we have a list `XS` such that `SX` is the reverse.
2. And `SXX` is the result of appending `[X]` to `SX`.
3. Then `[X|XS]` must be the reverse of `SXX`.

```prolog
rev([X|XS],SXX) :-
    rev(XS,SX),
    append(SX,[X],SXX).
```

## Program

```prolog
rev([],[]).
rev([X|XS],SXX) :-
    rev(XS,SX),
    append(SX,[X],SXX).
```

Note that this prgram is not optimal as each append has cost `O(n)`.
