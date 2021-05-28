flattened([],[]).
flattened([H|T],Flattened) :-
    (is_list(H) ->
        flattened(H,FlattenedHead),
        flattened(T,FlattenedTail),
        append(FlattenedHead,FlattenedTail,Flattened)
        ; %% or
        flattened(T,FlattenedTail),
        append([H],FlattenedTail,Flattened)
    ).