import pickle
from fractions import Fraction as F
def dbl_mul(z,w): return (z[0]*w[0]-z[1]*w[1], z[0]*w[1]+z[1]*w[0])
def dbl_star(z): return (z[0],-z[1])
def dbl_add(z,w): return (z[0]+w[0],z[1]+w[1])
def dbl_neg(z): return (-z[0],-z[1])
def make_CD(mul,star,add,neg,zero):
    def cd_mul(z,w):
        zr,zi=z; wr,wi=w
        return (add(mul(zr,wr),neg(mul(star(wi),zi))), add(mul(wi,zr),mul(zi,star(wr))))
    def cd_star(z): return (star(z[0]),neg(z[1]))
    def cd_add(z,w): return (add(z[0],w[0]),add(z[1],w[1]))
    def cd_neg(z): return (neg(z[0]),neg(z[1]))
    return cd_mul,cd_star,cd_add,cd_neg,(zero,zero)
DBL=(F(0),F(0))
hm,hs,ha,hn,hz=make_CD(dbl_mul,dbl_star,dbl_add,dbl_neg,DBL)
om,os,oa,on,oz=make_CD(hm,hs,ha,hn,hz)
def ofv(v):
    def d(b):return(v[b],v[b+1])
    def h(b):return(d(b),d(b+2))
    return(h(0),h(4))
def otv(z):
    v=[None]*8
    for oi in(0,1):
        H=z[oi]
        for hi in(0,1):
            D=H[hi]
            for di in(0,1): v[oi*4+hi*2+di]=D[di]
    return v
def b(i):
    v=[F(0)]*8;v[i]=F(1);return ofv(v)
E=[b(i) for i in range(8)]
def fmt(v):
    nz=[(k,c) for k,c in enumerate(v) if c!=0]
    return "+".join(f"{c}e{k}" for k,c in nz).replace("+-","-") or "0"
# the two bracketings of e7
print("e1*e2 =",fmt(otv(om(E[1],E[2]))))   # e3
print("e3*e4 =",fmt(otv(om(E[3],E[4]))))   # e7  (this path: (e1e2)e4)
print("e2*e4 =",fmt(otv(om(E[2],E[4]))))   # e6
print("e1*e6 =",fmt(otv(om(E[1],E[6]))))   # e1(e2e4) path -> ?
print("e1*(e2*e4) =",fmt(otv(om(E[1],om(E[2],E[4])))))
print("(e1*e2)*e4 =",fmt(otv(om(om(E[1],E[2]),E[4]))))
# associator a(e1,e2,e4) = (e1e2)e4 - e1(e2e4)
ae=otv(oa(om(om(E[1],E[2]),E[4]), on(om(E[1],om(E[2],E[4])))))
print("associator (e1,e2,e4) =",fmt(ae))
