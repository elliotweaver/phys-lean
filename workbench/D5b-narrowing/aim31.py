from fractions import Fraction as F
# ≤2-factor poly (what the production proof actually uses):
def poly2(x2):
    return 1 - x2/2 + x2**2/24 - x2**3/720 + x2**4/40320 - x2**5/1814400
# find largest z_lo (in 1e7 units) where poly2(z_lo^2)>0
lo,hi=15700000,15707963
while hi-lo>1:
    mid=(lo+hi)//2
    x2=F(mid*mid,10**14)
    if poly2(x2)>0: lo=mid
    else: hi=mid
print("split@5 (<=2 factor) LOWER largest z_lo =", lo, "=",lo/1e7)
print("poly2 at that:", float(poly2(F(lo*lo,10**14))))
print("poly2 at 15707952:", float(poly2(F(15707952**2,10**14))))
# The parent used 15707. Let's pick a safe z_lo below the reach.
zlo=lo-2   # small margin
print("chosen z_lo=",zlo, " poly2=",float(poly2(F(zlo*zlo,10**14))))

# Now recompute 1/cutPi with this z_lo and z_hi=15707970 (split@6 upper)
DEN=10**7
zhi=15707970
ip_lo=F(DEN,2*zhi); ip_hi=F(DEN,2*zlo)
print("1/cutPi [%s,%s] width=%.2e"%(ip_lo,ip_hi,float(ip_hi-ip_lo)))
print("cutPi [%s,%s] leastZero [%s,%s]"%(F(2*zlo,DEN),F(2*zhi,DEN),F(zlo,DEN),F(zhi,DEN)))

# assembled with cutLog [815405/1e5,815411/1e5]
CL_LO=F(815405,10**5); CL_HI=F(815411,10**5)
d=F(16,3)
lo_a=F(190,3)+d/3*CL_LO*ip_lo
hi_a=F(190,3)+d/3*CL_HI*ip_hi
par_lo=F(9606370,141381); par_hi=F(9605390,141363)
print("\nassembled lo=%s hi=%s"%(lo_a,hi_a))
print(" ~[%.7f,%.7f] width=%.3e (%.1fx tighter)"%(float(lo_a),float(hi_a),float(hi_a-lo_a),0.00172/float(hi_a-lo_a)))
print(" nested lo>=par_lo:%s hi<=par_hi:%s strict:%s width_lt:%s"%(lo_a>=par_lo,hi_a<=par_hi,lo_a<hi_a,(hi_a-lo_a)<(par_hi-par_lo)))
dlo=F(74)+d/2*CL_LO*ip_lo; dhi=F(74)+d/2*CL_HI*ip_hi
print("dressed lo=%s hi=%s"%(dlo,dhi))
print("\nhx2 bound: z_lo^2 = %d/1e14 ; use clean B just above"%(zlo*zlo))
# clean B for hx2 at reasonable digits
B=F(zlo*zlo,10**14)
print("z_lo^2 exact =",float(B))
# a clean upper bound with fewer digits:
import math
Bc=F(math.ceil(float(B)*10**7),10**7)
print("clean B=%s=%.10f >=z_lo^2?%s poly2(B)>0?%s"%(Bc,float(Bc),Bc>=B,poly2(Bc)>0))
