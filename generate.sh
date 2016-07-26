#!/bin/bash

rm *Light.html
rm *Light.scss
rm *Light.css

# stylesheets
echo "copying scss files..."
for scss in *.scss
do
    if [ $scss != *"colors.scss"* ];
    then
    CSS="${scss%.scss}.css"
    sass $scss $CSS
    fi

    if [ $scss != *"colors.scss"* ] && [ $scss != *"Light.scss"* ];
    then
    LIGHT="${scss%.scss}Light.scss"
    cp -v $scss $LIGHT

    sed -i 's/base03/base3/g' $LIGHT
    sed -i 's/base2/base02/g' $LIGHT

    # generate css
    echo "generating light stylesheets"
    LIGHTCSS="${LIGHT%.scss}.css"
    sass $LIGHT $LIGHTCSS
    fi
done

# html pages
for html in *.html
do
    if [ $html != *"Light.html"* ];
    then
        LIGHT="${html%.html}Light.html"
        cp -v $html $LIGHT
    sed -i 's/style.css/styleLight.css/g' $LIGHT
    sed -i 's/indexLight.html/index.html/g' $LIGHT
    sed -i 's/btnLight/btnDark/g' $LIGHT
    fi
done
