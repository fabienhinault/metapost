outputformat := "png";
outputformatoptions := "format=rgb antialias=best";
hppp := 0.1;
vppp := 0.1;

markinglength := 1mm;
color axiscolor;
axiscolor := 0.5 white;

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


def drawZtwo(expr nxmin, nxmax, nymin, nymax, u) =
  for iX = nxmin upto nxmax:
    for iY = nymin upto nymax:
      drawdot(iX * u, iY * u) withpen pencircle scaled 1.75pt withcolor axiscolor;
    endfor
  endfor
enddef;

def drawZtwo_sym(expr max, u) =
  drawZtwo(-max, max, -max, max, u);
enddef;

def draw_pixel(expr n, m, u) =
  drawdot (n * u , m * u) withpen pensquare scaled u withcolor axiscolor;
enddef;

beginfig(1);
  u := 1cm;
  ext := 0.5 u;
  nmax := 5;
  _max := nmax * u + ext;
  draw_axes_sym(_max);
  for i = 1 upto nmax:
    draw_ruler_four_dots(i * u, decimal(i), decimal(-i));
  endfor;
  draw_pixel(3, 2, u);
  draw_pixel(3, 3, u);
  drawZtwo_sym(nmax, u);
  path p;
  p := (-5.5u,-3u)..(3u,2.55u)..(5.5u,2u);
  draw p;
  draw fullcircle scaled 2u shifted (3u,2.55u);
  drawdot(3 * u, 3 * u) withpen pencircle scaled 1.75pt;
  drawdot(3 * u, 2 * u) withpen pencircle scaled 1.75pt;
endfig;

beginfig(2);
  u := 1cm;
  ext := 0.5 u;
  nmax := 5;
  _max := nmax * u + ext;
  draw_pixel(3, 2, u);
  draw_pixel(3, 3, u);
  drawZtwo_sym(nmax, u);
  path p;
  p := (-5.5u,-3u)..(3u,2.55u)..(5.5u,2u); 
  draw p withpen pencircle scaled 2pt withcolor white;
  draw p withpen pencircle scaled 1pt withcolor black;
endfig;

end
