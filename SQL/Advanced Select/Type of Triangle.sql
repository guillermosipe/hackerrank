/* MySQL */
select if(A+B<=C or A+C<=B OR B+C<=A,"Not A Triangle",if((A=B and B=C),"Equilateral",if((A=B and B!=C) or (A=C AND B!=C) or (B=C and B!=A),"Isosceles","Scalene"))) from TRIANGLES;
