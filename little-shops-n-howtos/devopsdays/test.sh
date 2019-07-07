#!/bin/bash -eu
#TODO: Verify that 'black' and 'white' do fail

color='';colors='red orange yellow green blue indigo violet'
export errors=0

for color in $colors
do
  curl "http://$color.sofree.us/" | grep "Linux Camp 2017" || errors=$(( $errors + 1 ))
done

color='rainbow'
curl "http://$color.sofree.us/" | grep "Linux Camp 2017" || errors=$(( $errors + 1 ))

echo errors=$errors
exit $errors
