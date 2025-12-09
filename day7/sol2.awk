BEGIN {
str="";

}
{
split($0,arr, //) 
for (i=1; i<=length(arr); i++){ 
     if (arr[i]=="S") sum[i]=1; 
     if (arr[i]=="^") { 
	     sum[i-1]=sum[i-1]+sum[i]; 
	     sum[i+1]=sum[i+1]+sum[i] ; 
	     sum[i]=0
     } 

}
}

END { 
    	for (i=1; i<=length(sum);i++) 
    		total= total + sum[i];
    	printf("%s\n", total);
}
