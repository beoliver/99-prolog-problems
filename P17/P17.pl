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