"""
Emit Lean nested literals for sedenion basis elements (flat index 0..15) and verify
the C13 costume projections:  x=e4, y=e15, z=e1+e10  in S Q = CD(O Q).
S = CD(O), O=CD(H), H=CD(Dbl), Dbl=struct(re,im). Nested ⟨re,im⟩ at every level;
flat index bit3=S, bit2=O, bit1=H, bit0=Dbl (re=0/im=1).
"""
from fractions import Fraction as Fr

def nested_lit(vec):
    # vec: list of 16 ints. Build nested ⟨...⟩ string, splitting halves recursively
    # down to pairs (Dbl/CD leaves are ⟨a,b⟩).
    def build(vs):
        if len(vs)==2:
            return f"⟨{vs[0]}, {vs[1]}⟩"
        h=len(vs)//2
        return f"⟨{build(vs[:h])}, {build(vs[h:])}⟩"
    return build(vec)

def e(i):
    v=[0]*16; v[i]=1; return v
def add(a,b): return [x+y for x,y in zip(a,b)]

for name,vec in [("e4",e(4)),("e15",e(15)),("z=e1+e10",add(e(1),e(10)))]:
    print(f"{name}: {nested_lit(vec)}")

# --- recompute bilin(xz,yz).proj and (bilin x y * Nrm z).proj to confirm 4 vs 0 ---
class Alg:
    def __init__(s,add,neg,mul,star,zero,one,dim):
        s.add=add;s.neg=neg;s.mul=mul;s.star=star;s.zero=zero;s.one=one;s.dim=dim
    def sub(s,x,y): return s.add(x,s.neg(y))
Rr=Alg(lambda a,b:a+b,lambda a:-a,lambda a,b:a*b,lambda a:a,Fr(0),Fr(1),1)
def CD(K):
    Z=(K.zero,K.zero); one=(K.one,K.zero)
    def add(z,w): return (K.add(z[0],w[0]),K.add(z[1],w[1]))
    def neg(z): return (K.neg(z[0]),K.neg(z[1]))
    def mul(z,w):
        a,b=z;c,d=w
        return (K.sub(K.mul(a,c),K.mul(K.star(d),b)), K.add(K.mul(d,a),K.mul(b,K.star(c))))
    def star(z): return (K.star(z[0]),K.neg(z[1]))
    return Alg(add,neg,mul,star,Z,one,2*K.dim)
C=CD(Rr); H=CD(C); O=CD(H); S=CD(O)
def flat(z):
    if isinstance(z,Fr): return [z]
    return flat(z[0])+flat(z[1])
def build(vs):
    if len(vs)==1: return vs[0]
    h=len(vs)//2; return (build(vs[:h]),build(vs[h:]))
def mk(vec): return build([Fr(v) for v in vec])
def Nrm(z): return S.mul(z,S.star(z))[0]
def bilin(x,y): return S.add(S.mul(x,S.star(y)), S.mul(y,S.star(x)))[0]
x=mk(e(4)); y=mk(e(15)); z=mk(add(e(1),e(10)))
L=bilin(S.mul(x,z),S.mul(y,z))         # O element
R=O.mul(bilin(x,y),Nrm(z))             # O element
print("\nbilin(xz,yz).re.re.re        =", flat(L)[0])
print("(bilin x y * Nrm z).re.re.re =", flat(R)[0])
print("(full O of LHS):", [int(v) for v in flat(L)])
print("(full O of RHS):", [int(v) for v in flat(R)])
