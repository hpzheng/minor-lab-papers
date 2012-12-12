#! /bin/bash

CONFIG=/path/to/tidy_options.conf
rm -rf     $2
mkdir -p $2

for F in `find $1 -type f -name "*.doc" -or -name "*.odt"`
        do
        BASE=`basename $F .doc` ; BASE=`basename $BASE .odt`
        soffice --headless --convert-to htm:HTML --outdir $2 $F
        tidy -q -config $CONFIG -f $2/$BASE.err -i $2/$BASE.htm | sed 's/ class="c[0-9]*"//g' > $2/$BASE.html
        done
