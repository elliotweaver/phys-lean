"""MEASURE (W9): find a MINIMAL-support witness for left-alternativity FAILURE on
the sedenions S = CD(O), i.e. (x*x)*y != x*(x*y).  We work with the SAME
Cayley-Dickson product Lean uses:  (a,b)(c,d) = (ac - d* b, d a + b c*).
Bottom = Fraction.  Level 4 = 16 coords (sedenions).

GOAL: find x, y with as FEW nonzero coords as possible (and small integer entries)
so the Lean witness + #print axioms stays cheap, and identify which single
coordinate of (x*x)*y - x*(x*y) is nonzero (the 'teeth' coordinate)."""
from fractions import Fraction as F
import itertools

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
    if L == 0: return [x]
    return flat(x[0], L-1) + flat(x[1], L-1)

def leftalt_defect(x, y):
    return csub(cmul(cmul(x, x), y), cmul(x, cmul(x, y)))

# basis vectors e_0..e_15
def e(i):
    cs = [F(0)]*N; cs[i] = F(1); return fc(cs)

# Strategy: try x = e_i + e_j (two unit coords), y = e_k (one unit coord).
# Minimal-support search.
best = None
for i in range(N):
    for j in range(i, N):
        if i == j:
            xs = [(i,)]  # x = e_i alone
        else:
            xs = [(i, j)]
        for supp in xs:
            cs = [F(0)]*N
            for s in supp: cs[s] = F(1)
            x = fc(cs)
            for k in range(N):
                y = e(k)
                d = leftalt_defect(x, y)
                fl = flat(d)
                nz = [(c, v) for c, v in enumerate(fl) if v != 0]
                if nz:
                    score = (len(supp), len(nz), sum(abs(v) for _, v in nz))
                    if best is None or score < best[0]:
                        best = (score, supp, k, nz)

print("MINIMAL left-alt-failure witness (x = sum of unit e_i over supp, y = e_k):")
if best:
    score, supp, k, nz = best
    print(f"  x support = {supp}  (x = " + " + ".join(f"e{s}" for s in supp) + ")")
    print(f"  y = e{k}")
    print(f"  defect nonzero coords (coord: value): {nz}")
    print(f"  score (|x supp|, #nz, sum|v|) = {score}")
    # print full flat coords of x, x*x, (x*x)*y, x*(x*y)
    cs = [F(0)]*N
    for s in supp: cs[s] = F(1)
    x = fc(cs); y = e(k)
    print("  x      =", flat(x))
    print("  x*x    =", flat(cmul(x, x)))
    print("  (xx)y  =", flat(cmul(cmul(x, x), y)))
    print("  x(xy)  =", flat(cmul(x, cmul(x, y))))
else:
    print("  NONE found in two-coord-x / one-coord-y family")
