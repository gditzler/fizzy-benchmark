#!/usr/bin/env bash 

# this script combines the data that was collected from yemins matlab files 
# containing the metahit data set. 
# __author__ = Gregory Ditzler and Calvine Morrison 
# __credits__ = Gregory Ditzler, Calvin Morrison, and Gail Rosen
# __date__ = 11/5/2013

if [ -f metahit.biom ]; then
  rm metahit.biom
fi

cat <(seq 1 124 | sed -e "s/^/Sam/g" | tr "\n" "\t" \
  | sed -e $'s/^/#OTU ID\t/g' -e $'s/\t$//g') \
  <(paste metahit-files/features.dat metahit-files/pfam.dat) \
  > metahit.otu

biom convert -i metahit.otu -o metahit.biom --table-type="otu table"

cat <(echo -e "#SampleID\tObese\tIBD") <(paste <(seq 1 124 | sed -e "s/^/Sam/g") \
  <(cat metahit-files/Obese.dat | tr "\t" "\n") <(cat metahit-files/IBD.dat \
  | tr "\t" "\n")) > metahit.map

