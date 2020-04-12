prologues := 2;
beginfig(1);
    u := 3cm;
    y1 = y2 = 0;
    x1 = 0;
    x2 = u;
    x3 = (x1 + x2) / 2;
    y3 = u * (sqrt 3) / 2 ;%(sqr(x2 - x1) - sqr(x3 - x1));
    numeric d[];
    numeric a;
    T = 1.25;
    t = 0.75;
    draw z1..tension T..z2..tension t..z3..tension T..z1..tension t..z2..tension T..z3..tension t..cycle;

    pickup pencircle scaled 4pt;
    drawdot z1;
    drawdot z2;
    drawdot z3;

%    a - b = 90;
%    draw z1...z2{dir a}...z3..z1...z2{dir b}...z3..cycle;
% >> a
% ! Improper transformation argument.


%    draw z1...z2{dir d4}...z3{dir d6}..z1..z2{dir d5}..z3{dir d7}..cycle;
%    d4 = d5 + 90;
%    d6 = d7 - 90;
% >> d4
% ! Improper transformation argument.


endfig;
end;