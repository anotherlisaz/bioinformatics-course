#!/bin/bash

read num1 num2 num3 < ~/Desktop/bio/ДЗ8/1/fin
sum=$((num1 + num2 + num3))
echo "$sum" > fout

echo "Hello, world!" >> fout

cut -c 10 ~/Desktop/bio/ДЗ8/3/fin >> fout

awk 'NR%2 == 1 {name = $0; next} $0 ~ /777/ {print name; print}' ~/Desktop/bio/ДЗ8/4/fin >> fout

(
    awk -F'\t' '$2 ~ /^[0-9]+$/ {print $0}' ~/Desktop/bio/ДЗ8/5/fin | sort -t$'\t' -k2,2n -k3,3n -k4,4n
    awk -F'\t' '$2 ~ /^[XY]$/ {print $0}' ~/Desktop/bio/ДЗ8/5/fin | sort -t$'\t' -k2,2 -k3,3n -k4,4n
) >> fout


total_chars=0

while IFS= read -r line; do
    line="${line%$'\n'}"
    
    if [[ "$line" =~ [0-9] ]] && 
       ! [[ "$line" =~ [XYxy] ]]; then

        chars=$(printf "%s" "$line" | wc -m)
        total_chars=$((total_chars + chars))
    fi
done < "/Users/vasilisazolotova/Desktop/bio/ДЗ8/6/fin1"

echo "$total_chars" >> fout

total_chars=0

while IFS= read -r line; do
    line="${line%$'\n'}"

    if [[ "$line" =~ [0-9] ]] &&
       ! [[ "$line" =~ [XYxy] ]]; then

        chars=$(printf "%s" "$line" | wc -m)
        total_chars=$((total_chars + chars))
    fi
done < "/Users/vasilisazolotova/Desktop/bio/ДЗ8/6/6.2/fin"

echo "$total_chars" >> fout

(grep -P '^1\t' clinvar_20250330.vcf | awk -F'\t' '{l=length($5)-length($4)} l>m{m=l;r=$5} END{print "Longest insertion:\n"r}'; grep -P '^2\t' clinvar_20250330.vcf | awk -F'\t' '{l=length($4)-length($5)} l>m{m=l;r=$4} END{print "Longest deletion:\n"r}') >> fout
