#!/usr/bin/env bash 

# test a few different parameter configurations of fizzy.py 
# __author__ = Gregory Ditzler
# __credits__ = Gregory Ditzler, Calvin Morrison, and Gail Rosen
# __date__ = 11/5/2013

class_col=( IBD Obese )
biom=metahit.biom
map=metahit.map
n_select=50
method=( mRMR MIM JMI ) 

for meth in ${method[@]}; do
  for col in ${class_col[@]}; do  
    echo "Running $meth with $col"
    out=sel-feats-$meth-$col.txt
    { time fizzy.py -i $biom -m $map -c $col -k $n_select -f $meth -o $out ; } 2> $out.time 
  done
done

