#!/bin/bash

for i in {1..22}
do
    curl https://www.goodreads.com/author/quotes/1214964.Ta_Nehisi_Coates?page=$i |
    awk '/quoteText/{getline; print}' |
    # https://www.mikeplate.com/2012/05/09/extract-regular-expression-group-match-using-grep-or-sed/
    grep -Po '(?<=&ldquo;).+(?=&rdquo;)' |
    # After each line, print a new line, file attribution, a new line and the '%' char on its own line (which the fortune program needs).
    awk '{print $0"\n\t\t-- Ta-Nehisi Coates\n%"}' >> ta-nehisi_coates
done

# Make the ta-nehisi_coates.dat file/db needed by the fortune program.
# Last step is to move both new files to /usr/share/games/fortunes
strfile ta-nehisi_coates

