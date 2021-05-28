# Problem 01 \*

## Find the last element of a list.

Example:

```prolog
?- my_last(X,[a,b,c,d]).
X = d
```

# Solution

This predicate should return true if we _know_ the last element.

```prolog
?- my_last(d,[a,b,c,d]).
true.
```

## Base Case

The base case is a singleton list containing the element that we are searching for.

```prolog
my_last(X,[X]).
```

for example `my_last(a,[a])` should be true.

## General Case

For the general case we say that **if** last element of an input `Xs` is equal to `X`, i.e `my_last(X,Xs)` **then** the last element of an input `[_|Xs]` is equal to `X`.

In other words - the _head_ of a list plays no role in determining the truthfullness of the predicate.

```prolog
my_last(X,[_|Xs]) :- my_last(X,Xs).
```

## Program

```prolog
my_last(X,[X]).
my_last(X,[_|Xs]) :- my_last(X,Xs).
```
