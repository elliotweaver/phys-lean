# Reconnaissance: do the N6 innerDeriv q (lifted ad_q on base H) land in Der span,
# and how many independent ones? innerDeriv lifts ad_q componentwise. q imaginary in H.
# H = CD(Dbl). imaginary directions of H: 3-dim (e_i for the H-imaginary part).
# But innerDeriv only gives inner derivations of H lifted; ad_q for q in H imaginary.
# H is associative (quaternions), Der(H)=so(3)=3-dim inner. Lifted gives 3 derivations of O.
# That's only 3 < 14. So innerDeriv alone is NOT enough for lower bound 14.
from fractions import Fraction as F
from model import C, E, o_to_vec, o_mul, o_star, o_add, o_neg, basis
import pickle
N=8
# ad_q on H lifted to O: innerDeriv q (z) = (ad_q z.re, ad_q z.im) where re,im in H.
# In O coords (0..7): re-block = coords 0..3 (H), im-block = coords 4..7 (H).
# ad_q(h) = q*h - h*q  in H. q imaginary in H: q = sum over H-imag basis.
# Build H multiplication from model? model builds O directly. Let me build H separately.
def dbl_mul(z,w): return (z[0]*w[0]-z[1]*w[1], z[0]*w[1]+z[1]*w[0])
def dbl_star(z): return (z[0],-z[1])
def dbl_add(z,w): return (z[0]+w[0],z[1]+w[1])
def dbl_neg(z): return (-z[0],-z[1])
def make_CD(mul,star,add,neg,zero):
    def cd_mul(z,w):
        zr,zi=z;wr,wi=w
        return (add(mul(zr,wr),neg(mul(star(wi),zi))), add(mul(wi,zr),mul(zi,star(wr))))
    def cd_star(z): return (star(z[0]),neg(z[1]))
    return cd_mul,cd_star
h_mul,h_star=make_CD(dbl_mul,dbl_star,dbl_add,dbl_neg,(F(0),F(0)))
# H element = ((q0,q1),(q2,q3)) coords 0..3
def h_from(v): return ((v[0],v[1]),(v[2],v[3]))
def h_to(z): return [z[0][0],z[0][1],z[1][0],z[1][1]]
def h_add(z,w): return ((z[0][0]+w[0][0],z[0][1]+w[0][1]),(z[1][0]+w[1][0],z[1][1]+w[1][1]))
def h_neg(z): return ((-z[0][0],-z[0][1]),(-z[1][0],-z[1][1]))
def h_sub(z,w): return h_add(z,h_neg(w))
HE=[h_from([F(1) if k==i else F(0) for k in range(4)]) for i in range(4)]
# imaginary H units: e1,e2,e3 (indices 1,2,3)
def adq(q,h): return h_sub(h_mul(q,h),h_mul(h,q))
# matrix of ad_q on H (4x4)
def admat(q):
    M=[[F(0)]*4 for _ in range(4)]
    for i in range(4):
        col=h_to(adq(q,HE[i]))
        for a in range(4): M[a][i]=col[a]
    return M
for i in [1,2,3]:
    print(f"ad_e{i} on H matrix:")
    M=admat(HE[i])
    for row in M: print("  ",row)
# rank of the 3 ad matrices flattened
def flat(M): return [M[a][b] for a in range(4) for b in range(4)]
vs=[flat(admat(HE[i])) for i in [1,2,3]]
def rank(rows):
    rows=[r[:] for r in rows];r=0
    for c in range(len(rows[0])):
        piv=None
        for rr in range(r,len(rows)):
            if rows[rr][c]!=0: piv=rr;break
        if piv is None: continue
        rows[r],rows[piv]=rows[piv],rows[r]
        inv=F(1)/rows[r][c];rows[r]=[x*inv for x in rows[r]]
        for rr in range(len(rows)):
            if rr!=r and rows[rr][c]!=0:
                f=rows[rr][c];rows[rr]=[a-f*b for a,b in zip(rows[rr],rows[r])]
        r+=1
    return r
print("rank of 3 inner derivations of H:", rank(vs))
