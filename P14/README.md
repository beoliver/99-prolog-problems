# Problem 14 \*

## Duplicate the elements of a list.

Example:

```prolog
?- dupli([a,b,c,c,d],X).
X = [a,a,b,b,c,c,c,c,d,d]
```

## Program

```prolog
dupli([],[]).
dupli([X|Xs],[X,X|Ys]) :- dupli(Xs,Ys).
```
