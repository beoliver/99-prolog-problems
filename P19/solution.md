# Solution 19 \*\*

## Rotate a list N places to the left.

Examples:

```prolog
?- rotate([a,b,c,d,e,f,g,h],3,X).
X = [d,e,f,g,h,a,b,c]
```

```prolog
?- rotate([a,b,c,d,e,f,g,h],-2,X).
X = [g,h,a,b,c,d,e,f]
```

Hint: Use the predefined predicates length/2 and append/3, as well as the result of problem P17.
