aa=11
bb=22

# expre 数值运算工具
dd=$(expr $aa + $bb )  #  + 两边必须有空格 
echo $dd

# let 数值运算工具
let c=aa+bb   #  比expr 方便，但其实当地也非主流，主流是以下两种：
echo $c


# 双小括号和中括号
ff=$(( $aa+$bb ))  
echo $ff
gg=$[ $aa+$bb ] 
echo $gg


# 这种方法最大的好处就是各个空格自由，比如以下的变化

ff=$(( $aa + $bb ))  
echo $ff

gg=$[$aa+$bb] 
echo $gg

# 运算优先级

# 逻辑 “与”      
cc=$((1 && 0)) # ||  logical "or"
echo $cc

