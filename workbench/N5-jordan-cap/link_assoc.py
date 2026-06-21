"""
Identify the (0,3) Jordan defect = 4 e5 as a single octonion ASSOCIATOR of the
three entry units e1, e2, e4 (with signs from Hermitian conjugation).
Brute-force over orderings/signs of {±e1,±e2,±e4}.
"""
import itertools
from fast import omul,oadd,osub,oneg,ostar,oz,ois0,E,assoc

target=[0,0,0,0,0,4,0,0]  # 4 e5
units={'e1':E[1],'e2':E[2],'e4':E[4]}
def smul(s,x): return [s*v for v in x]

print("All associators [a,b,c] of signed {e1,e2,e4} equal to target 4 e5 or 2 e5 or -...:")
found=False
for keys in itertools.permutations(['e1','e2','e4']):
    for sa,sb,sc in itertools.product([1,-1],repeat=3):
        a=smul(sa,units[keys[0]]); b=smul(sb,units[keys[1]]); c=smul(sc,units[keys[2]])
        v=assoc(a,b,c)
        # is v a rational multiple of e5 only?
        nz=[(k,v[k]) for k in range(8) if v[k]!=0]
        if len(nz)==1 and nz[0][0]==5:
            sign_str=f"{'+' if sa>0 else '-'}{keys[0]},{'+' if sb>0 else '-'}{keys[1]},{'+' if sc>0 else '-'}{keys[2]}"
            print(f"  [{sign_str}] = {nz[0][1]} e5")
            found=True
print("found single-associator on e5:",found)

# also: the deep general fact -- in an associative ring, the matrix Jordan identity
# holds, so the cap failure RE-PROVES non-associativity. Verify the witness defect
# equals 2x a basic octonion associator of the unsigned units (the simplest link):
print("\nassoc(e2,e1,e4) =", assoc(E[2],E[1],E[4]))
print("assoc(e1,e2,e4) =", assoc(E[1],E[2],E[4]))
print("assoc(e4,e1,e2) =", assoc(E[4],E[1],E[2]))
print("assoc(e4,e2,e1) =", assoc(E[4],E[2],E[1]))
