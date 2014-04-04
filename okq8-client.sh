#!/bin/bash

read -p "User: " user
read -s -p "Password: " password

casperjs ./scraper/okq8-scraper.js --user="$user" --password="$password"
