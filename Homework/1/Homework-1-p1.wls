#!/usr/local/bin/math -script

dx[x_] := 2 - 3 x + x^2
Print[dx[x] == 0]
dxsol = Solve[dx[x]==0, x]
Print[dxsol]
Export["images/plot1_1.png",
    Plot[dx[t],
    {t, Min[x /. dxsol] - 2 , Max[x /. dxsol] + 2 },
    PlotLabels->"Expressions"
    ]
]
streamplot = StreamPlot[{1,dx[t]},
    {x,-10,10},
    {t, Min[x /. dxsol] - 2 , Max[x /. dxsol] + 2 },
    StreamScale->{Small,Automatic, .025, Automatic}
]
equilibirumPlot = Plot[x /. dxsol,
    {x,-10,10},
    PlotStyle->Red,
    PlotLabels->"Expressions"
]
Export["images/streamplot1_1.png",
    Show[streamplot, equilibirumPlot]
]

dx[x_] := -40 x + 40 x^2 + 10 x^3
Print[dx[x] == 0]
dxsol = Solve[dx[x]==0, x]
Print[dxsol]
Export["images/plot1_2.png",
    Plot[dx[t],
    {t, Min[x /. dxsol] - 2 , Max[x /. dxsol] + 2 },
    PlotLabels->"Expressions"
    ]
]
streamplot = StreamPlot[{1,dx[t]},
    {x,-10,10},
    {t, Min[x /. dxsol] - 2 , Max[x /. dxsol] + 2 },
    StreamScale->{Small,Automatic, .025, Automatic}
]
equilibirumPlot = Plot[x /. dxsol,
    {x,-10,10},
    PlotStyle->Red,
    PlotLabels->"Expressions"
]
Export["images/streamplot1_2.png",
    Show[streamplot, equilibirumPlot]
]
