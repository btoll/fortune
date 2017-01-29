#!/bin/bash

for i in {1..17}
do
    curl https://www.goodreads.com/author/quotes/2476.Noam_Chomsky?page=$i |
    awk '/quoteText/{getline; print}' |
    # https://www.mikeplate.com/2012/05/09/extract-regular-expression-group-match-using-grep-or-sed/
    grep -Po '(?<=&ldquo;).+(?=&rdquo;)' |
    # After each line, print a new line, file attribution, a new line and the '%' char on its own line (which the fortune program needs).
    awk '{print $0"\n\t\t-- Noam Chomsky\n%"}' >> noam_chomsky
done

# Make the noam_chomsky.dat file/db needed by the fortune program.
# Last step is to move both new files to /usr/share/games/fortunes
strfile noam_chomsky

