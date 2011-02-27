#!/bin/sh
# get the PhoneGapLib version
export pgver=`head -1 ${PHONEGAPLIB}/VERSION`

# compile and copy PhoneGapLib
make -C "${PHONEGAPLIB}"
echo cp ${PHONEGAPLIB}/javascripts/phonegap.*.js ${PROJECT_DIR}/www
cp ${PHONEGAPLIB}/javascripts/phonegap.*.js ${PROJECT_DIR}/www

# replace [src="phonegap.js"] in all files in www
find ${PROJECT_DIR}/www | xargs grep 'src[ 	]*=[ 	]*[\\'\"]phonegap.*.*.js[\\'\"]' -sl | xargs -L1 sed -i "" "s/src[ 	]*=[ 	]*[\\'\"]phonegap.*.*.js[\\'\"]/src=\"phonegap.${pgver}.min.js\"/g"
