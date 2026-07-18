from fractions import Fraction as F

edgeSurvival = F(2,3)          # tr Poth/3 = 2/3 (N308 self-blind survival)
deficit = 1 - edgeSurvival     # 1/3
delta_B = edgeSurvival * (1 - edgeSurvival)  # 2/9 banked cycle phase
print("edgeSurvival =", edgeSurvival)
print("deficit (1-edgeSurvival) =", deficit)
print("edgeSurvival*(1-edgeSurvival) =", delta_B, " == delta_B 2/9?", delta_B==F(2,9))

def genVec(M,A,p,r):
    M,A,p,r=map(F,(M,A,p,r))
    return [M+A*p, M-A*(p+r)/2, M-A*(p-r)/2]

a0,a1 = genVec(1,3,1,0)[0], genVec(1,3,1,0)[1]
print("\nup witness a0,a1 =", a0, a1)

def mixV10(u0,u1,d0,d1): return u1*d0 - u0*d1
misalign = mixV10(a0,a1,a0,edgeSurvival*a1)
forced   = a0*a1*(1-edgeSurvival)
print("sectorMisalign =", misalign, " forced a0*a1*(1-edgeSurvival) =", forced, " equal?", misalign==forced)
print("nonzero?", misalign!=0)

# textureCP Fano witness assoc3 = -1
cp_fano = misalign * (-1)
print("\ntextureCP Fano =", cp_fano, " = -misalign?", cp_fano==-misalign, " nonzero?", cp_fano!=0)
print("textureCP C-line =", misalign*0, " (leptons CP zero)")

flat = a0*a1*(1-1)
print("\nflat-survival misalign (survival=1) =", flat)

for (M,A,p,r) in [(1,3,1,0),(2,3,F(1,7),F(-12,7)),(1,3,0,1)]:
    v=genVec(M,A,p,r); aa0,aa1=v[0],v[1]
    print(f"({M},{A},{p},{r}) a0={aa0} a1={aa1} misalign={aa0*aa1*(1-edgeSurvival)}")

# The aligned/diagonal overlap entry with dressing: mixV(a0,a1,a0,s*a1) 0 0 = u0*d0+u1*d1 = a0^2 + s*a1^2
aligned = a0*a0 + edgeSurvival*a1*a1
print("\naligned entry a0^2+s*a1^2 =", aligned)
# ratio misalign/aligned (leading Cabibbo tan): 
print("misalign/aligned =", misalign/aligned, "=", float(misalign/aligned))
