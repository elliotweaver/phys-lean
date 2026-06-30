"""Confirm x=e1+e10 == zdX (banked zero divisor), emit nested-tuple Lean literals,
and test left-alt failure for several (x,y) choices reusing BANKED elements."""
from fractions import Fraction as F

def issc(x): return isinstance(x, F)
def cadd(x, y): return x + y if issc(x) else (cadd(x[0], y[0]), cadd(x[1], y[1]))
def cneg(x): return -x if issc(x) else (cneg(x[0]), cneg(x[1]))
def csub(x, y): return cadd(x, cneg(y))
def cstar(x): return x if issc(x) else (cstar(x[0]), cneg(x[1]))
def cmul(x, y):
    if issc(x): return x * y
    a, b = x; c, d = y
    return (csub(cmul(a, c), cmul(cstar(d), b)), cadd(cmul(d, a), cmul(b, cstar(c))))
def czero(L): return F(0) if L == 0 else (czero(L-1), czero(L-1))
def cis0(x): return x == 0 if issc(x) else (cis0(x[0]) and cis0(x[1]))

LV = 4; N = 16
def fc(cs, L=LV):
    def b(L, l):
        if L == 0: return l[0], l[1:]
        re, l = b(L-1, l); im, l = b(L-1, l); return (re, im), l
    o, r = b(L, [F(c) for c in cs]); assert r == [], r; return o
def flat(x, L=LV):
    if L == 0: return [int(x)]
    return flat(x[0], L-1) + flat(x[1], L-1)
def e(i):
    cs = [F(0)]*N; cs[i] = F(1); return fc(cs)

def lit(x):
    """nested-tuple -> Lean anonymous-constructor literal ⟨.,.⟩, scalars as plain ints"""
    if issc(x): return str(int(x))
    return "⟨" + lit(x[0]) + ", " + lit(x[1]) + "⟩"

# zdX, zdY from Sedenion.lean (transcribe the Lean literals -> flat coords)
zdX = ((((F(0),F(1)),(F(0),F(0))),((F(0),F(0)),(F(0),F(0)))),
       (((F(0),F(0)),(F(1),F(0))),((F(0),F(0)),(F(0),F(0)))))
zdY = ((((F(0),F(0)),(F(0),F(0))),((F(0),F(1)),(F(0),F(0)))),
       (((F(0),F(0)),(F(0),F(0))),((F(0),F(0)),(F(1),F(0)))))
print("zdX flat =", flat(zdX), " == e1+e10?", flat(zdX) == flat(cadd(e(1),e(10))))
print("zdY flat =", flat(zdY), " == e5+e14?", flat(zdY) == flat(cadd(e(5),e(14))))

def defect(x, y):  # left-alt defect (x*x)*y - x*(x*y)
    return csub(cmul(cmul(x, x), y), cmul(x, cmul(x, y)))

for (xn, x), (yn, y) in [(("zdX", zdX), ("e4", e(4))),
                         (("zdX", zdX), ("zdY", zdY)),
                         (("zdX", zdX), ("e3", e(3))),
                         (("zdX", zdX), ("e7", e(7)))]:
    d = defect(x, y); fl = flat(d)
    nz = [(c, v) for c, v in enumerate(fl) if v != 0]
    print(f"\nx={xn}, y={yn}: left-alt defect nz coords = {nz}")
    print(f"  (x*x)*y flat = {flat(cmul(cmul(x,x),y))}")
    print(f"  x*(x*y) flat = {flat(cmul(x,cmul(x,y)))}")

print("\n--- Lean literals ---")
print("zdX =", lit(zdX))
print("e4  =", lit(e(4)))
print("zdY =", lit(zdY))
