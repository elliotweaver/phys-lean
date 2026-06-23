"""Matrix-level free *-algebra solver for polarCross1 (Proj_k)(Xz)(Xz) entries.
Computes each entry as a formal free-algebra element, then solves
   entry = Σ_l c_l · lever_l    (c_l ∈ ℚ)
over a pool of asw_star / ka / alt instances, by linear algebra over formal monomials.
Outputs the exact linear_combination coefficients for the Lean proof.

Unit handling: the empty tuple () is the ring unit; m_mul collapses it.
"""
from fractions import Fraction as F
from itertools import product as iproduct

UNIT = ()  # empty tuple = ring identity

def m_mul(m1, m2):
    if m1 == UNIT: return m2
    if m2 == UNIT: return m1
    return (m1, m2)

def e_add(*es):
    out = {}
    for e in es:
        for m, c in e.items():
            out[m] = out.get(m, F(0)) + c
            if out[m] == 0: del out[m]
    return out

def e_neg(e): return {m: -c for m, c in e.items()}
def e_sub(e1, e2): return e_add(e1, e_neg(e2))
def e_smul(s, e):
    s = F(s)
    return {} if s == 0 else {m: s*c for m, c in e.items()}
def e_mul(e1, e2):
    out = {}
    for m1, c1 in e1.items():
        for m2, c2 in e2.items():
            m = m_mul(m1, m2)
            out[m] = out.get(m, F(0)) + c1*c2
            if out[m] == 0: del out[m]
    return out
def atom(name): return {name: F(1)}
ONE = {UNIT: F(1)}
ZERO = {}

def m_star(m):
    if m == UNIT: return UNIT
    if isinstance(m, str):
        return m[1:] if m.startswith('s') else 's'+m
    a, b = m
    return (m_star(b), m_star(a))
def e_star(e):
    out = {}
    for m, c in e.items():
        ms = m_star(m); out[ms] = out.get(ms, F(0)) + c
        if out[ms] == 0: del out[ms]
    return out

# ---- matrices of elements ----
def MZ(): return [[ZERO,ZERO,ZERO],[ZERO,ZERO,ZERO],[ZERO,ZERO,ZERO]]
def Madd(A,B): return [[e_add(A[i][j],B[i][j]) for j in range(3)] for i in range(3)]
def Msub(A,B): return [[e_sub(A[i][j],B[i][j]) for j in range(3)] for i in range(3)]
def Mmul(A,B):
    C = MZ()
    for i in range(3):
        for j in range(3):
            s = ZERO
            for k in range(3): s = e_add(s, e_mul(A[i][k], B[k][j]))
            C[i][j] = s
    return C
def jb(A,B): return Madd(Mmul(A,B), Mmul(B,A))
def Proj(k):
    M = MZ(); M[k][k] = ONE; return M
def Xz(a,b,c):
    sa,sb,sc = e_star(a),e_star(b),e_star(c)
    return [[ZERO,a,b],[sa,ZERO,c],[sb,sc,ZERO]]
def pc1(D,X,Y):
    t1 = jb(jb(D,Y), jb(X,X)); t2 = jb(jb(X,Y), jb(D,X)); t3 = jb(jb(X,Y), jb(X,D))
    t4 = jb(D, jb(Y, jb(X,X))); t5 = jb(X, jb(Y, jb(D,X))); t6 = jb(X, jb(Y, jb(X,D)))
    return Msub(Msub(Msub(Madd(Madd(t1,t2),t3),t4),t5),t6)

# levers (= 0 in alternative *-algebra)
def assoc(x,y,z): return e_sub(e_mul(e_mul(x,y),z), e_mul(x,e_mul(y,z)))
def asw_star(x,y,z):
    A=assoc(x,y,z); return e_add(A, e_star(A))
def ka(x,y,w):
    sx,sy,sw=e_star(x),e_star(y),e_star(w)
    t1=e_mul(e_mul(sx,sw),e_mul(y,x)); t2=e_mul(sx,e_mul(sw,e_mul(y,x)))
    t3=e_mul(e_mul(e_mul(sx,sy),w),x); t4=e_mul(e_mul(sx,sy),e_mul(w,x))
    return e_add(e_sub(e_sub(t1,t2),t3),t4)

a,b,c = atom('a'),atom('b'),atom('c')
p,q,r = atom('p'),atom('q'),atom('r')

if __name__ == "__main__":
    for k in range(3):
        M = pc1(Proj(k), Xz(a,b,c), Xz(p,q,r))
        print(f"=== Proj{k} ===")
        for i in range(3):
            for j in range(3):
                e = M[i][j]
                print(f"  ({i},{j}): {len(e)} monomials")
