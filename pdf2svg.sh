#!/bin/sh

find . -name "*.svg" | while read N; do
	PDFNAME="${N%.*}.pdf"
	DISPLAY= inkscape "$N" "--export-pdf=$PDFNAME"
done
