# Problem 16 \*\*

## Drop every N'th element from a list.

Example:

```prolog
?- drop([a,b,c,d,e,f,g,h,i,k],3,X).
X = [a,b,d,e,g,h,k]
```

Let's use a _helper_ so that we can track the number...

```prolog
drop(Xs,N,X) :- drop_helper(Xs,N,N,X).
```

Not correct...

```prolog
drop_helper([],_,_,[]).
drop_helper([_|Xs],1,N,Ys) :- drop_helper(Xs,N,N,Ys).
drop_helper([X|Xs],K,N,Ys) :-
    J is K-1,
    drop_helper(Xs,J,N,[X|Ys]).
```
