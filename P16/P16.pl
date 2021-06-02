split_nth(L,N,Prefix,Suffix) :- split_nth_helper(L,N,[],Prefix,Suffix).

split_nth_helper([],_,Acc,Prefix,[]) :-
    reverse(Acc,Prefix),
    !.
split_nth_helper([_|Elems],1,Acc,Prefix,Elems) :-
    reverse(Acc,Prefix),
    !.
split_nth_helper([Elem|List],N,Acc,Prefix,Suffix) :-
    M is N-1,
    split_nth_helper(List,M,[Elem|Acc],Prefix,Suffix).


every_nth_dropped([],_,Result,Result) :- !.
every_nth_dropped(L,N,Acc,Result) :-
    split_nth(L,N,Prefix,Suffix),
    append(Acc,Prefix,UpdatedAcc),
    every_nth_dropped(Suffix,N,UpdatedAcc,Result).

drop(List,N,Result) :-
    every_nth_dropped(List,N,[],Result).
