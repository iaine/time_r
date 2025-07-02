#!/bin/bash

start1=$(date +%s)

svn checkout https://svn.r-project.org/R/trunk/ $TOP_SRCDIR

echo "build rsync-recommended"
start=$(date +%s)
$TOP_SRCDIR/tools/rsync-recommended
end=$(date +%s)-start
printf 'build rsync-recommended -> %dh:%dm:%ds\n' $((end/3600)) $((end%3600/60)) $((end%60)) > /workspaces/r-dev-env/times.txt

mkdir -p $BUILDDIR

cd $BUILDDIR

echo "configure"
start=$(date +%s)
$TOP_SRCDIR/configure --with-valgrind-instrumentation=1 
end=$(date +%s)-start
printf 'configure -> %dh:%dm:%ds\n' $((end/3600)) $((end%3600/60)) $((end%60)) >> /workspaces/r-dev-env/times.txt

echo "make"
start=$(date +%s)
make
end=$(date +%s)-start
printf 'make -> %dh:%dm:%ds\n' $((end/3600)) $((end%3600/60)) $((end%60)) >> /workspaces/r-dev-env/times.txt

echo "make check"
start=$(date +%s)
make check
end=$(date +%s)-start
printf 'make check -> %dh:%dm:%ds\n' $((end/3600)) $((end%3600/60)) $((end%60)) >> /workspaces/r-dev-env/times.txt

end1=$(date +%s)-start1
printf '%dh:%dm:%ds\n' $((end1/3600)) $((end1%3600/60)) $((end1%60)) >> /workspaces/r-dev-env/times.txt
