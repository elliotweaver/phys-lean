"""pair_bb22 (run 57): find the EXACT cancellation structure of the 4 associators
   C := [SC,SP,ac] + [SB,p,SA b] - [SC SA,p,c] - [SB a,SP,b]  = 0
Test pairings + the involution relations (CA=star(ac), Ba=star(Ab)) to find the Lean route.
SC=star c, SP=star p, SB=star b, SA=star a. Exact Zorn, 300 samples each.
"""
from fractions import Fraction as F
import random
def dot(u,v): return u[0]*v[0]+u[1]*v[1]+u[2]*v[2]
def cross(u,v): return (u[1]*v[2]-u[2]*v[1],u[2]*v[0]-u[0]*v[2],u[0]*v[1]-u[1]*v[0])
def vadd(u,v): return tuple(u[i]+v[i] for i in range(3))
def vscal(s,u): return tuple(s*u[i] for i in range(3))
class Z:
    __slots__=('a','v','w','b')
    def __init__(s,a,v,w,b): s.a=a;s.v=v;s.w=w;s.b=b
def zzero(): return Z(F(0),(F(0),)*3,(F(0),)*3,F(0))
def zadd(x,y): return Z(x.a+y.a,vadd(x.v,y.v),vadd(x.w,y.w),x.b+y.b)
def zsub(x,y): return Z(x.a-y.a,tuple(x.v[i]-y.v[i] for i in range(3)),tuple(x.w[i]-y.w[i] for i in range(3)),x.b-y.b)
def zsc(c,x): return Z(c*x.a,vscal(c,x.v),vscal(c,x.w),c*x.b)
def zmul(x,y):
    a=x.a*y.a+dot(x.v,y.w)
    v=vadd(vadd(vscal(x.a,y.v),vscal(y.b,x.v)),vscal(F(-1),cross(x.w,y.w)))
    w=vadd(vadd(vscal(y.a,x.w),vscal(x.b,y.w)),cross(x.v,y.v))
    b=x.b*y.b+dot(x.w,y.v)
    return Z(a,v,w,b)
def zstar(x): return Z(x.b,vscal(F(-1),x.v),vscal(F(-1),x.w),x.a)
def zis0(x): return x.a==0 and x.b==0 and all(c==0 for c in x.v) and all(c==0 for c in x.w)
rng=random.Random(99)
def rndZ(): return Z(F(rng.randint(-4,4)),tuple(F(rng.randint(-4,4)) for _ in range(3)),
    tuple(F(rng.randint(-4,4)) for _ in range(3)),F(rng.randint(-4,4)))
def assoc(x,y,z): return zsub(zmul(zmul(x,y),z), zmul(x,zmul(y,z)))

def test(name, fn, trials=300):
    ok=True
    for _ in range(trials):
        a,b,c,p=rndZ(),rndZ(),rndZ(),rndZ()
        if not zis0(fn(a,b,c,p)): ok=False; break
    print(f"  {name}: identically zero = {ok}")

def A1(a,b,c,p): return assoc(zstar(c),zstar(p),zmul(a,c))      # [SC,SP,ac]
def A2(a,b,c,p): return assoc(zstar(b),p,zmul(zstar(a),b))      # [SB,p,SA b]
def A3(a,b,c,p): return zsc(F(-1),assoc(zmul(zstar(c),zstar(a)),p,c))  # -[SC SA,p,c]
def A4(a,b,c,p): return zsc(F(-1),assoc(zmul(zstar(b),a),zstar(p),b))  # -[SB a,SP,b]

print("=== full sum (sanity) ===")
test("A1+A2+A3+A4", lambda a,b,c,p: zadd(zadd(A1(a,b,c,p),A2(a,b,c,p)),zadd(A3(a,b,c,p),A4(a,b,c,p))))

print("\n=== pairings (do any two cancel?) ===")
test("A1+A3  ([SC,SP,ac]-[SC SA,p,c])", lambda a,b,c,p: zadd(A1(a,b,c,p),A3(a,b,c,p)))
test("A2+A4  ([SB,p,SA b]-[SB a,SP,b])", lambda a,b,c,p: zadd(A2(a,b,c,p),A4(a,b,c,p)))
test("A1+A2", lambda a,b,c,p: zadd(A1(a,b,c,p),A2(a,b,c,p)))
test("A1+A4", lambda a,b,c,p: zadd(A1(a,b,c,p),A4(a,b,c,p)))
test("A2+A3", lambda a,b,c,p: zadd(A2(a,b,c,p),A3(a,b,c,p)))
test("A3+A4", lambda a,b,c,p: zadd(A3(a,b,c,p),A4(a,b,c,p)))

print("\n=== conjugation-associator identity check: star[x,y,z] = [star x,star y,star z]? ===")
def chk_star_assoc(a,b,c,p):
    x,y,z=a,b,c
    return zsub(zstar(assoc(x,y,z)), assoc(zstar(x),zstar(y),zstar(z)))
test("star[x,y,z] - [Sx,Sy,Sz]", chk_star_assoc)

print("\n=== is A1+A3 a star-image of A2+A4 (so one proof gives the other)? ===")
def chk_conj(a,b,c,p):
    return zsub(zstar(zadd(A1(a,b,c,p),A3(a,b,c,p))), zadd(A2(a,b,c,p),A4(a,b,c,p)))
test("star(A1+A3) - (A2+A4)", chk_conj)
def chk_conj2(a,b,c,p):
    return zadd(zstar(zadd(A1(a,b,c,p),A3(a,b,c,p))), zadd(A2(a,b,c,p),A4(a,b,c,p)))
test("star(A1+A3) + (A2+A4)", chk_conj2)
