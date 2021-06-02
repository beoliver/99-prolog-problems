# Problem 03 \*

## Find the K'th element of a list.

The first element in the list is number 1.

Example:

```prolog
?- element_at(X,[a,b,c,d,e],3).
X = c
```

# Solution

This predicate should return true if we _know_ the _kth_ element.

```prolog
?- element_at(c,[a,b,c,d,e],3).
true.
```

## Base Case

We know that "The first element in the list is number 1" - i.e lists are not 0 indexed.
Let's encode this as the base case.

```prolog
element_at(X,[X|_],1).
```

## General Case

Now we only need to consider what happens if `X` is **not** the first element of the list.

**If** `J` is `K-1` and the value at the `Jth` index of `Xs` is `X`, **then** the value at the `Kth` index of `[_|Xs]` is `X`.

```prolog
element_at(X,[_|Xs],K) :- J is K-1, element_at(X,Xs,J).
```

## Program

```prolog
element_at(X,[X|_],1)  :- !.
element_at(X,[_|Xs],K) :- J is K-1, element_at(X,Xs,J).
```
