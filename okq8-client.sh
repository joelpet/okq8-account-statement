#!/bin/bash

read -p "User: " user
read -s -p "Password: " password

echo

casperjs ./scraper/okq8-scraper.js --user="$user" --password="$password"

if [ $? -ne 0 ]; then
    echo "Scraper failed"
    exit
fi

pdftotext -layout statement.pdf

if [ $? -ne 0 ]; then
    echo "pdftotext failed"
    exit
fi

grep -A 1 -E "^[0-9]{6}" statement.txt | sed -f fix_date.sed
