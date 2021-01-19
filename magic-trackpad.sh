#!/usr/bin/env bash
# $HOME/bin/natural_scrolling
id=`xinput list | grep -i "Apple Inc. Magic Trackpad 2" | cut -d'=' -f2 | cut -d'[' -f1`
echo "Mouse ID $id"

natural_scrolling_id=`xinput list-props ${id} | \
                      grep -i "Natural Scrolling Enabled (" \
                      | cut -d'(' -f2 | cut -d')' -f1`
echo "Natural scrolling ID ${natural_scrolling_id}"

ctm=`xinput list-props ${id} | \
                      grep -i "Coordinate Transformation Matrix" \
                      | cut -d'(' -f2 | cut -d')' -f1`
echo "CTM ${ctm}"

#ctm = Coordinate Transformation Matrix
xinput --set-prop $id ${natural_scrolling_id} 1
xinput --set-prop $id ${ctm} 2 0 0 0 2 0 0 0 2
