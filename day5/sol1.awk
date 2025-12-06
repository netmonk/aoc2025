BEGIN{
FS="-"
count = 1
nb_count = 1
mode= "paires"
fresh=0;
}


NF== 0 {
       mode = "nombres"
       next       
}
mode == "paires" && NF == 2 {
    pairs[count][1] = $1
    pairs[count][2] = $2
    count++
}

mode == "nombres" && NF == 1 {
    nombres[nb_count] = $1
    nb_count++
}

END {
fresh=0;
    for (i = 1; i < nb_count; i++) {
	    cont = 0; 
	    for (j=1; j < count; j++){
		    if ( nombres[i] >= pairs[j][1] && nombres[i] <= pairs[j][2]  && cont == 0 ) { 
			    fresh++;
			    cont = 1;
			    } 
    }

}
print fresh
}
