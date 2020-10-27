#!/usr/local/bin/math -script

Print["Problem 3"]
Print["Part 1"]
Print["Looking near the origin -1 < 2x - dx < 1"]

dx1 = x2
dx2 = -x1 -x2

data = Table[{{x1,x2},{x2,-x1 -x2}}, {x1,-2,2},{x2,-2,2}];
vectorPlotOrigin= ListVectorPlot[data,
    VectorPoints -> Fine,
    RegionFunction->Function[{x1,x2}, -1 < 2 x1 - x2 < 1],
    RegionFillingStyle -> None,
    RegionBoundaryStyle -> None
];
streamPlotOrigin = StreamPlot[{x2, -x1 -x2},{x1,-2,2},{x2,-2,2},
    GridLines->Automatic,
    RegionFunction->Function[{x1,x2}, -1 < 2 x1 - x2 < 1],
    RegionFillingStyle -> None,
    RegionBoundaryStyle -> None
];

Export[
    "images/streamplot3_1_origin.png",
    Show[vectorPlotOrigin]
]

data = Table[{{x1,x2},{x2,x1-1}}, {x1,-2,2},{x2,-2,2}];
vectorPlotPositive= ListVectorPlot[data,
    VectorPoints -> Fine,
    GridLines->Automatic,
    RegionFunction->Function[{x1,x2}, 1 < 2 x1 - x2 ],
    RegionFillingStyle -> None,
    RegionBoundaryStyle -> None
];

streamPlotPositive = StreamPlot[{x2, x1 -1},{x1,-2,2},{x2,-2,2},
    GridLines->Automatic,
    RegionFunction->Function[{x1,x2}, 1 < 2 x1 - x2 ],
    RegionFillingStyle -> None,
    RegionBoundaryStyle -> None
];
Export[
    "images/streamplot3_1_positive.png",
    Show[vectorPlotPositive]
]

data = Table[{{x1,x2},{x2,x1+1}}, {x1,-2,2},{x2,-2,2}];
vectorPlotNegative = ListVectorPlot[data,
    VectorPoints -> Fine,
    GridLines->Automatic,
    RegionFunction->Function[{x1,x2}, -1 > 2 x1 - x2],
    RegionFillingStyle -> None,
    RegionBoundaryStyle -> None
];

streamPlotNegative = StreamPlot[{x2, x1 +1},{x1,-2,2},{x2,-2,2},
    GridLines->Automatic,
    RegionFunction->Function[{x1,x2}, -1 > 2 x1 - x2],
    RegionFillingStyle -> None,
    RegionBoundaryStyle -> None
];

boundaryLines = Plot[{ 2 x1 + 1, 2x1 - 1}, {x1,-6,6}, PlotStyle->{Red,Red}];

streamPlot = Show[streamPlotNegative, streamPlotOrigin, streamPlotPositive];
Export[
    "images/streamplot3_1_combined.png",
    Show[streamPlot, boundaryLines]
]

vectorPlot = Show[vectorPlotNegative, vectorPlotOrigin, vectorPlotPositive];

Export[
    "images/vectorplot3_1_combined.png",
    Show[vectorPlot, boundaryLines]
]

regionOfAttraction = ContourPlot[x1^2 + x2^2 == .45^2, {x1,-2,2},{x2,-2,2}, ContourStyle->Blue];

Export[
    "images/streamplot3_1_region_of_attraction.png",
    Show[vectorPlot,
         regionOfAttraction,
         boundaryLines ]
]

lesalleContourPlot = ContourPlot[x1^2+x2^2, {x1, -2, 2}, {x2, -2, 2}, PlotPoints->50, Contours->15, PlotLegends->Automatic];
Export[
    "images/ContourPlot3_1.png",
    Show[lesalleContourPlot]
]

Print["Part 2"]
dx1 = x2
dx2 = x1^3 -x1 -x2 Abs[x2]

data = Table[{{x1,x2},{x2, x1^3 -x1 -x2 Abs[x2]}}, {x1,-5,5},{x2,-5,5}];
vectorPlot = ListVectorPlot[data,
    VectorPoints -> Fine,
    GridLines->Automatic,
    RegionFillingStyle -> None,
    RegionBoundaryStyle -> None
];

Export[
    "images/vectorplot3_2.png",
    Show[vectorPlot]
]

streamPlot = StreamPlot[{x2, x1^3 -x1 -x2 Abs[x2]}, {x1,-5,5}, {x2,-5,5},
    GridLines->Automatic,
    RegionFillingStyle -> None,
    RegionBoundaryStyle -> None
];

Export[
    "images/streamplot3_2.png",
    Show[streamPlot]
]

specialPoints = ContourPlot[-x1^4/2 + x1^2 + x2^2, {x1, -5, 5}, {x2, -5, 5}, PlotPoints->50,
        Contours->Flatten[{0, .25, .5, .75, 1, Subdivide[-5^4, 20 ,50]}],
        PlotLegends->Automatic
];
Export[
    "images/contourplot3_2.png",
    Show[specialPoints]
]

lesalleContourPlot = ContourPlot[-x1^4/2 + x1^2 + x2^2 == .47 , {x1, -1, 1}, {x2, -5, 5}, ContourStyle->Red];


Export[
    "images/plot3_2.png",
    Show[streamPlot, lesalleContourPlot]
]
