from fractions import Fraction as F
wLo=F(1414213,10**6); pLo=F(975410084,10**9)
prod=wLo*pLo
print("wLo*pLo_sharp =",float(prod))
print("137943816/1e8 =",float(F(137943816,10**8)))
print("137943816/1e8 <= wLo*pLo_sharp?", F(137943816,10**8)<=prod)
# upper
wHi=F(1414214,10**6); pHi=F(975410086,10**9)
prodH=wHi*pHi
print("wHi*pHi_sharp =",float(prodH))
print("wHi*pHi_sharp <= 137943818/1e8?", prodH<=F(137943818,10**8), float(F(137943818,10**8)))
# wr
rLo=F(381740084,10**9); rHi=F(381740101,10**9)
print("wLo*rLo =",float(wLo*rLo)," 53986200/1e8=",float(F(53986200,10**8))," <=?",F(53986200,10**8)<=wLo*rLo)
print("wHi*rHi =",float(wHi*rHi)," <=53986204/1e8?",wHi*rHi<=F(53986204,10**8))
