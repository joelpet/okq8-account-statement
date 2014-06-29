BEGIN {
    FS = "  +";
    prev_date = "";
    prev_desc = "";
    prev_amount = "";
    print "Datum; Beskrivning; Belopp (Uttag + / Inbetalningar -)"
}
# Start of new transaction
/^2014/ {
    # Flush previous transaction when encountering a new one, for all but first
    if (NR > 1) {
        print prev_date";", prev_desc";", prev_amount
    }
    # OKQ8 petrol transaction
    if (NF >= 8) {
        prev_date = $1
        prev_desc = $2 " " $3
        prev_amount = $NF
    }
    # Other transaction
    else if (NF >= 2) {
        prev_date = $1
        prev_desc = $2
        prev_amount = $NF
    }
}
# Continuation line
/^[[:space:]]/ {
    if (NF >= 7) {
        prev_amount = $NF
        prev_desc = prev_desc " " $2
    } else {
        prev_desc = prev_desc " " $NF
    }
}
END {
    print prev_date";", prev_desc";", prev_amount
}
