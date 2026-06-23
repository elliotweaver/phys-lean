#!/usr/bin/env python3
# RUN 68: do the block-1 L1 coefficients all lie in the span of a SMALL universal octonion
# lever family? Test candidates: (P) pure-imaginary associator A+star(A)=0;
# (S2) left-alt linearization [x,y,z]+[y,x,z]=0; (S3) right [x,y,z]+[x,z,y]=0.
# For each C (4 monomials), try to write it as int-combo of lever instances by checking the
# faithful model: just confirm each C is zero (already done) AND identify its associator shape.
import sys
sys.path.insert(0, '/Users/elliotweaver/phys-lean/workbench/N5-jordan-cap')
import faithful_cd as F

def assoc(P,Q,R): return F.addO(F.mulO(P,F.mulO(Q,R)), F.negO(F.mulO(F.mulO(P,Q),R)))

a,b,c,p = (F.symO(n) for n in ['a','b','c','p'])
sa,sb,sc,sp = (F.starO(x) for x in (a,b,c,p))

# the distinct C combos from block1_verify (each = 0). Express each as 2 associators and
# check the pure-imaginary identity A+star(A)=0 closes it, OR an alternating swap.
def starO(x): return F.starO(x)
def show(name, val): print(f"  {name}: {'ZERO' if F.isO0(val) else 'NONZERO'}")

# Universal lever checks:
print("Universal levers (must all be ZERO in alternative octonions):")
# (P) associator is pure imaginary
A = assoc(p,c,sb)
show("(P) [p,c,sb] + star[p,c,sb]", F.addO(A, starO(A)))
# (S2) left linearized alternativity
show("(S2) [p,sa,b] + [sa,p,b]", F.addO(assoc(p,sa,b), assoc(sa,p,b)))
# (S3) right linearized alternativity
show("(S3) [p,sa,b] + [p,b,sa]", F.addO(assoc(p,sa,b), assoc(p,b,sa)))

print("\nNow the actual C combos and whether (P)/(S2)/(S3) explain them:")
# (0,2) d1: 2[p,sa,b] + 2[a,sp,b]  -- both end in b. Is [p,sa,b]=-[a,sp,b]?
show("(0,2)d1: [p,sa,b] + [a,sp,b]", F.addO(assoc(p,sa,b), assoc(a,sp,b)))
# Is that = (S2)-type? [a,sp,b] vs -[p,sa,b]. Check [p,sa,b]+[a,sp,b] via star:
# star[p,sa,b] = -[sb, a, sp]. hmm.
# (0,0) d0: -2[p,c,sb] + 2[b,sc,sp]
show("(0,0)d0: -[p,c,sb] + [b,sc,sp]", F.addO(F.negO(assoc(p,c,sb)), assoc(b,sc,sp)))
# check [b,sc,sp] = star(-[p,c,sb])? star[p,c,sb] = -[b, sc, sp]  (antiauto reverse)
show("  check star[p,c,sb] + [b,sc,sp]", F.addO(starO(assoc(p,c,sb)), assoc(b,sc,sp)))
