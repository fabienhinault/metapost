
outputformat := "png";
outputformatoptions := "format=rgb antialias=best";
hppp := 0.1;
vppp := 0.1;

beginfig(1);
  u = 2.5cm;
  xmin = -2u;
  xmax = 2u;
  ymin = -2u;
  ymax = 2u;
  color axiscolor;
  axiscolor = 0.5 white;
  drawarrow (xmin, 0)--(xmax, 0) withcolor 0.5 white;
  drawarrow (0, ymin)--(0, ymax) withcolor 0.5 white;
  draw (0, u)--(1mm, u) withcolor axiscolor;
  draw (0, -u)--(1mm, -u) withcolor axiscolor;
  draw (u, 0)--(u, 1mm) withcolor axiscolor;
  draw (-u, 0)--(-u, 1mm) withcolor axiscolor;
label.top(btex $x$ etex, (xmax, 0));
label.rt(btex $y$ etex, (0, ymax));
label.bot("1", (u, 0));
label.bot("-1", (-u, 0));
label.llft("0", (0,0));
label.lft("1", (0, u));
label.lft("-1", (0, -u));
pickup pencircle scaled 4pt;
endfig;


beginfig(2);
  color axiscolor;
  axiscolor = 0.5 white;
  drawarrow (xmin, 0)--(xmax, 0) withcolor 0.5 white;
  drawarrow (0, ymin)--(0, ymax) withcolor 0.5 white;
  draw (0, u)--(1mm, u) withcolor axiscolor;
  draw (0, -u)--(1mm, -u) withcolor axiscolor;
  draw (u, 0)--(u, 1mm) withcolor axiscolor;
  draw (-u, 0)--(-u, 1mm) withcolor axiscolor;
label.top(btex $x$ etex, (xmax, 0));
label.rt(btex $y$ etex, (0, ymax));
label.bot("1", (u, 0));
label.bot("-1", (-u, 0));
label.llft("0", (0,0));
label.lft("1", (0, u));
label.lft("-1", (0, -u));

  pickup pencircle scaled 4pt;
  draw (-u + 2pt, 0)--(u - 2pt, 0) ;
  draw (0, -u + 2pt)--(0, u - 2pt) ;

label.bot(btex $\bar{R} = \{ (x,y) | (x = 0 $ and $ -{1 \over 2} \leq y < {1 \over 2})$ or $ (y = 0 $ and $ -{1 \over 2} \leq x < {1 \over 2})\} $ etex, (0, ymin));

endfig;
end
