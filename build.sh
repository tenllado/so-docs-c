#!/bin/bash
documents=('../intro-c.md entorno' \
	'../intro-sistemas.md intro-sistemas' )

ndocs=${#documents[@]}

for (( i=0 ; $i<$ndocs ; i++ ))
do
	items=(${documents[$i]})
	source_file=${items[0]}
	target_file1=${items[1]}.html
	target_file2=${items[1]}.pdf
	echo "${source_file} --> ${target_file1}"
	pandoc ${source_file} -N --self-contained  --template pandoc-templates/toc-sidebarL-title.html-template.html --toc  -o ${target_file1}
	echo "${source_file} --> ${target_file2}"
	pandoc ${source_file} -N --toc  -o ${target_file2}
done

