BEGIN {
FS = ","; 
invalid[n]=0;
sum=0;
}

{
for(i=1; i<=NF; i++) { 
	split($i, tab, "-"); 
	begin = int(tab[1]);
	end = int(tab[2]);
	for(j=begin; j<=end; j++){
		chaine =  "" j;
		longueur=length(chaine); 
                for(k=1; k <= longueur /2; k++){
			if (longueur % k == 0) {
				motif = substr(chaine, 1, k); 
				repete = "";
				for (l=0; l< longueur/k; l++) {
					repete = repete motif;

				}
			        if (chaine == repete) {
				       sum = sum + j;
				       break;
			        }	

			}
		}
	}
}

}

END {
print sum;

}
