# Problem 04 \*

## Find the number of elements of a list.

# Solution

No example is provided so we are free to choose how we want to implement this.

This predicate should return true if we _know_ the _length_ of the list.

The signature `length/2` is a built in.

```prolog
?- count([a,b,c,d],4).
true.
```

## Base Case

We know that the length of an empty list is 0.

```prolog
count([],0).
```

## General Case

Now we only need to consider what happens if the list is not empty.

```prolog
count_list([_|Xs],N) :-
    count_list(Xs,M),
    N is M + 1.
```

If we have a list `Xs` of length `M` then by adding an arbitrary element to the head of that list `[_|Xs]` we must have a list of length `M+1`.

## Program

```prolog
count([],0).
count([_|Xs],N) :- count(Xs,M), N is M + 1.
```
