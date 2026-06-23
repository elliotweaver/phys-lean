#!/usr/bin/env python3
# Is my ocR(name) actually CENTRAL + NUCLEAR in faithful_cd? The banked Lean ocR_comm/assoc
# say the REAL embedding is central. If my ocR is NOT central, my Dg model is wrong and the
# pieceB "counterexample" is a model artifact, not real.
import sys
sys.path.insert(0, '/Users/elliotweaver/phys-lean/workbench/N5-jordan-cap')
from faithful_cd import (symO, starO, addO, negO, mulO, zeroO, isO0, pvar, pzero)
def ocR(name): return ((pvar(name), pzero()), (pzero(), pzero()))
d=ocR('d'); x=symO('x'); y=symO('y')
def sub(a,b): return addO(a,negO(b))
print("ocR central: d*x == x*d            :", isO0(sub(mulO(d,x),mulO(x,d))))
print("ocR assocL : d*(x*y) == (d*x)*y    :", isO0(sub(mulO(d,mulO(x,y)),mulO(mulO(d,x),y))))
print("ocR assocM : x*(d*y) == (x*d)*y    :", isO0(sub(mulO(x,mulO(d,y)),mulO(mulO(x,d),y))))
print("ocR assocR : x*(y*d) == (x*y)*d    :", isO0(sub(mulO(x,mulO(y,d)),mulO(mulO(x,y),d))))
print("ocR self-adjoint star d == d       :", isO0(sub(starO(d),d)))
# also: is the model alternative? a*(a*b)=(a*a)*b
a=symO('a'); b=symO('b')
print("left alt: a*(a*b)==(a*a)*b         :", isO0(sub(mulO(a,mulO(a,b)),mulO(mulO(a,a),b))))
print("flex: a*(b*a)==(a*b)*a             :", isO0(sub(mulO(a,mulO(b,a)),mulO(mulO(a,b),a))))
# is it associative? (should be FALSE for octonions)
print("assoc (should be False): a*(b*c)==(a*b)*c:", isO0(sub(mulO(a,mulO(b,symO('c'))),mulO(mulO(a,b),symO('c')))))
