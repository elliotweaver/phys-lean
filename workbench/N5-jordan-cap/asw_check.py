"""asw_check (run 58): test the hypothesis that each cancelling pair of entry (i,j) is an
instance of the associator's first-third antisymmetry (swap13):
   asw(x,y,z) := (x*y)*z - x*(y*z) + (z*y)*x - z*(y*x)  == 0   (alternative algebra)
i.e. [x,y,z] = -[z,y,x]. Verify asw is identically zero, AND that the 3 pairs of (0,1) are
asw instances with the right (possibly compound) arguments."""
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
def zmul(x,y):
    a=x.a*y.a+dot(x.v,y.w)
    v=vadd(vadd(vscal(x.a,y.v),vscal(y.b,x.v)),vscal(F(-1),cross(x.w,y.w)))
    w=vadd(vadd(vscal(y.a,x.w),vscal(x.b,y.w)),cross(x.v,y.v))
    b=x.b*y.b+dot(x.w,y.v)
    return Z(a,v,w,b)
def zstar(x): return Z(x.b,vscal(F(-1),x.v),vscal(F(-1),x.w),x.a)
def zis0(x): return x.a==0 and x.b==0 and all(c==0 for c in x.v) and all(c==0 for c in x.w)
rng=random.Random(55)
def rndZ(): return Z(F(rng.randint(-3,3)),tuple(F(rng.randint(-3,3)) for _ in range(3)),
    tuple(F(rng.randint(-3,3)) for _ in range(3)),F(rng.randint(-3,3)))
def asw(x,y,z):
    return zadd(zsub(zmul(zmul(x,y),z), zmul(x,zmul(y,z))),
                zsub(zmul(zmul(z,y),x), zmul(z,zmul(y,x))))
ok=all(zis0(asw(rndZ(),rndZ(),rndZ())) for _ in range(500))
print("asw(x,y,z)=[x,y,z]+[z,y,x] identically zero:", ok)

# Entry (0,1) = 2*(aPbC + acBp + bCAp + bCPa + pAbC + pcBa) as associator-differences.
# Hypothesis: pairs are
#   aPbC - bCPa : asw(a, Sp, b*Sc)   [x=a, y=Sp, z=b*Sc]
#   acBp - bCAp : ?
#   pAbC - pcBa : ?
# Build each group's value, verify pairs are asw instances.
def grp_aPbC(a,b,c,p):  # 2*[(a P)(b C) - a(P(b C))], P=Sp, C=Sc
    P,C=zstar(p),zstar(c)
    t=zsub(zmul(zmul(a,P),zmul(b,C)), zmul(a,zmul(P,zmul(b,C))))
    return t
def grp_bCPa(a,b,c,p):  # [(b C)(P a) - ((b C)P)a]
    P,C=zstar(p),zstar(c); m=zmul(b,C)
    return zsub(zmul(m,zmul(P,a)), zmul(zmul(m,P),a))
def grp_acBp(a,b,c,p):  # [(a c)(B p) - a((c B)p)], B=Sb
    B=zstar(b)
    return zsub(zmul(zmul(a,c),zmul(B,p)), zmul(a,zmul(zmul(c,B),p)))
def grp_bCAp(a,b,c,p):  # [(b C)(A p) - b((C A)p)], C=Sc, A=Sa
    C,A=zstar(c),zstar(a)
    return zsub(zmul(zmul(b,C),zmul(A,p)), zmul(b,zmul(zmul(C,A),p)))
def grp_pAbC(a,b,c,p):  # [(p A)(b C) - (p(A b))C], A=Sa, C=Sc
    A,C=zstar(a),zstar(c)
    return zsub(zmul(zmul(p,A),zmul(b,C)), zmul(zmul(p,zmul(A,b)),C))
def grp_pcBa(a,b,c,p):  # [(p c)(B a) - (p(c B))a], B=Sb
    B=zstar(b)
    return zsub(zmul(zmul(p,c),zmul(B,a)), zmul(zmul(p,zmul(c,B)),a))

def chk(name,fn,trials=300):
    for _ in range(trials):
        a,b,c,p=rndZ(),rndZ(),rndZ(),rndZ()
        if not zis0(fn(a,b,c,p)): return False
    return True

print("\npair aPbC - bCPa zero:", chk("p1", lambda a,b,c,p: zsub(grp_aPbC(a,b,c,p),grp_bCPa(a,b,c,p))))
print("pair acBp - bCAp zero:", chk("p2", lambda a,b,c,p: zsub(grp_acBp(a,b,c,p),grp_bCAp(a,b,c,p))))
print("pair pAbC - pcBa zero:", chk("p3", lambda a,b,c,p: zsub(grp_pAbC(a,b,c,p),grp_pcBa(a,b,c,p))))

# Now: is pair1 exactly asw(a,Sp,b*Sc)?  asw(x,y,z)=[x,y,z]+[z,y,x]
def pair_as_asw(a,b,c,p):
    P,C=zstar(p),zstar(c); m=zmul(b,C)
    # pair1 = grp_aPbC - grp_bCPa
    pair=zsub(grp_aPbC(a,b,c,p),grp_bCPa(a,b,c,p))
    # asw(a,P,m) = [a,P,m]+[m,P,a]
    candidate=asw(a,P,m)
    return zsub(pair,candidate)
print("\npair1 == asw(a, Sp, b*Sc):", chk("p1asw", pair_as_asw))

# pair2 = grp_acBp - grp_bCAp. acBp=[(ac)(Bp)-a((cB)p)], bCAp=[(bC)(Ap)-b((CA)p)]
# Guess pair2 = asw(?,?,?). Try asw(a*c, Sb, p)? and others.
def try_asw(name, pairfn, x_f, y_f, z_f):
    def diff(a,b,c,p):
        return zsub(pairfn(a,b,c,p), asw(x_f(a,b,c,p),y_f(a,b,c,p),z_f(a,b,c,p)))
    print(f"  {name}:", chk(name, diff))
S=zstar
pair2=lambda a,b,c,p: zsub(grp_acBp(a,b,c,p),grp_bCAp(a,b,c,p))
pair3=lambda a,b,c,p: zsub(grp_pAbC(a,b,c,p),grp_pcBa(a,b,c,p))
print("\n=== pair2 = acBp - bCAp, candidate asw fits ===")
try_asw("asw(a*c, Sb, p)", pair2, lambda a,b,c,p: zmul(a,c), lambda a,b,c,p: S(b), lambda a,b,c,p: p)
try_asw("asw(p, Sb, a*c)", pair2, lambda a,b,c,p: p, lambda a,b,c,p: S(b), lambda a,b,c,p: zmul(a,c))
try_asw("asw(a, c, ?) no", pair2, lambda a,b,c,p: a, lambda a,b,c,p: c, lambda a,b,c,p: zmul(S(b),p))
print("\n=== pair3 = pAbC - pcBa, candidate asw fits ===")
try_asw("asw(p, ?, ?)", pair3, lambda a,b,c,p: p, lambda a,b,c,p: S(a), lambda a,b,c,p: zmul(b,S(c)))
try_asw("asw(p*Sa? , b, Sc)", pair3, lambda a,b,c,p: zmul(p,S(a)), lambda a,b,c,p: b, lambda a,b,c,p: S(c))
try_asw("asw(b*Sc, Sa, p)", pair3, lambda a,b,c,p: zmul(b,S(c)), lambda a,b,c,p: S(a), lambda a,b,c,p: p)
