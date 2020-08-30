
outputformat := "png";
outputformatoptions := "format=rgb antialias=best";
hppp := 0.1;
vppp := 0.1;

markinglength := 1mm;
color axiscolor;
axiscolor = 0.5 white;

def draw_axes(expr xmin, xmax, ymin, ymax) =
  drawarrow (xmin, 0)--(xmax, 0) withcolor axiscolor;
  drawarrow (0, ymin)--(0, ymax) withcolor axiscolor;
  label.top(btex $x$ etex, (xmax, 0));
  label.rt(btex $y$ etex, (0, ymax));
enddef;

def draw_axes_iso(expr min, max) =
  draw_axes(min, max, min, max);
enddef;

def draw_axes_sym(expr max) =
  draw_axes(-max, max, -max, max);
enddef;

% markings at dist and -dist on each axis.
def draw_ruler_four_dots(expr dist, labelpos, labelneg) =
  draw (0, dist)--(markinglength, dist) withcolor axiscolor;
  draw (0, -dist)--(markinglength, -dist) withcolor axiscolor;
  draw (dist, 0)--(dist, markinglength) withcolor axiscolor;
  draw (-dist, 0)--(-dist, markinglength) withcolor axiscolor;
  label.bot(labelpos, (dist, 0));
  label.bot(labelneg, (-dist, 0));
  label.lft(labelpos, (0, dist));
  label.lft(labelneg, (0, -dist));
enddef;

beginfig(1);
  u := 2.5cm;
  draw_axes_sym(2u);
  draw_ruler_four_dots(u, "1", "-1");
endfig;

beginfig(2);
  u := 2.5cm;
  _min := -2u;
  draw_axes_sym(-_min);
  draw_ruler_four_dots(u, "1", "-1");
  draw_ruler_four_dots(0.5u, btex ${1 \over 2}$ etex, btex $ -{1 \over 2}$ etex);

  penwidth = 1.25pt;
  pickup pensquare scaled penwidth;
  draw (-0.5u + 0.5penwidth, 0)--(0.5u - 0.5penwidth, 0) ;
  draw (0, -0.5u + 0.5penwidth)--(0, 0.5u - 0.5penwidth) ;
  drawdot(-0.5u, 0) withpen pencircle scaled (penwidth * 2);
  drawdot(0, -0.5u) withpen pencircle scaled (penwidth * 2);

  label.bot(btex $\bar{R} = \{ (x,y) | (x = 0 $ and $ -{1 \over 2} \leq y < {1 \over 2})$ or $ (y = 0 $ and $ -{1 \over 2} \leq x < {1 \over 2})\} $ etex, (0, _min));

endfig;


beginfig(3);
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
  draw_axes_sym(xmax);

  for i = 1 upto nymax:
    draw_ruler_four_dots(i * u, decimal(i), decimal(-i));
  endfor;
  def drawZtwo =
    for iX = nxmin upto nxmax:
      for iY = nymin upto nymax:
        drawdot(iX * u, iY * u) withpen pencircle scaled 1.5pt withcolor axiscolor;
      endfor
    endfor
  enddef;

  drawZtwo;

  penwidth := 1pt;
  pickup pensquare scaled penwidth;
  def draw_R_bar_plus(expr n, m) =
    draw ((n - 0.5) * u + 0.5penwidth, m * u)--((n + 0.5) * u - 0.5penwidth, m * u) ;
    draw (n * u, (m - 0.5) * u + 0.5penwidth)--(n * u, (m + 0.5) * u - 0.5penwidth) ;
  enddef;

  draw_R_bar_plus(1,2);
  draw_R_bar_plus(1,-4);
  draw_R_bar_plus(-5,2);
  draw_R_bar_plus(-3,-2);

  label.bot(btex $\bar{R} + (m,n) = \{ (x+m, y+n) | (x,y) \in \bar{R}\}$ for $(m,n) = (1,2),(1,-4),(-5,2),(-3,-2)$ etex, (0, ymin));

endfig;


beginfig(4);
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
  draw_axes_sym(xmax);

  for i = 1 upto nymax:
    draw_ruler_four_dots(i * u, decimal(i), decimal(-i));
  endfor;
  def drawZtwo =
    for iX = nxmin upto nxmax:
      for iY = nymin upto nymax:
        drawdot(iX * u, iY * u) withpen pencircle scaled 1.75pt withcolor axiscolor;
      endfor
    endfor
  enddef;

  drawZtwo;

  draw (-5.5u,-3u)..(3u,2.55u)..(5.5u,2u);

  draw_R_bar_plus(-5, -2);
  draw_R_bar_plus(-4,-1);
  draw_R_bar_plus(-4,0);
  draw_R_bar_plus(-3,1);
  draw_R_bar_plus(-2,1);
  draw_R_bar_plus(-1,2);
  draw_R_bar_plus(0,2);
  draw_R_bar_plus(1,2);
  draw_R_bar_plus(2,3);
  draw_R_bar_plus(3,3);
  draw_R_bar_plus(4,2);
  draw_R_bar_plus(5,2);

  label.bot(btex $\bar{R} + (m,n)$ that cross the curve etex, (0, ymin));

endfig;


beginfig(5);
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
%  drawarrow (xmin, 0)--(xmax, 0) withcolor axiscolor;
%  drawarrow (0, ymin)--(0, ymax) withcolor axiscolor;
%  label.top(btex $x$ etex, (xmax, 0));
%  label.rt(btex $y$ etex, (0, ymax));
%  label.llft("0", (0,0));

  def draw_ruler_four_dots(expr dist, labelpos, labelneg) =
    draw (0, dist)--(1mm, dist) withcolor axiscolor;
    draw (0, -dist)--(1mm, -dist) withcolor axiscolor;
    draw (dist, 0)--(dist, 1mm) withcolor axiscolor;
    draw (-dist, 0)--(-dist, 1mm) withcolor axiscolor;
    label.bot(labelpos, (dist, 0));
    label.bot(labelneg, (-dist, 0));
    label.lft(labelpos, (0, dist));
    label.lft(labelneg, (0, -dist));
  enddef;

  for i = 1 upto nymax:
%    draw_ruler_four_dots(i * u, decimal(i), decimal(-i));
  endfor;
  def drawZtwo =
    for iX = nxmin upto nxmax:
      for iY = nymin upto nymax:
        drawdot(iX * u, iY * u) withpen pencircle scaled 1.75pt withcolor axiscolor;
      endfor
    endfor
  enddef;

  drawZtwo;


  penwidth := 1.25pt;
  pickup pensquare scaled penwidth;
  def draw_R_bar_plus(expr n, m) =
    draw ((n - 0.5) * u + 0.5penwidth, m * u)--((n + 0.5) * u - 0.5penwidth, m * u) ;
    draw (n * u, (m - 0.5) * u + 0.5penwidth)--(n * u, (m + 0.5) * u - 0.5penwidth) ;
  enddef;

  def draw_pixel(expr n, m) =
    drawdot (n * u , m * u) withpen pensquare scaled u withcolor axiscolor;
  enddef;
  draw_pixel(-5, -2);
  draw_pixel(-4,-1);
  draw_pixel(-4,0);
  draw_pixel(-3,1);
  draw_pixel(-2,1);
  draw_pixel(-1,2);
  draw_pixel(0,2);
  draw_pixel(1,2);
  draw_pixel(2,3);
  draw_pixel(3,3);
  draw_pixel(4,2);
  draw_pixel(5,2);

  path p;
  p := (-5.5u,-3u)..(3u,2.55u)..(5.5u,2u); 
  draw p withpen pencircle scaled 2pt withcolor white;
  draw p withpen pencircle scaled 1pt withcolor black;

  label.bot(btex Freeman's rendering of the curve etex, (0, ymin));

endfig;


end
