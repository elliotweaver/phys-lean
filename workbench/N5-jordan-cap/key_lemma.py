"""key_lemma (run 57): the single associator identity that closes the building block.
   A1+A3=0 means: [star c, star p, a*c] = [(star c)*(star a), p, c]
Relabel generic: with x:=c, y:=a, w:=p (rename to avoid star clutter), is it
   [star x, star w, y*x] = [(star x)*(star y), w, x]   ? for all x,y,w (octonions)
Let's confirm the GENERIC 3-variable identity (drop the conjugate ties; x,y,w free):
   [star x, star w, y*x] == [star x * star y, w, x]
Then find which banked product-form laws + flexible/Moufang yield it.
Exact Zorn, 400 samples.
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
rng=random.Random(123)
def rndZ(): return Z(F(rng.randint(-4,4)),tuple(F(rng.randint(-4,4)) for _ in range(3)),
    tuple(F(rng.randint(-4,4)) for _ in range(3)),F(rng.randint(-4,4)))
def assoc(x,y,z): return zsub(zmul(zmul(x,y),z), zmul(x,zmul(y,z)))
def test(name, fn, trials=400):
    ok=True
    for _ in range(trials):
        vs=[rndZ() for _ in range(4)]
        if not zis0(fn(*vs)): ok=False; break
    print(f"  {name}: zero = {ok}")

# original tied form: x=c,y=a,w=p  -> [Sc,Sp,ac]-[Sc Sa,p,c]
print("=== tied form (a,b,c,p), A1+A3 ===")
test("[Sc,Sp,ac]-[ScSa,p,c]", lambda a,b,c,p: zsub(assoc(zstar(c),zstar(p),zmul(a,c)),
                                                    assoc(zmul(zstar(c),zstar(a)),p,c)))
# generic 3-var (x,y,w free, no conjugate ties):
print("\n=== generic 3-var: [Sx,Sw,yx] - [Sx Sy,w,x] ===")
test("[Sx,Sw,yx]-[SxSy,w,x]", lambda x,y,w,_: zsub(assoc(zstar(x),zstar(w),zmul(y,x)),
                                                    assoc(zmul(zstar(x),zstar(y)),w,x)))
# Try replacing star x, star w, star y by FREE independent vars u=Sx, v=Sw, t=Sy.
# Then x=star u, y=star t, w=star v. The identity becomes purely in u,v,t,(and x=Su etc).
# i.e. is it [u, v, (star t)*(star u)] - [u*t, star v, star u] = 0 with u,v,t free?
print("\n=== fully free (u,v,t): [u,v, St*Su] - [u t, Sv, Su] (x=Su,y=St,w=Sv) ===")
def gen(u,v,t,_):
    x=zstar(u); y=zstar(t); w=zstar(v)
    return zsub(assoc(zstar(x),zstar(w),zmul(y,x)), assoc(zmul(zstar(x),zstar(y)),w,x))
test("free uvt", gen)

# Simpler: maybe the cleanest is via the conjugation identity star[x,y,z]=[Sx,Sy,Sz]
# applied to a Moufang/flex form. Test candidate single-law identities that might give A1+A3:
print("\n=== candidate building identities (generic x,y,w) ===")
# flexible on compound? [Sx,Sw,yx] vs ... try right-alt linearization
test("alt: [Sx Sy, w, x] = [Sx, Sy?..] (skip)", lambda *_: zzero())
# Moufang-mid form check: (xy)(zx) = x((yz)x). Associator of (Sc,Sp,ac)...
# Direct: is [Sc,Sp,a c] expressible as -[Sc Sa,p,c] via assoc_swap + a Moufang?
# We already KNOW A1+A3=0; just need the Lean tactic. Test if it follows from
# 'mul_swap23'/'mul_swap12' instances by checking the difference is in their span
# (done in cert_bb -> NO for the matrix entry, but maybe YES for this clean pair).
print("  (span test handled separately; pairing identity A1+A3=0 already confirmed)")
