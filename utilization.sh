#!/bin/bash

file=$1
#line= `tail +6 $file|head -n 1`
num=67
sum=0
count=0

numLines=`wc -l 'perfdata.txt' | cut -d ' ' -f 1`


for ((  num = 7 ;  num <= $numLines;  num = num + 18  ))
do
line=`sed -n ${num}p $file`
idle=`echo $line | cut -d " " -f  9`
num1=`expr 100 - $idle`
#echo $num1
sum=`expr $sum + $num1`
count=`expr $count + 1`
done

#echo "Sum is: "
#echo "$sum"
#echo "Count is: "
#echo $count
#num=`expr $num1 + $num2 + $num3 + $num4 + $num5 + $num6 + $num7 + $num8 + $num9 + $num10 + $num11`
echo "Utilization is : "
echo "scale=2; $sum / $count " | bc
