These are random fortune files found on the Internet.  They are not mine.

1. Create a fortune database:

        $ strfile -c % calvin calvin.dat

2. Install the files:

        $ sudo cp calvin* /usr/share/game/fortune

3. Pipe to `cowsay` for even more laughs:

        $ fortune -e | cowsay -W 60 -f stegosaurus

> For more cows:
>
>       $ ls /usr/share/cowsay/cows

