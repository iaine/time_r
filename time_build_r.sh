#!/bin/bash

start=$(date +%s)

svn checkout https://svn.r-project.org/R/trunk/ $TOP_SRCDIR

$TOP_SRCDIR/tools/rsync-recommended

mkdir -p $BUILDDIR

cd $BUILDDIR

$TOP_SRCDIR/configure --with-valgrind-instrumentation=1

make 

make check

end=$(date +%s)-start

printf '%dh:%dm:%ds\n' $((end/3600)) $((end%3600/60)) $((end%60))
