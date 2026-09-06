#!/bon/bash
v=11

AND 
-a  

OR  
-o

not
!

[ -n $v   -a $v -gt 23 ]   && echo "both tests are true" || echo "not all tests are true"

[ -n $v ] && echo "both tests are true" || echo "not all tests are true"
[ $v -gt 23 ] && echo "both tests are true" || echo "not all tests are true"



v=24

[ -n $v   -a  $v -gt 23 ] && echo "both tests are true" || echo "not all tests are true"
[ -n "$v" -a "$v" -gt 23 ] && echo "both tests are true" || echo "not all tests are true"
echo $v