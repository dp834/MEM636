dx1 = x1^2 x2
dx2 = 3 x2+u
x = {x1,x2}

nsys = NonlinearStateSpaceModel[{{dx1,dx2},{x1}}, {x1,x2}, u];
asys = AffineStateSpaceModel[{{dx1,3x2},{{0},{1}},{x1}}, {x1,x2}];
lsys = StateSpaceModel[nsys];
cmatrix = ControllabilityMatrix[lsys];
Print["Controllability Matrix: ", cmatrix]
Print["Rank: ", MatrixRank[cmatrix]]


Clear["Global`*"]
Jac[v_] := D[v, {{x1,x2}}]
Lie[v_,w_] := Jac[w].v - Jac[v].w;
f = {x1^2 x2, 3x2}
g = {0,1}

Print["Lie[f,g]: ", Lie[f, g]]
Print["Lie[Lie[f, g],g]: ", Lie[Lie[f, g],g]]
