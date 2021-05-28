# Problem 02 \*

## Find the last but one element of a list.

Example:

```prolog
?- last_but_one(X,[a,b,c,d]).
X = c
```

# Solution

This builds on the solution to `P01`.

This predicate should return true if we _know_ the penultimate element.

```prolog
?- last_but_one(c,[a,b,c,d]).
true.
```

## Base Case

The base case is a list of length 2 containing the element that we are searching for in the penultimate position.

```prolog
last_but_one(X,[X,_]).
```

for example `last_but_one(a,[a,b])` should be true.

## General Case

For the general case we say that **if** last element of an input `Xs` is equal to `X`, i.e `last_but_one(X,Xs)` **then** the last element of an input `[_|Xs]` is equal to `X`.

In other words - the _head_ of a list plays no role in determining the truthfullness of the predicate.

```prolog
last_but_one(X,[_|Xs]) :- last_but_one(X,Xs).
```

## Program

```prolog
last_but_one(X,[X,_]).
last_but_one(X,[_|Xs]) :- last_but_one(X,Xs).
```
