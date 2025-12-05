

BEGIN {
matrix=""
line=0
}

{
matrix= matrix $0;
line++;
}

END {
size = length(matrix);
print "full length: "  size;
print "number of line: " line;
print "number of row: " size/line;
width= size/line; 
total=0;
split(matrix, arr, //);
target[1]="";
cont=0;
run=1;
while (cont == 0) {
     total=0;
     print "run number: ", run 	
     for(i=1; i <= size; i++) {
     count=0;
        if ( arr[i] == ".") {target[i]="."; continue;} 
        if ( i == 1) {
        	if (arr[i+1] == "@") count++;
        	if (arr[i + width] == "@") count++;
        	if (arr[i + width + 1] == "@") count++;
        	#print "inex, count: " i, count;
        	if (count < 4) {total++; target[i]=".";} else { target[i]="@"} 
        	continue;
        }	
        if ( i == size) {
        	if (arr[i-1] == "@") count++;
        	if (arr[i - width] == "@") count++;
        	if (arr[i - width - 1] == "@") count++;
        	#print "inex, count: " i, count;
        	if (count < 4){ total++; target[i]=".";} else { target[i]="@"}
        	continue;
        }	
        if ( i == width) {
        	if (arr[i-1] == "@") count++;
        	if (arr[i + width] == "@") count++;
        	if (arr[i + width - 1] == "@") count++;
        	#print "inex, count: " i, count;
        	if (count < 4){ total++; target[i]=".";} else { target[i]="@"}
        	continue;
        }	
        if (i == (size - width +1)) {
        	if (arr[i+1] == "@") count++;
        	if (arr[i - width] == "@") count++;
        	if (arr[i - width + 1] == "@") count++;
        	#print "inex, count: " i, count;
        	if (count < 4){ total++; target[i]=".";} else { target[i]="@"}
        	continue;
        }	
        if (i < width) {
        	if (arr[i-1] == "@") count++;
        	if (arr[i+1] == "@") count++;
        	if (arr[i + width] == "@") count++;
        	if (arr[i + width + 1] == "@") count++;
        	if (arr[i + width - 1] == "@") count++;
        	#print "inex, count: " i, count;
        	if (count < 4){ total++; target[i]=".";} else { target[i]="@"}
        	continue;
        }	
        if (i > (size - width )) {
        	if (arr[i-1] == "@") count++;
        	if (arr[i+1] == "@") count++;
        	if (arr[i - width] == "@") count++;
        	if (arr[i - width + 1] == "@") count++;
        	if (arr[i - width - 1] == "@") count++;
        	#print "inex, count: " i, count;
        	if (count < 4){ total++; target[i]=".";} else { target[i]="@"}
        	continue;
        }	
        if ( (i % width == 1) && i > width && i < (size-width)) {
        	if (arr[i+1] == "@") count++;
        	if (arr[i - width] == "@") count++;
        	if (arr[i - width + 1] == "@") count++;
        	if (arr[i + width ] == "@") count++;
        	if (arr[i + width +1 ] == "@") count++;
        	#print "inex, count: " i, count;
        	if (count < 4){ total++; target[i]=".";} else { target[i]="@"}
        	continue;
       }
        if ( (i % width == 0) && i > width && i <= (size-width)) {
        	if (arr[i-1] == "@") count++;
        	if (arr[i - width] == "@") count++;
        	if (arr[i - width - 1] == "@") count++;
        	if (arr[i + width ] == "@") count++;
        	if (arr[i + width -1 ] == "@") count++;
        	#print "inex, count: " i, count;
        	if (count < 4){ total++; target[i]=".";} else { target[i]="@"}
        	continue;
       }
        if ( (i % width > 1) && i > width && i < (size-width)) {
        	if (arr[i-1] == "@") count++;
        	if (arr[i+1] == "@") count++;
        	if (arr[i - width] == "@") count++;
        	if (arr[i - width - 1] == "@") count++;
        	if (arr[i - width + 1] == "@") count++;
        	if (arr[i + width ] == "@") count++;
        	if (arr[i + width -1 ] == "@") count++;
        	if (arr[i + width +1 ] == "@") count++;
        	#print "inex, count: " i, count;
        	if (count < 4){ total++; target[i]=".";} else { target[i]="@"}
        	continue;
       }
     }
     print total;
     totalplus += total;
     for(j=1; j<=size; j++){
     arr[j]=target[j]; 
     }
     run++;
     if (total == 0) { cont = 1}; 
}
print totalplus;
}
