outputformat := "svg";
outputformatoptions := "format=rgb antialias=best";
hppp := 0.1;
vppp := 0.1;
tracingonline:=1;

u := 0.2cm;
offset := 1.2 * u;
h := .5 u;
middle := 0.5 * (11 * offset + u);

path square;
square := origin--(u, 0)--(u, u)--(0, u)--cycle;

def drawiarrowabove(expr iarrow, nh, a) = 
    drawdblarrow (iarrow * offset + (1 - a) * u, u + .5h)..(middle, u + nh * h)..((11 - iarrow) * offset + a * u , u + .5h);
enddef;

def drawiarrowbellow(expr iarrow, nh, a) = 
    drawdblarrow (iarrow * offset + (1 - a) * u, - .5h)..(middle, -nh * h)..((11 - iarrow) * offset + a * u , - .5h);
enddef;

def drawmarrowabove(expr istart, iend, nh, astart, aend) = 
    xstart := istart * offset + astart * u;
    xend := iend * offset + aend * u;
    middle := .5 * (xstart + xend);
    drawarrow (xstart, u + .5h)..(middle, u + nh * h)..(xend , u + .5h);
enddef;

def drawmarrowstraight(expr istart, iend, nh, astart, aend) = 
    xstart := istart * offset + astart * u;
    xend := iend * offset + aend * u;
    middle := .5 * (xstart + xend);
    drawarrow (xstart, nh * u)--(xend , nh * u);
enddef;

def drawmarrowbellow(expr istart, iend, nh, astart, aend) = 
    xstart := istart * offset + astart * u;
    xend := iend * offset + aend * u;
    middle := .5 * (xstart + xend);
    drawarrow (xstart, - .5h)..(middle, - nh * h)..(xend , - .5h);
enddef;

beginfig(1);
for i = 0 upto 11:
    draw square shifted (i * offset, 0);
endfor;
drawiarrowabove(0, 3.5, 0);
drawiarrowabove(2, 2.85, 0);
drawiarrowabove(4, 2, .4);
drawiarrowbellow(5, 2, .6);
drawiarrowbellow(3, 3, 0.1);
drawiarrowbellow(1, 3.5, 0);
endfig;

beginfig(2);
for i = 0 upto 11:
    draw square shifted (i * offset, 0);
endfor;
drawmarrowabove(11, 1, 3.5, 0, 1);
drawmarrowabove(10, 3, 3, 0, 1);
drawmarrowabove(9, 5, 2.5, 0.2, .8);
drawmarrowabove(8, 7, 2, 0.5, .5);
drawmarrowabove(7, 9, 2, 0.5, .5);
drawmarrowabove(6, 11, 3.5, 1, .4);
drawmarrowbellow(1, 2, 2, 0.5, 0.5);
drawmarrowbellow(2, 4, 2, 0.5, 0.25);
drawmarrowbellow(3, 6, 3, 0.5, 0.25);
drawmarrowbellow(4, 8, 2, 0.75, 0.25);
drawmarrowbellow(5, 10, 3, 0.5, 0);
endfig;

beginfig(3);
for i = 0 upto 11:
    draw square shifted (i * offset, 0);
endfor;
drawmarrowabove(11, 1, 3.5, 0, 1);
drawmarrowabove(10, 3, 3, 0, 1);
drawmarrowabove(9, 5, 2.5, 0.2, .8);
drawmarrowabove(8, 7, 2, 0.5, .5);
drawmarrowstraight(7, 9, .75, 0.5, .5);
drawmarrowstraight(6, 11, 0.25, .5, .4);
drawmarrowbellow(1, 2, 3, 0.5, 0.5);
drawmarrowbellow(2, 4, 3, 0.5, 0.5);
drawmarrowbellow(3, 6, 3, 0.5, 0.5);
drawmarrowbellow(4, 8, 3, 0.5, 0.5);
drawmarrowbellow(5, 10, 3, 0.5, 0.5);
endfig;
end;