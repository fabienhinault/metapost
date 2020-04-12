
outputformat := "png";
outputformatoptions := "format=rgb antialias=best";
hppp := 0.1;
vppp := 0.1;
beginfig(1);
u=5cm;
draw (u,0)..(0,u)..(-u,0)..(0,-u)..cycle;
drawarrow (-1.1u,0)--(1.1u,0);
drawarrow (0,-1.1u)--(0,1.1u);
label.top(btex $x$ etex,(1.1u,0));
label.rt(btex $y$ etex,(0,1.1u));
label.llft(btex $O$ etex,(0,0));
pickup pencircle scaled 4pt;
draw ((dir (180*{})) * u);
endfig;
end
