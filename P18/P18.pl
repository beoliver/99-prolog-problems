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

slice(Input,I,J,Slice) :-
    split_nth(Input,I-1,_,Suffix),
    N is J-I+2,
    split_nth(Suffix,N,Slice,_).
