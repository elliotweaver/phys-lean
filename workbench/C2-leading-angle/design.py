import mpmath as mp
mp.mp.dps = 40

# Derived phase data over Cut (from banked N339/N340)
p = mp.cos(mp.mpf(2)/9)          # cutCos(2/9)
w = mp.sqrt(2)                    # cutSqrt 2
r = mp.sqrt(3 - 3*p*p)           # conic
b0 = 1 + w*p                     # genVec 0 (leading, heaviest amplitude)
b1 = 1 - w*(p+r)/2               # genVec 1 (lightest)
b2 = 1 - w*(p-r)/2               # genVec 2 (middle)
print("b0 =", mp.nstr(b0,10), " b1 =", mp.nstr(b1,10), " b2 =", mp.nstr(b2,10))
print("masses (Born sq):  m0=%s m1=%s m2=%s"%(mp.nstr(b0**2,8),mp.nstr(b1**2,8),mp.nstr(b2**2,8)))

s = mp.mpf(2)/3   # edgeSurvival
def Vmix2(a0,a1):
    # up frame u=(a0,a1); down frame d=(a0, s*a1)  [C1 survival-dressed down frame]
    cross = a1*a0 - a0*(s*a1)      # u1*d0 - u0*d1 = a0*a1*(1-s)
    nu = a0*a0 + a1*a1
    nd = a0*a0 + (s*a1)**2
    return cross**2/(nu*nd)

pairs = {
 "(a0,a1)=(b0,b1) leading Fourier block": (b0,b1),
 "(a0,a1)=(b2,b1) light 1-2 block":       (b2,b1),
 "(a0,a1)=(b0,b2) deep edge (largest rho)":(b0,b2),
}
for name,(a0,a1) in pairs.items():
    v2=Vmix2(a0,a1)
    print("%-42s |Vmix|^2=%s  sin=%s  rho=a1/a0=%s"%(name, mp.nstr(v2,8), mp.nstr(mp.sqrt(v2),6), mp.nstr(a1/a0,6)))

print()
print("measured Cabibbo: sinTheta_C ~ 0.2252, sin^2 ~ 0.0507")
print("undressedEdgeRatio b2/b0 =", mp.nstr(b2/b0,8), " (banked ~0.2438)")
print("depthDressed (2/3)*b2/b0 =", mp.nstr(s*b2/b0,8))
print("(b2/b0)^2 =", mp.nstr((b2/b0)**2,8), "   ((2/3)b2/b0)^2 =", mp.nstr((s*b2/b0)**2,8))

# The C1 misalignment / aligned overlap ratio as a mixing FRACTION.
# For the dressed frame u=(a0,a1), d=(a0, s a1):
#   cross = a0 a1 (1-s);  aligned = u.d = a0^2 + s a1^2
# The invariant mixing fraction is |Vmix|^2 = cross^2/(nu*nd).
# Since C1 fixes the down frame = (a0, s a1) with SAME a0, the frame-norm denominator is fixed.
print()
print("=== C1-native: leading-block (a0,a1)=(b0,b1) exact fraction ===")
a0,a1=b0,b1
cross=a0*a1*(1-s); nu=a0*a0+a1*a1; nd=a0*a0+(s*a1)**2
print("cross=%s nu=%s nd=%s"%(mp.nstr(cross,8),mp.nstr(nu,8),mp.nstr(nd,8)))
print("|Vmix|^2 =",mp.nstr(cross**2/(nu*nd),10))
print("tan-like cross/aligned = ", mp.nstr(cross/(a0*a0+s*a1*a1),8))
