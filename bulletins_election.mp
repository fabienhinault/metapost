prologues:=3;
input TEX;
beginfig(1);


margin := 1cm;
l := 27.7cm;
w := 19cm;
nl := 4; % nb of bulletins on the length
nw := 2; % nb of bulletins on the width



for i=1 upto nl-1:
  draw (0, l/nl*i)--(w, l/nl*i);
endfor


for i=1 upto nw-1:
  draw (w/nw*i, 0)--(w/nw*i, l);
endfor

string candidate[];
candidate0 := "Candidat Z\'ero";
candidate1 := "Candidate Une";
candidate2 := "Candidat Deux";
candidate3 := "Candidate Trois";
candidate4 := "Candidat Quatre";
candidate5 := "Candidate Cinq";
for i=0 upto 5:
  iy := i div nw;
  ix := i mod nw;
  label(TEX( candidate[i] ),(w/nw*ix + w/nw/2,l/nl*iy + l/nl/2));
endfor


endfig;
end;