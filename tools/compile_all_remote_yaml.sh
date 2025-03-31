for iloop in $(ls *.yaml | grep -v secrets | grep -v work_in_progress | grep -v proof-of-concept); do
   echo
   echo "#########################################"
   echo Compiling $iloop
   esphome config $iloop || exit 1
done

for iloop in $(ls *.yaml | grep -v secrets | grep -v work_in_progress | grep -v proof-of-concept); do
   echo
   echo "#########################################"
   echo Compiling $iloop
   esphome compile $iloop || exit 1
done
   