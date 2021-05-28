# Problem 7 \*\*

## Flatten a nested list structure.

Transform a list, possibly holding lists as elements into a "flat" list by replacing each list with its elements (recursively).

Example:

```prolog
?- my_flatten([a, [b, [c, d], e]], X).
X = [a, b, c, d, e]
```

Hint: Use the predefined predicates `is_list/1` and `append/3`

Note that we are going to call our predicate `flattened` as it makes more sense to me.

## Base Case

```prolog
flattened([],[]).
```

## General Case.

```prolog
flattened([H|T],Flattened) :-
    (is_list(H) ->
        flattened(H,FlattenedHead),
        flattened(T,FlattenedTail),
        append(FlattenedHead,FlattenedTail,Flattened)
        ; %% or
        flattened(T,FlattenedTail),
        append([H],FlattenedTail,Flattened)
    ).
```

## Program

```prolog
flattened([],[]).
flattened([H|T],Flattened) :-
    (is_list(H) ->
        flattened(H,FlattenedHead),
        flattened(T,FlattenedTail),
        append(FlattenedHead,FlattenedTail,Flattened)
        ; %% or
        flattened(T,FlattenedTail),
        append([H],FlattenedTail,Flattened)
    ).
```

Note that this prgram is not optimal as each append has cost `O(n)`.
