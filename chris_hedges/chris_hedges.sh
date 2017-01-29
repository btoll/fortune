#!/bin/bash

for i in {1..6}
do
    curl https://www.goodreads.com/author/quotes/15438.Chris_Hedges?page=$i |
    awk '/quoteText/{getline; print}' |
    # https://www.mikeplate.com/2012/05/09/extract-regular-expression-group-match-using-grep-or-sed/
    grep -Po '(?<=&ldquo;).+(?=&rdquo;)' |
    # After each line, print a new line, file attribution, a new line and the '%' char on its own line (which the fortune program needs).
    awk '{print $0"\n\t\t-- Chris Hedges\n%"}' >> chris_hedges
done

# Make the chris_hedges.dat file/db needed by the fortune program.
# Last step is to move both new files to /usr/share/games/fortunes
strfile chris_hedges

