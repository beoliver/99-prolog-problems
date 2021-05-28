# Problem 8 \*\*

## Eliminate consecutive duplicates of list elements.

If a list contains repeated elements they should be replaced with a single copy of the element.
The order of the elements should not be changed.

Example:

```prolog
?- compress([a,a,a,a,b,c,c,a,a,d,e,e,e,e],X).
X = [a,b,c,a,d,e]
```

This reminds me of `takeWhile`, `dropWhile` and `span` in Haskell.

```prolog
span(_,[],[],[]).
span(X,[X|Xs],[X|Ys],Zs) :- span(X,Xs,Ys,Zs), !.
span(X,[Y|Ys],[],[Y|Ys]) :- X \= Y.
```

Notice that we use the cut `!` operator. This means that we only get a single result.

```prolog
?- span(a,[a,a,a,b,a],Xs,Ys).
Xs = [a, a, a],
Ys = [b, a].
```

## Base Case

```prolog
compress([],[]).
```

## General Case.

```prolog
compress([X|Uncompressed], [X|Compressed]) :-
    span(X,[X|Uncompressed],_,Remaining),
    compress(Remaining,Compressed).
```

## Program

```prolog
compress([],[]).
compress([X|Uncompressed], [X|Compressed]) :-
    span(X,[X|Uncompressed],_,Remaining),
    compress(Remaining,Compressed).
```
