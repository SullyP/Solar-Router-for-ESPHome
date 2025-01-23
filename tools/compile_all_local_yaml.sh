for iloop in $(ls *.yaml | grep -v secrets | grep -v work_in_progress | grep -v proof-of-concept); do
   echo
   echo "#########################################"
   echo Compiling $iloop
   python ./tools/convert_to_local_source.py --ci $iloop && esphome config work_in_progress.yaml || exit 1
done

for iloop in $(ls *.yaml | grep -v secrets | grep -v work_in_progress | grep -v proof-of-concept); do
   echo
   echo "#########################################"
   echo Compiling $iloop
   python ./tools/convert_to_local_source.py --ci $iloop && esphome compile work_in_progress.yaml || exit 1
done