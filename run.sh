#!/bin/bash
### made by rayman@rhems-japan.co.jp

_tmp_dir=/root/tmp-dir
_tag_name=${TAG}
_imgname=${IMG}
_org_image=${_tmp_dir}/${_imgname}
_corner=corner.png
_bar=bar.png
_sealname=${SLN}





if [ ${_sealname} = "rhems-bar.png" ]; then
    ## create tmp dir
    mkdir -p ${_tmp_dir}


    convert ${_sealname} -resize 128x128 ${_bar}-resize.png
    convert -resize 105x105! ${_org_image} ${_imgname}-fit.png
    convert ${_imgname}-fit.png -gravity North -extent 128x128 ${_imgname}-resize.png
    convert ${_imgname}-resize.png -bordercolor "#ff0000" -border 1 ${_imgname}-frame.png
    convert ${_imgname}-frame.png ${_bar}-resize.png -gravity  South -compose over -composite `echo ${_imgname} | cut -d '.' -f 1`-iconmaker.png
    mv -i `echo ${_imgname} | cut -d '.' -f 1`-iconmaker.png ${_tmp_dir}
    echo "## add bar"

else
    ## create tmp dir
    mkdir -p ${_tmp_dir}

    if [ ${#_tag_name} -lt 4 ]; then
    convert -pointsize 15 -gravity East -font ./omaner.ttf -fill white -annotate 48x45+7x25 "${_tag_name}" ${_sealname} ${_corner}
    elif [ ${#_tag_name} -lt 6 ]; then
    convert -pointsize 9 -gravity East -font ./omaner.ttf -fill white -annotate 48x45+7x25 "${_tag_name}" ${_sealname} ${_corner}
    else
    convert -pointsize 5 -gravity East -font ./omaner.ttf -fill white -annotate 48x45+7x25 "${_tag_name}" ${_sealname} ${_corner}
    fi
    convert -resize 119x119! ${_org_image} ${_imgname}-fit.png
    convert ${_imgname}-fit.png -gravity center -extent 128x128 ${_imgname}-resize.png
    convert ${_imgname}-resize.png -shave 3x3 -bordercolor "#ff0000" -border 3 ${_imgname}-frame.png
    convert ${_imgname}-frame.png ${_corner} -gravity  NorthEast -compose over -composite `echo ${_imgname} | cut -d '.' -f 1`-iconmaker.png
    mv -i `echo ${_imgname} | cut -d '.' -f 1`-iconmaker.png ${_tmp_dir}
    echo "## add corner"
fi