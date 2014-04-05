#!/bin/bash

pdftotext -layout statement.pdf - \
    | tee /tmp/statement-1.txt \
    | sed -f format_dates.sed \
    | tee /tmp/statement-2.txt \
    | grep -f transaction_lines.grep -A 1 -E \
    | tee /tmp/statement-3.txt \
    | sed -f clean.sed \
    | tee /tmp/statement-4.txt \
    | awk -f to_csv.awk \
    | tee statement.csv
