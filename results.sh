#!/usr/bin/env bash 

# print out the test results from the metahit data set; also print the run times
# __author__ = Gregory Ditzler
# __credits__ = Gregory Ditzler, Calvin Morrison, and Gail Rosen
# __date__ = 12/11/2013

echo "Top ten IBD features for JMI, MIM, mRMR"
paste sel-feats-*-IBD.txt | head -10 | tr "\t" "&" | sed -e "s/&/ & /g" -e 's/$/ \\\\/g'

echo -e "\nTop ten Obese features for JMI, MIM, mRMR"
paste sel-feats-*-Obese.txt | head -10 | tr "\t" "&" | sed -e "s/&/ & /g" -e 's/$/ \\\\/g'

echo " "

for f in `find *.time`; do
  times=`cat $f | grep "real" | tr '\t' ' ' | cut -d ' ' -f 2`
  echo $f - $times 
done
