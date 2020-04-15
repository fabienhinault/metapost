
outputformat := "png";
outputformatoptions := "format=rgb antialias=best";
hppp := 0.1;
vppp := 0.1;

beginfig(1);
  u := 1cm;
  ext := 0.5 u;
  nxmin := -5;
  nxmax := 5;
  nymin := nxmin;
  nymax := nxmax;
  xmin := nxmin * u - ext;
  xmax := nxmax * u + ext;
  ymin := nymin * u - ext;
  ymax := nymax * u + ext;
  color axiscolor;
  axiscolor := 0.5 white;
  drawarrow (xmin, 0)--(xmax, 0) withcolor 0.5 white;
  drawarrow (0, ymin)--(0, ymax) withcolor 0.5 white;

  def drawruler_x =
    for iY = nymin upto nymax:
      if (not (iY = 0)):
        draw (0, iY * u)--(1mm, iY * u) withcolor axiscolor;
        label.lft(decimal(iY), (0, iY * u));
      else:
      fi
    endfor
  enddef;
  
  def drawruler_y =
    for iX = nxmin upto nxmax:
      if (not (iX = 0)):
        draw (iX * u, 0)--(iX * u, 1mm) withcolor axiscolor;
        label.bot(decimal(iX), (iX * u, 0));
      else:
      fi
    endfor
  enddef;
  
  drawruler_x;
  drawruler_y;

  def drawZtwo =
    for iX = nxmin upto nxmax:
      for iY = nymin upto nymax:
        drawdot(iX * u, iY * u) withpen pencircle scaled 1.75pt;
      endfor
    endfor
  enddef;

  drawZtwo;

  def draw_pixels = 
    width := 0.25pt;
    for iX = nxmin upto nxmax:
      draw (iX * u, ymin)--(iX * u, ymax) withpen pencircle scaled width;
    endfor
    for iY = nymin upto nymax:
      draw (xmin, iY * u)--(xmax, iY * u) withpen pencircle scaled width;
    endfor
  enddef;

  draw_pixels;

  def draw_NO =
    pen noPen;
    noPen := pensquare scaled 20pt rotated 45;
    draw (xmin, ymin)--(xmax, ymax) withpen noPen withcolor red;
    draw (xmax, ymin)--(xmin, ymax) withpen noPen withcolor red;
  enddef;

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

  draw_NO;

label.bot(btex Z2 must not lie at the corners of the pixels etex, (0, xmin));

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
