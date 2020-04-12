prologues := 2;
beginfig(1);
    u := 3cm; 
    path c[][], C_left, C_right;
    for iX=0 upto 3:
        for iY=0 upto 3:
            c[iX][iY] := fullcircle scaled u shifted (iX * u, iY * u);
            draw c[iX][iY];
        endfor
    endfor
    v := u * 2.25;
    C_left  = fullcircle scaled v shifted (0.5 * (v - u), 2u);
    C_right = fullcircle scaled v shifted (0.5 * (7u - v), 2u);
    draw C_left;
    draw C_right;
    pickup pencircle scaled 4pt;
    drawdot (1.5u, 1.6u);

    def drawtwodots(expr x, y) =
        drawdot(x, y);
        drawdot(3u - x, y);
    enddef;

    drawdot center c[1][2];
    drawdot center c[2][2];
    drawdot center buildcycle(c[1][2], c[1][1], c[0][1], c[0][2]);
    drawdot center buildcycle(c[3][2], c[3][1], c[2][1], c[2][2]);
    drawtwodots (u, 1.1u);
    drawtwodots (.1u, 1.2u);
    drawtwodots (-.3u, 1.5u);
    drawtwodots (1.25u, 1.5u);
endfig;
beginfig(2);
    u := 3cm; % 24 = 24bp = 1/3 inch
    path c[][], C_left, C_right;
    for iX=0 upto 3:
        for iY=0 upto 3:
            c[iX][iY] := fullcircle scaled u shifted (iX * u, iY * u);
            draw c[iX][iY];
        endfor
    endfor
    v := u * 2.25;
    C_left  = fullcircle scaled v shifted (0.5 * (v - u), 2u);
    C_right = fullcircle scaled v shifted (0.5 * (7u - v), 2u);
    draw C_left;
    draw C_right;
    pickup pencircle scaled 4pt;
    draw buildcycle(reverse c[2][1], reverse C_right);
    draw buildcycle(reverse c[1][1], reverse C_left);
endfig;
end;