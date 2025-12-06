BEGIN {
count=0;
result=0;
countidx=1;
	}


{
	++count;
	n=split($0, chars,"");
	for(i=1; i<=n; i++) { 
		sheet[i][count]=chars[i] 
	}
}

END{ 
	for (j=1; j<= length(sheet); j++){
		if (sheet[j][count]=="+" || sheet[j][count]=="*"){
			opidx[countidx]=j;
			countidx++;
		}
		opidx[countidx+1]=length(sheet)+1;
	}
	for(i=1; i<length(opidx); i++) {
	      a=1;
	      plop=1;
              for(j=opidx[i]; j < opidx[i+1] ; j++){
               		str=""
               		for(k=1; k<count;k++){
               			str = str""sheet[j][k];
               		}
			if (int(str) > 0){
			temp[a]=int(str);
			a++
		        }
		}
		ind=int(opidx[i]);
                if (sheet[ind][count] == "+") {
			for(h=1; h<a; h++) {
			    result = result + temp[h];
			}
		}
		if (sheet[ind][count] == "*") {
			for(h=1; h<a; h++) {
				plop= plop * temp[h];
			}
			result = result+plop;
		}
	}
	print "result= ",result
   }
