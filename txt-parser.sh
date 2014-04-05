#!/bin/sh

sed -f format_dates.sed <statement.txt \
    | tee statement-1.txt \
    | grep -f transaction_lines.grep -A 1 -E \
    | tee statement-2.txt \
    | sed -f clean.sed \
    | tee statement-3.txt \
    | awk -f to_csv.awk \
    | tee statement.csv
