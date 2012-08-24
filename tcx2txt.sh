#!/bin/bash

input=$1
output=$(basename $input .tcx).txt

cat $input | grep "<Position>" -A3 | grep Degrees | grep Latitu | sed "s:[a-zA-Z></]::g" | sed "s/ //g" | sed "s/$/ /g" | perl -ne 'chomp and print'   > $output

echo " " >> $output

cat $input | grep "<Position>" -A3 | grep Degrees | grep Long | sed "s:[a-zA-Z></]::g" | sed "s/ //g" | sed "s/$/ /g" | perl -ne 'chomp and print'  >> $output

echo " " >> $output