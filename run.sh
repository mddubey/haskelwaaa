ghc -o $1 $1.hs
./$1 ${@:2}
rm $1
rm $1.hi
rm $1.o