BEGIN {
fullsize=0;
str="";
line=0; 
}

{ 
stxr= stxr $0; 
line++
}

END { 
	spl=0;
	split(stxr, arr, //)
	fullsize=length(arr);
	row= fullsize/line;
	print "taille max "fullsize" nbr de lignes "line" nbr col "row; 
	for(i=1; i<=fullsize; i++) {
		printf "%s", arr[i];
		if ( i%15 ==0) print ""; 
		if (arr[i] == "S" ) arr[i+row] = "|"; 
		if (arr[i] == "|" && arr[i+row] != "^") arr[i+row] = "|"; 
		if (arr[i] == "^" && arr[i-row] == "|" ) { arr[i+row-1] = "|"; arr[i+row+1] = "|"; spl++}; 
	}
	print "nombre de split "spl; 
}
