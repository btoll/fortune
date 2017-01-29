#!/bin/bash
# Example URL:
#
#       https://www.goodreads.com/author/quotes/7084.Karl_Marx
#
# Note that this will attempt to download 30 pages. This should satisfy most requirements, but if not will need to be manually adjusted.
#

if [ $# -lt 2 ]; then
    echo "$(tput setaf 1)[ERROR]$(tput sgr0) Not enough arguments."
    echo "Usage: $0 <person> <url>"
    exit 1
fi

# Lowercase and replace all spaces with an underscore.
UNDERSCORED=$(echo "$1" | awk '{print tolower($0)}' | tr \  _)

for i in {1..30}
do
    curl "$2?page=$i" |
    awk '/quoteText/{getline; print}' |
    # https://www.mikeplate.com/2012/05/09/extract-regular-expression-group-match-using-grep-or-sed/
    grep -Po '(?<=&ldquo;).+(?=&rdquo;)' |
    # After each line, print a new line, quote attribution, a new line and the '%' char on its own line (which the fortune program needs).
    awk '{print $0"\n\t\t-- '"$1"'\n%"}' >> $UNDERSCORED
done

# Make the .dat file/db needed by the fortune program.
# Last step is to move both new files to /usr/share/games/fortunes
strfile $UNDERSCORED

