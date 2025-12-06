BEGIN {
count=0;
result=0;
	}


{
	++count;
	for(i=1; i<=NF; i++) { sheet[i][count]=$i }
}

END{ 
	print count;
	for(j=1; j <= length(sheet); j++){
		# print sheet[j][count]
		if (sheet[j][count] == "+") { 
			print "operation +"
			for (h=1; h<count; h++){
				result = result + sheet[j][h] ;
		i	}
		}
		if (sheet[j][count] == "*") { 
#			print "operation *"
			temp=1
			for (h=1; h<count; h++){
				temp= temp * sheet[j][h] ;
			}
			result=result+temp;
		}
	}
	print result;
}
