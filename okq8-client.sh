#!/bin/bash

read -p "User: " user
read -s -p "Password: " password

echo -e "\nPlease wait..."

casperjs ./scraper/okq8-scraper.js --user="$user" --password="$password"

if [ $? -ne 0 ]; then
    echo "Scraper failed"
    exit
fi

pdftotext -layout statement.pdf
