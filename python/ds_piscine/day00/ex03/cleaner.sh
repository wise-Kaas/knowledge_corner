#!/bin/sh

#check if file path is specified
if [[ $# != 1 ]]; then
	echo "usage: ./cleaner.sh path_to_csv_file"
	exit 1
fi

head -n1 $1 > hh_positions.csv

tail -n+2 $1 | sed -r '/Senior|Middle|Junior/!s/([^,]*),([^,]*),".*",/\1,\2,"-",/' | \
	sed -r 's/([^,]*),([^,]*),".*((Senior|Middle|Junior)\/(Senior|Middle|Junior)).*",/\1,\2,"\3",/' | \
	sed -r 's/([^,]*),([^,]*),.*[^\/](Senior|Middle|Junior)[^\/]*",/\1,\2,"\3",/' >> hh_positions.csv
