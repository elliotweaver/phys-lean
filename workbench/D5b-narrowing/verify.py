from fractions import Fraction as F
d=F(16,3)
la,lb=F(8),F(41,5); pa,pb=F(5,16),F(1,3)
lo = 190/F(3)+(d/3)*la*pa; hi = 190/F(3)+(d/3)*lb*pb
print('bare lo',lo,'=',float(lo),'  hi',hi,'=',float(hi),'  width',hi-lo,'=',float(hi-lo))
dlo=74+(d/2)*la*pa; dhi=74+(d/2)*lb*pb
print('dressed lo',dlo,'=',float(dlo),'  hi',dhi,'=',float(dhi))
old_lo=190/F(3)+F(80,153); old_hi=190/F(3)+F(180,7)
print('D5 old bracket [',float(old_lo),',',float(old_hi),'] width',float(old_hi-old_lo))
print('nested? old_lo<=new_lo:',old_lo<=lo,'  new_hi<=old_hi:',hi<=old_hi)
print('new width < old width:', (hi-lo) < (old_hi-old_lo), ' =', hi-lo, '<', old_hi-old_lo)
print('cutPi nested? 14/5<=3:',F(14,5)<=3,'  16/5<=17/5:',F(16,5)<=F(17,5))
print('1/cutPi nested? 5/17<=5/16:',F(5,17)<=F(5,16),'  1/3<=5/14:',F(1,3)<=F(5,14))
