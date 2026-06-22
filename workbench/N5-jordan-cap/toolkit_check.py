"""Quick: octonion associator is alternating + vanishes on repeats (the toolkit)."""
from fractions import Fraction as F
import random
from fast import omul, oadd, osub, oneg, ostar, oz, ois0

def assoc(a,b,c): return osub(omul(omul(a,b),c), omul(a,omul(b,c)))
def rand_oct(rng): return [F(rng.randint(-2,2)) for _ in range(8)]

rng=random.Random(7)
ok_anti12=ok_anti23=ok_diagll=ok_diagrr=True
for _ in range(400):
    a=rand_oct(rng); b=rand_oct(rng); c=rand_oct(rng)
    if not ois0(oadd(assoc(a,b,c),assoc(b,a,c))): ok_anti12=False
    if not ois0(oadd(assoc(a,b,c),assoc(a,c,b))): ok_anti23=False
    if not ois0(assoc(a,a,b)): ok_diagll=False
    if not ois0(assoc(a,b,b)): ok_diagrr=False
print("assoc antisym swap(1,2):", ok_anti12)
print("assoc antisym swap(2,3):", ok_anti23)
print("[x,x,y]=0 (left alt):", ok_diagll)
print("[x,y,y]=0 (right alt):", ok_diagrr)

# also: the *-anti-automorphism: star(x*y)=star(y)*star(x); and N(x)=x*star(x) is real/central.
ok_star=ok_real=True
for _ in range(400):
    a=rand_oct(rng); b=rand_oct(rng)
    if not ois0(osub(ostar(omul(a,b)), omul(ostar(b),ostar(a)))): ok_star=False
    n=omul(a,ostar(a))
    if any(n[k]!=0 for k in range(1,8)): ok_real=False   # N(a) is a scalar
print("star anti-automorphism:", ok_star)
print("x*star(x) is real scalar:", ok_real)
