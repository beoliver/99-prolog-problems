# Problem 15 \*\*

## Duplicate the elements of a list a given number of times.

Example:

```prolog
?- dupli([a,b,c],3,X).
X = [a,a,a,b,b,b,c,c,c]
```

Assume that we have a predicate `repeat/3`:

```prolog
?- repeat(a,3,X).
X = [a,a,a]
```

```prolog
repeat(_,0,[]) :- !.
repeat(X,1,[X]) :- !.
repeat(X,K,[X|Repeated]) :-
    J is K-1,
    repeat(X,J,Repeated).
```

## Base case

```prolog
dupli([X],N,Repeated) :- repeat(X,N,Repeated).
```

## General case

Assume that:

1. All elements in a list `L` have been duplicated `N` times `dupli(L,N,LN)`. The result of this is the the List `LN`.

2. Given a variable `Elem` We have a list `ListOfElem` such that `Elem` has been repeated `N` times: `repeat(Elem,N,ListOfElem)`

3. The list stored in the variable `Result` is the result of appening `ListOfElem` to `Ln`: `append(ListOfElem,LN,Result)`.

**THEN**

`dupli([Elem|L],N,Result)`

```prolog
dupli([Elem|L],N,Result) :-
    dupli(L,N,LN),
    repeat(Elem,N,ListOfElem),
    append(ListOfElem,LN,Result).
```

## Program

```prolog
repeat(_,0,[]) :- !.
repeat(X,1,[X]) :- !.
repeat(X,K,[X|Repeated]) :-
    J is K-1,
    repeat(X,J,Repeated).

dupli([X],N,Repeated) :-
    repeat(X,N,Repeated),
    !.
dupli([Elem|L],N,Result) :-
    dupli(L,N,LN),
    repeat(Elem,N,ListOfElem),
    append(ListOfElem,LN,Result).
```
