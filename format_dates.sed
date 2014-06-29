#!/bin/sed -f
# Convert dates on YYMMDD format to YYYY-MM-DD
s/^\(1[[:digit:]]\)\([0|1][[:digit:]]\)\([0-3][[:digit:]]\)/20\1-\2-\3/g
