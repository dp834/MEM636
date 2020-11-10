Jac[v_] := D[v, {{x1,x2,x3}}]
Lie[v_,w_] := Jac[w].v - Jac[v].w;

v1 = {x2, x1+x2, 0};
v2 = {x3, x1, x1};
x  = {x1,x2,x3};

Print["Problem 1.1 ", Lie[v1,v2]]

v1 = {x2, x1+x2, 0};
v2 = {x1, x2, x3};
x  = {x1,x2,x3};

Print["Problem 1.2 ", Lie[v1,v2]]
