function print_array(arayi,x,y) { 
    for(i=1;i <=x; i++){
    	str=""
    	for (j=1; j<=y; j++){
    		str=str""arayi[(i-1)*x+j];
    	}
    	print str;
    }
}
function dump_frame(frame) {

    fname = sprintf("frames/frame_%04d.txt", frame)

    for (y = 1; y <= line; y++) {
        for (x = 1; x <= width; x++) {
            idxpad = (y + 1) * (width + 2) + (x + 1)
            printf "%s", padmatrix[idxpad] > fname
        }
        printf "\n" > fname
    }

    close(fname)
}



BEGIN {
matrix=""
line=0
system("mkdir -p frames")
}

{
matrix= matrix $0;
line++;
}

END {

size = length(matrix);
width= size/line; 

nb[1]= -width - 2 - 1;
nb[2]= -width - 2;
nb[3]= -width - 2 + 1;
nb[4]= -1;
nb[5]= +1;
nb[6]= +width + 2 - 1;
nb[7]= +width + 2;
nb[8]= +width + 2 + 1;

for(i=1; i <= (line+2)*(width+2); i++){
	plop=plop".";
}
split(plop, padmatrix,//); 
split(matrix, arr, //);

for(i=1; i<=width; i++){ 
	for(j=1; j<= line; j++){
		idxarr=(i-1)*line+j;
		idxpad=(i)*(line+2)+j+1;
		padmatrix[idxpad]=arr[idxarr];
	}
}
total=0;
target[1]="";
cont=0;
run=1;
     for(j=1; j<=(size+2)*(width+2); j++){
     target[j]=padmatrix[j]; 
     }
while (cont == 0) {
     total=0;
     
     print_array(target, width+2, line+2)
	for(i=2; i<=width+1; i++){ 
		for(j=2; j<= line+1; j++){
			idxpad=(i-1)*(width+2)+j;
			if ( padmatrix[idxpad] == "."){
			       target[idxpad] = "."; 
		       	       continue;
			}	       

			count=0;
			for (k=1; k<=8; k++){
				if ( padmatrix[idxpad+nb[k]] == "@") {
				       count++;
			        }	
				
			}  
			if (count < 4) {
				total++;
				target[idxpad]=".";
			} else { 
			    target[idxpad]= "@"
		    } 
	}

     }
#     printf "\033[2J\033[H"
     totalplus += total;
     for(j=1; j<=(line+2)*(width+2); j++){
     padmatrix[j]=target[j]; 
     }
     dump_frame(run)
     run++;
     if (total == 0) { cont = 1}; 
}
print totalplus;
}
