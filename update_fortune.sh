#!/bin/bash

for dir in $(find . -maxdepth 1 -type d -name "[a-zA-Z]*"); do
    (
        cd $dir ;
        strfile $dir ;
        echo -e "[UPDATE] Copying $dir files to fortune program.\n" ;
        sudo cp * /usr/share/games/fortunes/
    );
done

