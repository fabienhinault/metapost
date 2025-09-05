outputformat := "svg";
outputformatoptions := "format=rgb antialias=best";
hppp := 0.1;
vppp := 0.1;
tracingonline:=1;

%tracingall;

u := 1cm;

pair sender_seqs[];
pair reflector_seqs[];
pair received_places[];
pair receiveds[];
numeric reflector_seq_offset[];
numeric received_offset[];


min_sender_seq := 0;
max_sender_seq := 16;
min_reflector_seq := 0;
max_reflector_seq := 15;
nb_receiveds :=17;
receiveds[0] := (0,0);
receiveds[1] := (0,0);
receiveds[2] := (3,2);
receiveds[3] := (3,1);
receiveds[4] := (2,3);
receiveds[5] := (5,4);
receiveds[6] := (6,6);
receiveds[7] := (4,5);
receiveds[8] := (9,7);
receiveds[9] := (8,8);
receiveds[10] := (12,11);
receiveds[11] := (12,11);
receiveds[12] := (12,10);
receiveds[13] := (11,12);
receiveds[14] := (16,14);
receiveds[15] := (13,13);
receiveds[16] := (15,15);


% for absent iseq_reflectors
for iseq_reflector = min_reflector_seq upto max_reflector_seq:
    reflector_seq_offset[iseq_reflector] := min_sender_seq - min_reflector_seq + iseq_reflector;
endfor;

reflector_seq_offset[0] := 0;
reflector_seq_offset[1] := max(3, reflector_seq_offset[0] + 1);
reflector_seq_offset[2] := max(3, reflector_seq_offset[1] + 1);
reflector_seq_offset[3] := max(2, reflector_seq_offset[2] + 1);
reflector_seq_offset[4] := max(5, reflector_seq_offset[3] + 1);
reflector_seq_offset[5] := max(4, reflector_seq_offset[4] + 1);
reflector_seq_offset[6] := max(6, reflector_seq_offset[5] + 1);
reflector_seq_offset[7] := max(9, reflector_seq_offset[6] + 1);
reflector_seq_offset[8] := max(8, reflector_seq_offset[7] + 1);
reflector_seq_offset[10] := max(12, reflector_seq_offset[9] + 1);
reflector_seq_offset[11] := max(12, reflector_seq_offset[10] + 1);
reflector_seq_offset[12] := max(11, reflector_seq_offset[11] + 1);
reflector_seq_offset[13] := max(13, reflector_seq_offset[12] + 1);
reflector_seq_offset[14] := max(16, reflector_seq_offset[13] + 1);
reflector_seq_offset[15] := max(15, reflector_seq_offset[14] + 1);

% for absent iseq_reflectors
for iseq_reflector = min_reflector_seq + 1 upto max_reflector_seq:
    reflector_seq_offset[iseq_reflector] := max(reflector_seq_offset[iseq_reflector], reflector_seq_offset[iseq_reflector - 1] + 1);
endfor;


beginfig(1);
for iseq_sender = min_sender_seq upto max_sender_seq:
   sender_seqs[iseq_sender] := (u, -u * iseq_sender);
   label.lft(decimal(iseq_sender), sender_seqs[iseq_sender]);
endfor;
for iseq_reflector = min_reflector_seq upto max_reflector_seq:
   reflector_seqs[iseq_reflector] := (2u, -u * reflector_seq_offset[iseq_reflector]);
   label.(decimal(iseq_reflector), reflector_seqs[iseq_reflector]);
endfor;
for i_received = 0 upto nb_receiveds - 1:
    iseq_sender := xpart receiveds[i_received];
    iseq_reflector := ypart receiveds[i_received];
    draw sender_seqs[iseq_sender]--reflector_seqs[iseq_reflector];
    if i_received = 0:
        received_offset[0] := reflector_seq_offset[iseq_reflector];
    else:
        received_offset[i_received] := max(reflector_seq_offset[iseq_reflector], received_offset[i_received - 1] + 1);
    fi;
    received_places[i_received] := (3u, -u * received_offset[i_received]);
    draw reflector_seqs[iseq_reflector]--received_places[i_received];
    label.rt(decimal(xpart receiveds[i_received]) & "," & decimal(ypart receiveds[i_received]) & "                                        ", received_places[i_received]);
endfor;
        
endfig;
end




beginfig(1);
for iseq_sender = min_sender_seq upto max_sender_seq:
   sender_seqs[iseq_sender] := (u, -u * iseq_sender);
   label.lft(decimal(iseq_sender), sender_seqs[iseq_sender]);
endfor;
for iseq_reflector = min_reflector_seq upto max_reflector_seq:
   % reflector_seqs[iseq_reflector] := (2u, -u * reflector_seq_offset[iseq_reflector]);
   % label.(decimal(iseq_reflector), reflector_seqs[iseq_reflector]);
endfor;
for i_received = 0 upto nb_receiveds - 1:
        iseq_sender := xpart receiveds[i_received];
        iseq_reflector := ypart receiveds[i_received];
        draw sender_seqs[iseq_sender]--reflector_seqs[iseq_reflector];
        if i_received = 0:
            received_offset[0] := reflector_seq_offset[iseq_reflector];
        else
            % received_offset[i_received] := max(reflector_seq_offset[iseq_reflector], received_offset[i_received - 1] + 1);
        fi;
        received_places[i_received] := (3u, -u * received_offset[i_received]);
        draw reflector_seqs[iseq_reflector]--received_places[i_received];
        label.rt(decimal(xpart receiveds[i_received]) & "," & decimal(ypart receiveds[i_received]), received_places[i_received]);
endfor;
        
endfig;
end
    
