#!/bin/sh

find . -name "*.svg" | while read N; do
	PDFNAME="${N%.*}.pdf"
	echo "Converting $N to $PDFNAME"
	DISPLAY= inkscape "$N" "--export-pdf=$PDFNAME"
done
