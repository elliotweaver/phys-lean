"""
N2d — search for explicit witnesses x,y in CD A (functions of base a,b,c) whose
norm-defect D(x,y) := N(xy) - N(x)N(y) is a PURE base associator, i.e. vanishes
identically when A is associative and equals a nonzero multiple of an associator
[a,b,c] = (ab)c - a(bc) otherwise.

Such a pair is the witness for the FORCED stop:  N multiplicative => A associative.

We fill the re/im slots of x=(xr,xi), y=(yr,yi) from a small set of base
expressions (letters, conjugates, simple products). We work in the FREE
NON-ASSOCIATIVE *-algebra (so an associator is genuinely nonzero) and also in an
ASSOCIATIVE quotient (flatten trees) to confirm D vanishes there.
"""
from collections import defaultdict
import itertools

def leaf(i, conj=False): return {('gc' if conj else 'g', i): 1}
def aadd(x, y):
    r = defaultdict(int, x)
    for m, c in y.items():
        r[m] += c
        if r[m] == 0: del r[m]
    return dict(r)
def aneg(x): return {m: -c for m, c in x.items()}
def asub(x, y): return aadd(x, aneg(y))
ONEM = ('one',)
def amul(x, y):
    r = defaultdict(int)
    for mx, cx in x.items():
        for my, cy in y.items():
            if mx == ONEM and my == ONEM: key = ONEM
            elif mx == ONEM: key = my
            elif my == ONEM: key = mx
            else: key = (mx, my)
            r[key] += cx*cy
            if r[key] == 0: del r[key]
    return dict(r)
def astar_mono(m):
    if m == ONEM: return ONEM
    if m[0] in ('g', 'gc'): return ('gc' if m[0]=='g' else 'g', m[1])
    L, R = m
    return (astar_mono(R), astar_mono(L))
def astar(x): return {astar_mono(m): c for m, c in x.items()}
def cd_mul(z, w):
    a, b = z; c, d = w
    return (asub(amul(a,c), amul(astar(d), b)), aadd(amul(d,a), amul(b, astar(c))))
def nrm(z):
    re, im = z
    return aadd(amul(re, astar(re)), amul(astar(im), im))
def D_of(x, y): return asub(nrm(cd_mul(x,y)), amul(nrm(x), nrm(y)))

def leaves(m):
    if m == ONEM: return ()
    if m[0] in ('g','gc'): return (m,)
    return leaves(m[0]) + leaves(m[1])
def assoc_reduce(elt):
    r = defaultdict(int)
    for m, c in elt.items():
        r[leaves(m)] += c
        if r[leaves(m)] == 0: del r[leaves(m)]
    return dict(r)

a, b, c = leaf(0), leaf(1), leaf(2)
A, B, C = leaf(0,True), leaf(1,True), leaf(2,True)
one = {ONEM:1}; zero = {}

# slot vocabulary: letters, conjugates, unit, zero, and a few products
slots = {
    '0':zero, '1':one,
    'a':a,'b':b,'c':c, 'A':A,'B':B,'C':C,
    'ab':amul(a,b),'bc':amul(b,c),'ba':amul(b,a),'cb':amul(c,b),
}

# associator references (and conjugate variants)
def assoc(u,v,w): return asub(amul(amul(u,v),w), amul(u,amul(v,w)))
refs = {}
for nm,(u,v,w) in {
    '[a,b,c]':(a,b,c), '[c,b,a]':(c,b,a),
    '[a,b,C]':(a,b,C), '[A,b,c]':(A,b,c),
    '[a,B,c]':(a,B,c),
}.items():
    refs[nm]=assoc(u,v,w)

def matches(D):
    out=[]
    for nm,rf in refs.items():
        if D==rf: out.append('+'+nm)
        if D==aneg(rf): out.append('-'+nm)
    return out

print("Searching for witnesses whose defect VANISHES under associativity (pure assoc obstruction)...")
keys=list(slots.keys())
pure=[]
for fill in itertools.product(keys, repeat=4):
    xr,xi,yr,yi = (slots[k] for k in fill)
    D=D_of((xr,xi),(yr,yi))
    if not D: continue
    if assoc_reduce(D):   # nonzero even when associative -> not pure
        continue
    pure.append((len(D), fill, D))
pure.sort(key=lambda t:t[0])
print(f"  found {len(pure)} pure-associator witnesses")
for n,fill,D in pure[:15]:
    print(f"   fill(xr,xi,yr,yi)={fill}  D:{n} terms  matches={matches(D)}")

if pure:
    n,fill,D=pure[0]
    print("\nSimplest pure-associator witness in full:")
    print("  fill (xr,xi,yr,yi) =",fill)
    for m,co in sorted(D.items(),key=lambda kv:str(kv[0])):
        print(f"    {co:+d} * {m}")
    print("  assoc_reduce(D) =", assoc_reduce(D), "(must be empty)")
