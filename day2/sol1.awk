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
		middle=length(j)/2;
		part1=substr(j, 1, middle);
		part2=substr(j, middle+1);
		if (part1 == part2) { sum=sum+j}
	}
}

}

END {
print sum;

}
