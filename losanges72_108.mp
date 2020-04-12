72°/108° losanges on a A4 sheet.

beginfig(2);

margin := 1cm;
nw := 6;
l := 27.7cm;
w := 19cm;
a := 90 - 72;
( ca, sa ) =dir a;
u:=w / 6 / ca;
x1 := w / ca * sa;
y1 := w;
for i = -1 upto l/u:
  draw (margin, margin + i * u)--(margin + w, margin + x1 + i * u);
endfor
h := u * ca;
for j=0 upto w / h:
  draw (margin + j * h, margin)--(margin + j * h, margin + l);
endfor
clip currentpicture to (margin, margin)--(margin + 0, margin + l)--(margin + w, margin + l)--(margin + w, margin + 0)--cycle

endfig;
end;