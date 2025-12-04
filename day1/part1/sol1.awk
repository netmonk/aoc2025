#!/usr/bin/env awk 
#
#
# $0 est la ligne entière.
BEGIN { 
	pos=1000000+50; 
	countb=0;
	counta=0;
	print "initial pos: " , pos;
	i=0;
}
{
    lettre = substr($0, 1, 1);
    
    nombre = substr($0, 2);
    nombre = int(nombre); 
    for(i = 0; i<nombre; i++) {
         if (lettre == "L" ) { 
     	    pos--
         }  
	 else { 
     	    pos++
         }
         if ((pos % 100) == 0) { countb++}   
    }
         if ((pos %100 ) == 0) { counta++}   
}

END {
	print "solution #1: ", counta; 
	print "Solution #2: ", countb; 
	
}
