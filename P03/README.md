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

We know that "The first element in the list is number 1".
Let's encode this as the base case.

```prolog
element_at(X,[X|_],1).
```

## General Case

Now we only need to consider what happens if `X` is **not** the first element of the list.

```prolog
element_at(X,[Y|Ys],K) :-
    element_at(X,Ys,J),
    K is J + 1.
```

If we have a list `Ys` such that `X` is the `Jth` element then `X` must be the `Kth` element of `[Y|Ys]` where `J = K - 1`.

Note that `J = K - 1` and `K = J + 1` should be equiavalent.

## Program

```prolog
element_at(X,[X|_],1).
element_at(X,[Y|Ys],K) :-
    element_at(X,Ys,J),
    J is K - 1.
```
