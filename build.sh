#!/bin/bash
documents=('../entorno.md entorno' \
	'../intro-c.md intro-sistemas' \
    '../api_ficheros_directorios.md api-ficheros-directorios')

ndocs=${#documents[@]}

## Clone image directory
if [ -d img ]; then
	rm -rf img
fi

cp -rf ../img .

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


rm -rf img
