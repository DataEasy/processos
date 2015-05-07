#!/usr/bin/env sh

# NOTE: Execute this file from the same dir where the *.svg and *.graphml are.

#
# Updating the links in the `.svg` files otherwise they will keep pointing
# to the `.graphml` files they came from
#

find='.graphml'
replace='.svg'

for file in *.svg; do
    sed -i '' "s/$find/$replace/g" $file

    if [ $? -ne 0 ]; then
        echo "Error updating links on svg: $file"
        exit 1
    fi
done

#
# Updating any absolute file path inside `.graphml` files to relative ones
#

rel_parent_dir='.'
abs_parent_dir=`pwd`

for file in *.graphml; do
    sed -i '' "s#$abs_parent_dir#$rel_parent_dir#g" $file

    if [ $? -ne 0 ]; then
        echo "Error updating paths on graphml: $file"
        exit 1
    fi
done

exit 0
