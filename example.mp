% example from the manual
% https://www.tug.org/docs/metapost/mpman.pdf fig.1 p.3

beginfig(2);
u=1cm;
draw (2u,2u)--(0,0)--(0,3u)--(3u,0)--(0,0);
pickup pencircle scaled 4pt;
for i=0 upto 2:
  for j=0 upto 2: drawdot (i*u,j*u); endfor
endfor
endfig;
end;