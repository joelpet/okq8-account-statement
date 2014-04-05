BEGIN {
    FS = "  +";
    prev_date = "";
    prev_desc = "";
    prev_amount = "";
}
/^2014/ {
    if (NR > 1) {
        print prev_date";", prev_desc";", prev_amount
    }
    if (NF >= 8) {
        prev_date = $1
        prev_desc = $2 " " $3
        prev_amount = $NF
    } else if (NF >= 2) {
        prev_date = $1
        prev_desc = $2
        prev_amount = $NF
    }
}
/^[[:space:]]+[^[:space:]]*$/ {
    prev_desc = prev_desc " " $NF
}
END {
    print prev_date";", prev_desc";", prev_amount
}
