# Solution 18 \*\*

## Extract a slice from a list.

```prolog
?- slice([a,b,c,d,e,f,g,h,i,k],3,7,L).
X = [c,d,e,f,g]
```

We can just resuse the predicate `split_nth/4` defined in [Problem 16](../P16/solution.md).

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

Have to fiddle with the offsets :P

```prolog
slice(Input,I,J,Slice) :-
    split_nth(Input,I-1,_,Suffix),
    N is J-I+2,
    split_nth(Suffix,N,Slice,_).
```
