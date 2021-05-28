element_at(X,[X|_],1).
element_at(X,[Y|Ys],K) :-
    element_at(X,Ys,J),
    J is K - 1.