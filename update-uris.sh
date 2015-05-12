#!/usr/bin/env bash
shopt -s globstar

#
# Updating the links in the `.svg` or `.graphml` files otherwise they will keep pointing
# to the `.graphml` files they came from
#
updateLinks () {
    find='.graphml'
    replace='.svg'
    currentDirectory='./'

    for file in **/*$1; do

        sed -i "s/$find/$replace/g" $file 
        echo $1
        if [ $? -ne 0 ]; then
           echo "Error updating links on.svg: $file"
           exit 1
        fi

    done
}

#
# Updating any absolute file path inside files to relative ones
#
updatePath () {
    relFolder='.'
    absFolder=''

    for file in **/*$1; do
        folder=`dirname $file`
        absFolder=$(cd ${file%/*}; pwd)
        sed -i "s#$absFolder#$relFolder#g" $file
        echo $1
        if [ $? -ne 0 ]; then
            echo "Error updating paths on graphml: $file"
            exit 1
        fi

    done
}

updateLinks ".svg"
updatePath ".graphml"
updatePath ".svg"

exit 0
