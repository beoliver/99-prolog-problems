# Problem 6 \*

## Find out whether a list is a palindrome.

A palindrome can be read forward or backward; e.g.

```
[x,a,m,a,x]
```

## Base Case

The empy list is a palindrome

```prolog
palindrome([]).
```

A singleton list is a palindrome

```prolog
palindrome([_]).
```

## General Case

1. If we have a list `P` that is a palindrome.
2. And `PX` is the result of appending `[X]` to `P`.
3. Then `[X|PX]` must be a palindrome.

```prolog
palindrome([X|PX]) :-
    append(P,[X],PX),
    palindrome(P).
```

## Program

```prolog
palindrome([]).
palindrome([_]).
palindrome([X|PX]) :-
    append(P,[X],PX),
    palindrome(P).
```

Note that this prgram is not optimal as each append has cost `O(n)`.
