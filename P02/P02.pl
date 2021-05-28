last_but_one(X,[X,_]).
last_but_one(X,[_|Xs]) :- last_but_one(X,Xs).