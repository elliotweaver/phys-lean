import sympy as sp

def dbl_star(a): return (a[0], -a[1])
def dbl_mul(z,w): return (z[0]*w[0]-z[1]*w[1], z[0]*w[1]+z[1]*w[0])
def dbl_add(z,w): return (z[0]+w[0], z[1]+w[1])
def dbl_neg(z): return (-z[0],-z[1])
def dbl_sub(z,w): return (z[0]-w[0], z[1]-w[1])

def H_of(rr,ri,ir,ii): return ((rr,ri),(ir,ii))
def H_star(x): return (dbl_star(x[0]), dbl_neg(x[1]))
def H_mul(z,w):
    re = dbl_sub(dbl_mul(z[0],w[0]), dbl_mul(dbl_star(w[1]), z[1]))
    im = dbl_add(dbl_mul(w[1],z[0]), dbl_mul(z[1], dbl_star(w[0])))
    return (re,im)
def H_add(z,w): return (dbl_add(z[0],w[0]), dbl_add(z[1],w[1]))
def H_sub(z,w): return (dbl_sub(z[0],w[0]), dbl_sub(z[1],w[1]))
def H_smul(c,z): return ((c*z[0][0],c*z[0][1]),(c*z[1][0],c*z[1][1]))
def adHom(q,x): return H_sub(H_mul(q,x), H_mul(x,q))

w_ri,w_ir,w_ii = sp.symbols('w_ri w_ir w_ii')
p_ri,p_ir,p_ii = sp.symbols('p_ri p_ir p_ii')
w = H_of(0,w_ri,w_ir,w_ii)
p = H_of(0,p_ri,p_ir,p_ii)

quatNorm_w = w_ri**2 + w_ir**2 + w_ii**2
wp = H_mul(w,p)
wp_rr = wp[0][0]

lhs = H_smul(4*quatNorm_w, p)
adpw = adHom(p,w)
ad_w_adpw = adHom(w, adpw)

def flat(x): return [sp.expand(x[0][0]),sp.expand(x[0][1]),sp.expand(x[1][0]),sp.expand(x[1][1])]

for label, rhs in [("minus", H_sub(ad_w_adpw, H_smul(4*wp_rr, w))),
                   ("plus",  H_add(ad_w_adpw, H_smul(4*wp_rr, w)))]:
    diff = [sp.simplify(a-b) for a,b in zip(flat(lhs),flat(rhs))]
    print(label, "diff:", diff)

print("(w*p).re.re =", sp.expand(wp_rr))
print("ad_w(ad_p w) =", flat(ad_w_adpw))
print("LHS 4qn*p =", flat(lhs))
