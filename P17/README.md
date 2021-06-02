# Problem 17 \*

## Split a list into two parts; the length of the first part is given.

Do not use any predefined predicates.

Example:

```prolog
?- split([a,b,c,d,e,f,g,h,i,k],3,L1,L2).
L1 = [a,b,c]
L2 = [d,e,f,g,h,i,k]
```

This is going to look a **lot** like our previously defined `span/4` predicate defined in `P08`.

```prolog
span(_,[],[],[]).
span(X,[X|Xs],[X|Ys],Zs) :- span(X,Xs,Ys,Zs), !.
span(X,[Y|Ys],[],[Y|Ys]) :- X \= Y.
```

```prolog
split([],_,[],[]).
```
