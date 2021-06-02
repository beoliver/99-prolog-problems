# Solution 16 \*\*

## Drop every N'th element from a list.

Example:

```prolog
?- drop([a,b,c,d,e,f,g,h,i,k],3,X).
X = [a,b,d,e,g,h,k]
```

```prolog
split_nth(L,N,Prefix,Suffix) :-
    split_nth_helper(L,N,[],Prefix,Suffix).
%% helper takes an additional accumulator
split_nth_helper([],_,Acc,Prefix,[]) :-
    reverse(Acc,Prefix),
    !.
split_nth_helper([_|Elems],1,Acc,Prefix,Elems) :-
    reverse(Acc,Prefix),
    !.
split_nth_helper([Elem|Elems],N,Acc,Prefix,Suffix) :-
    M is N-1,
    split_nth_helper(Elems,M,[Elem|Acc],Prefix,Suffix).
```

```prolog
every_nth_dropped([],_,Result,Result) :- !.
every_nth_dropped(L,N,Acc,Result) :-
    split_nth(L,N,Prefix,Suffix),
    append(Acc,Prefix,UpdatedAcc),
    every_nth_dropped(Suffix,N,UpdatedAcc,Result).
```

```prolog
drop(List,N,Result) :-
    every_nth_dropped(List,N,[],Result).
```
