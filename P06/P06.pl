palindrome([]).
palindrome([_]).
palindrome([X|PX]) :-
    append(P,[X],PX),
    palindrome(P).