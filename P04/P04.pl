count([],0).
count([_|Xs],N) :- count(Xs,M), N is M + 1.