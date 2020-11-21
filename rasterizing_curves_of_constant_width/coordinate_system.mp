input latexmp;
setupLaTeXMP(packages="amssymb");
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
  label.llft("0", (0,0));

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

label.bot(textext("$\mathbb{Z}^2$ must not lie at the corners of the pixels"), (0, xmin));

endfig;

beginfig(2);
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
    for iX = nxmin - 1 upto nxmax:
      draw ((iX + 0.5) * u, ymin)--((iX + 0.5) * u, ymax) withpen pencircle scaled width;
    endfor
    for iY = nymin - 1 upto nymax:
      draw (xmin, (iY + 0.5) * u)--(xmax, (iY + 0.5) * u) withpen pencircle scaled width;
    endfor
  enddef;

  draw_pixels;

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

  label.bot(textext("$\mathbb{Z}^2$ must lie at the centers of the pixels"), (0, xmin));

endfig;
end
