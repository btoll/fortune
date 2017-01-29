#!/bin/bash

for i in {1..21}
do
    curl https://www.goodreads.com/author/quotes/10427.James_Baldwin?page=$i |
    awk '/quoteText/{getline; print}' |
    # https://www.mikeplate.com/2012/05/09/extract-regular-expression-group-match-using-grep-or-sed/
    grep -Po '(?<=&ldquo;).+(?=&rdquo;)' |
    # After each line, print a new line, file attribution, a new line and the '%' char on its own line (which the fortune program needs).
    awk '{print $0"\n\t\t-- James Baldwin\n%"}' >> james_baldwin
done

# Make the james_baldwin.dat file/db needed by the fortune program.
# Last step is to move both new files to /usr/share/games/fortunes
strfile james_baldwin

