# Problem 17 \*

## Split a list into two parts; the length of the first part is given.

Do not use any predefined predicates.

Example:

```prolog
?- split([a,b,c,d,e,f,g,h,i,k],3,L1,L2).
L1 = [a,b,c]
L2 = [d,e,f,g,h,i,k]
```

We are going to use `split_nth` defined in `P16` as a template...

```prolog
split_nth(L,N,Prefix,Suffix) :- split_nth_helper(L,N,[],Prefix,Suffix).

split_nth_helper([],_,Acc,Prefix,[]) :-
    reverse(Acc,Prefix),
    !.
split_nth_helper([_|Elems],0,Acc,Prefix,Elems) :-
    reverse(Acc,Prefix),
    !.
split_nth_helper([Elem|List],N,Acc,Prefix,Suffix) :-
    M is N-1,
    split_nth_helper(List,M,[Elem|Acc],Prefix,Suffix).
```

The only difference is that we need a `my_reverse/2` so that we are not using any
predefined predicates.

## Program

```prolog
split(L,N,Prefix,Suffix) :- split_nth_helper(L,N,[],Prefix,Suffix).

split_nth_helper([],_,Acc,Prefix,[]) :-
    reverse(Acc,Prefix),
    !.
split_nth_helper([_|Elems],0,Acc,Prefix,Elems) :-
    my_reverse(Acc,Prefix),
    !.
split_nth_helper([Elem|List],N,Acc,Prefix,Suffix) :-
    M is N-1,
    split_nth_helper(List,M,[Elem|Acc],Prefix,Suffix).

my_reverse(Xs,Ys) :- my_reverse_helper(Xs,[],Ys).

my_reverse_helper([],Reversed,Reversed).
my_reverse_helper([H|T],Acc,Reversed) :-
    my_reverse_helper(T, [H|Acc], Reversed).
```
