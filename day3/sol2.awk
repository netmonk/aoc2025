BEGIN {
}

{
maxjolt=0;
maxdx=0;
powerbat=12;
max=0;
	
        split($0, tableau,//);
	n=length(tableau); 
	
	for(i=1; i<=powerbat; i++) {

		maxdx++;
		max=tableau[maxdx];
                offset= powerbat -i-1 ; 
		for(j=maxdx +1 ; j < n -offset ; j++){
			if (int(tableau[j]) > max){
				max=int(tableau[j]);
				maxdx=j;
		        }
	        }
	maxjolt=10*maxjolt+max;
        } 
	total += maxjolt
}

END {
print total
}
