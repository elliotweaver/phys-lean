"""free_bb22 (run 57): the DECISIVE Lean-shape check for building-block entry (2,2).
Is the entrysimp'd octonion expression E additively EQUAL (same free-algebra monomials,
provable by `abel`) to 2*(A1+A2+A3+A4), where each Ai is an associator with the SAME
bracketing as appears in E? If yes, the Lean proof is: rewrite each associator pair via
key_assoc, then abel. We work in the FREE non-associative algebra (tree monomials), NO
Zorn evaluation — equality here means provable by additive regrouping alone.

E (read from the run-57 Lean trace of entry (2,2), with x+x doublings = 2x):
  E = SC*SP*(a*c+a*c) + SB*p*(SA*b+SA*b)
      + ((SC*SA+SC*SA)*(p*c) + (SB*a+SB*a)*(SP*b))
      - (SB*(p*(SA*b+SA*b)) + SC*(SP*(a*c+a*c))
         + ((SB*a+SB*a)*SP*b + (SC*SA+SC*SA)*p*c))
where SA=star a=A, SB=B, SC=C, SP=P, and `*` is LEFT-associated in Lean's pretty-printer:
  SC*SP*(a*c) means (SC*SP)*(a*c);  (SB*a+SB*a)*SP*b means ((SB*a)+(SB*a))*SP)*b = (((B*a)*P)*b)*... 
  CAREFUL with Lean left-assoc: `u*v*w` = (u*v)*w.
"""
from fractions import Fraction as F
from collections import defaultdict

# free algebra: monomial = leaf str or ('m',l,r). vector = dict[mon]->F
def E_(m): return {m:F(1)}
def add(*xs):
    r=defaultdict(F)
    for x in xs:
        for m,v in x.items(): r[m]+=v
    return {m:v for m,v in r.items() if v!=0}
def neg(x): return {m:-v for m,v in x.items()}
def sub(x,y): return add(x,neg(y))
def smul(c,x): return {m:c*v for m,v in x.items()}
def mul(x,y):
    r=defaultdict(F)
    for mx,cx in x.items():
        for my,cy in y.items(): r[('m',mx,my)]+=cx*cy
    return {m:v for m,v in r.items() if v!=0}

A,B,C,P=E_('A'),E_('B'),E_('C'),E_('P')  # A=star a etc
a,b,c,p=E_('a'),E_('b'),E_('c'),E_('p')

def assoc(x,y,z): return sub(mul(mul(x,y),z), mul(x,mul(y,z)))

# E with Lean left-assoc semantics: u*v*w = (u*v)*w
# SC*SP*(a*c+a*c):  (C*P)*(a*c + a*c)
t1 = mul(mul(C,P), add(mul(a,c),mul(a,c)))
# SB*p*(SA*b+SA*b): (B*p)*(A*b + A*b)
t2 = mul(mul(B,p), add(mul(A,b),mul(A,b)))
# (SC*SA+SC*SA)*(p*c): ((C*A)+(C*A))*(p*c)
t3 = mul(add(mul(C,A),mul(C,A)), mul(p,c))
# (SB*a+SB*a)*(SP*b): ((B*a)+(B*a))*(P*b)
t4 = mul(add(mul(B,a),mul(B,a)), mul(P,b))
# SB*(p*(SA*b+SA*b)): B*(p*(A*b + A*b))
t5 = mul(B, mul(p, add(mul(A,b),mul(A,b))))
# SC*(SP*(a*c+a*c)): C*(P*(a*c + a*c))
t6 = mul(C, mul(P, add(mul(a,c),mul(a,c))))
# (SB*a+SB*a)*SP*b: (((B*a)+(B*a))*P)*b   [left assoc: u*SP*b = (u*P)*b]
t7 = mul(mul(add(mul(B,a),mul(B,a)), P), b)
# (SC*SA+SC*SA)*p*c: (((C*A)+(C*A))*p)*c
t8 = mul(mul(add(mul(C,A),mul(C,A)), p), c)

Efree = sub(add(t1,t2,t3,t4), add(t5,t6,t7,t8))

# associators (same bracketing as the trace):
A1 = assoc(C,P,mul(a,c))       # [C,P,ac] = (C*P)*(ac) - C*(P*(ac))
A2 = assoc(B,p,mul(A,b))       # [B,p,Ab]
A3 = smul(F(-1), assoc(mul(C,A),p,c))  # -[CA,p,c]
A4 = smul(F(-1), assoc(mul(B,a),P,b))  # -[Ba,P,b]
comb2 = smul(F(2), add(A1,A2,A3,A4))

diff = sub(Efree, comb2)
print("=== E - 2*(A1+A2+A3+A4) in FREE algebra (0 => provable by abel) ===")
print(f"  residual monomials: {len(diff)}")
if diff:
    for m,v in list(diff.items())[:20]: print("   ",v,m)
else:
    print("  EMPTY -> E == 2*(A1+A2+A3+A4) by additive regrouping (abel). Lean proof shape CONFIRMED.")

# also confirm A1+A3 and A2+A4 are key_assoc instances (free-algebra equal to key_assoc LHS-RHS form)
# key_assoc: assoc(star x, star w, y*x) = assoc(star x * star y, w, x)
# A1+A3 = [C,P,ac] - [CA,p,c]. Match: star x=C=>x=c; star w=P=>w=p; y*x = a*c => y=a (x=c ok).
#   then star x*star y = C*A = star c*star a ok; w=p; x=c.  EXACT key_assoc(x=c,y=a,w=p).
print("\n=== A1+A3 == key_assoc(c,a,p)?  A2+A4 == key_assoc(b, ?, p)? ===")
def KA_free(x,y,w):
    # assoc(Sx,Sw,y x) - assoc(Sx Sy, w, x), with S? the conj-leaf
    S={'a':'A','b':'B','c':'C','p':'P'}; 
    def st(v):  # v is a single-leaf vector
        (m,)=list(v.keys()); return E_(S[m])
    Sx,Sw,Sy=st(x),st(w),st(y)
    return sub(assoc(Sx,Sw,mul(y,x)), assoc(mul(Sx,Sy),w,x))
ka_cap = KA_free(c,a,p)   # expect == A1+A3
print("  (A1+A3) - key_assoc(c,a,p):", len(sub(add(A1,A3), ka_cap)), "residual")
ka_2 = KA_free(b, a, p)
# A2+A4 = [B,p,Ab]-[Ba,P,b]. Match key_assoc: star x=B=>x=b; star w=p?? p is not conj... 
# Actually [B,p,Ab]: star x=B->x=b; star w=p means w=star p=P; y*x=A*b => y=A=star a, x=b ok.
# star x*star y=B*star(star a)=B*a? no: star y=star(star a)=a. So star x*star y=B*a=Ba ok; w=star p? 
# Need w with star w=p => w=P. So key_assoc(x=b, y=star a, w=P): 
def KA_free_gen(xv,yv,wv,Sx,Sw,Sy):
    return sub(assoc(Sx,Sw,mul(yv,xv)), assoc(mul(Sx,Sy),wv,xv))
# A2+A4 with x=b(Sx=B), w=P(Sw=p... wait Sw=star P=p), y=A(Sy=star A=a)
ka_b = KA_free_gen(b, A, P, B, p, a)
print("  (A2+A4) - key_assoc(x=b,y=A,w=P):", len(sub(add(A2,A4), ka_b)), "residual")
