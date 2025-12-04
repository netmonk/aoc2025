BEGIN {

}

{
max=0;
	split($0, tableau,//);
	n=length(tableau); 
	for(i=1; i<=n; i++) {
		for(j=i+1; j <=n; j++){
			if (int(tableau[i]tableau[j]) > max){
				max=int(tableau[i]tableau[j])
		        }
	        }
        } 
	total += max
}

END {
print total
}
