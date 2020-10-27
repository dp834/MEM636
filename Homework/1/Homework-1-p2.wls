#!/usr/local/bin/math -script

dx1 = x2
dx2 = -x1^3 -c x2
x = {x1,x2}
linModel = {{D[dx1,x1], D[dx1,x2]},{D[dx2,x1],D[dx2,x2]}}
Print[linModel]
a = linModel /. {x1 -> 0,x2->0}
Print["a: ",a]
q = -{{1,0},{0,1}}
Print["q: ", q]
Print["PositiveDefinite: ", PositiveDefiniteMatrixQ[q]]
p = -(q.a + Transpose[a].q)
Print["p: ", p]
Print["PositiveDefinite: ", PositiveDefiniteMatrixQ[p]]
data = Table[{{x1,x2},a.x /. {c->1}}, {x1,-5,5},{x2,-5,5}]
Print["Eigenvalues: ", Eigenvalues[p]]
Export[
"images/vectorplot2_2(Pos_c).png",
ListVectorPlot[data, PlotLegends->Automatic, GridLines->Automatic]
]
data = Table[{{x1,x2},a.x /. {c->-1}}, {x1,-5,5},{x2,-5,5}]
Export[
"images/vectorplot2_2(Neg_c).png",
ListVectorPlot[data, PlotLegends->Automatic, GridLines->Automatic]
]

Export[
    "images/streamplot2_2(Pos_c).png",
    StreamPlot[{x1,-x2}, {x1,-5,5}, {x2,-5,5}, PlotLegends->Automatic, GridLines->Automatic]
]

Export[
    "images/streamplot2_2(Neg_c).png",
    StreamPlot[{x1,x2}, {x1,-5,5}, {x2,-5,5}, PlotLegends->Automatic, GridLines->Automatic]
]


Print["Part 3"]
data = Table[With[{c=1},{{x1,x2},{x2,-x1^3-c x2}}], {x1,-5,5},{x2,-5,5}]
Export[
"images/vectorplot2_3(Pos_c).png",
ListVectorPlot[data, PlotLegends->Automatic, GridLines->Automatic]
]
data = Table[With[{c=-1},{{x1,x2},{x2,-x1^3-c x2}}], {x1,-5,5},{x2,-5,5}]
Export[
"images/vectorplot2_3(Neg_c).png",
ListVectorPlot[data, PlotLegends->Automatic, GridLines->Automatic]
]

Export[
    "images/streamplot2_3(Pos_c).png",
    StreamPlot[{x2,-x1^3-1 x2}, {x1,-5,5}, {x2,-5,5}, PlotLegends->Automatic, GridLines->Automatic]
]

Export[
    "images/streamplot2_3(Neg_c).png",
    StreamPlot[{x2,-x1^3+1 x2}, {x1,-5,5}, {x2,-5,5}, PlotLegends->Automatic, GridLines->Automatic]
]

v = x1^2 + x2^2
2 x1 dx1 x2^2 + 2 x2 dx2 x1^2
Print[D[v[x1,x2], x1] + D[v[x1,x2],x2]]
dvDotX = 2 x1 dx1 + 2 x2 dx2
Print[dvDotX]


(*
pde = D[V[x1,x2],x[[1]]]dx1 + D[V[x1,x2],x[[2]]]dx2 == 0
Print[pde]
sol = DSolve[pde, V[x1,x2], {x1,x2}]
Print[sol]
*)
