BEGIN{
FS="-"
count = 1
mode= "paires"
fresh=0;

}

NF == 0 {
	next
}

mode == "paires" && NF == 2 {
    duplicate = 0
    for (i = 1; i <= sorted_count; i++) {
        if (sorted_pairs[i][1] == $1 && sorted_pairs[i][2] == $2) {
            duplicate = 1
            break
        }
    }
    
    if (!duplicate) {
        inserted = 0
        for (i = 1; i <= sorted_count; i++) {
            if ($1 < sorted_pairs[i][1]) {
                for (j = sorted_count; j >= i; j--) {
                    sorted_pairs[j+1][1] = sorted_pairs[j][1]
                    sorted_pairs[j+1][2] = sorted_pairs[j][2]
                }
                sorted_pairs[i][1] = $1
                sorted_pairs[i][2] = $2
                inserted = 1
                break
            }
        }
        
        if (!inserted) {
            sorted_count++
            sorted_pairs[sorted_count][1] = $1
            sorted_pairs[sorted_count][2] = $2
        } else {
            sorted_count++
        }
    }    
    next
}


END {
    
    overlap[1][1]=sorted_pairs[1][1];
    overlap[1][2]=sorted_pairs[1][2];
    countoverlap=1;
    for (i =2; i <= sorted_count; i++) {
            if ( overlap[countoverlap][2] < sorted_pairs[i][1]) {
		    countoverlap++;
		    overlap[countoverlap][1]= sorted_pairs[i][1];
		    overlap[countoverlap][2]= sorted_pairs[i][2];
		    continue;
	    }
            if ( overlap[countoverlap][2] > sorted_pairs[i][2]) {
		    continue;
		    } 
            if ( overlap[countoverlap][2] < sorted_pairs[i][2]) {
		    overlap[countoverlap][2]= sorted_pairs[i][2];
		    continue;
	    }

	    }
    result=1;
    for (k=1; k<= countoverlap; k++){
	result = result + overlap[k][2] - overlap[k][1] +1; 
    }
    print result;
}

