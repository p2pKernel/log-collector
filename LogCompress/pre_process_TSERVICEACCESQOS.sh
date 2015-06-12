#! /bin/awk

awk -F'|' '{for(i=3; i<NF; i++) printf("%s|", $i); printf("\n");}' $1