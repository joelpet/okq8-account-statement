#!/bin/sed -f
s/^\(1[[:digit:]]\)\([0|1][[:digit:]]\)\([0-2][[:digit:]]\)/20\1-\2-\3/g
s/Forts. nästa sida//
