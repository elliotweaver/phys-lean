from fast import omul,oadd,osub,oneg,ostar,oz,E
from cd import basis, flatten, mul, from_coords
from fractions import Fraction as F

# Build the exact witness in O Q = CD(CD(Dbl Q)) coords (8 rationals, leaf order).
# w1 = iota(iotaJ): iotaJ is ι J in H Q. Let's construct via cd.py embeddings.
# Octonion level3: x = ((re_H),(im_H)) each H level2 = ((c),(c')) each Dbl level1=(a,b).
# iota: O <- H maps h -> (h, 0_H).
# J in Dbl Q = (0,1) at level1. ιJ in H = iota_H(J) = (J,0)=((0,1),(0,0)) level2.
# w1 = iota_O(ιJ) = (ιJ, 0_H) = (((0,1),(0,0)), ((0,0),(0,0)))
w1 = (((F(0),F(1)),(F(0),F(0))), ((F(0),F(0)),(F(0),F(0))))
# e2 of H = (0_Dbl, 1_Dbl) = ((0,0),(1,0)) level2.
e2H = ((F(0),F(0)),(F(1),F(0)))
# w2 = iota_O(e2H) = (e2H, 0_H)
w2 = (e2H, ((F(0),F(0)),(F(0),F(0))))
# w3 = e2 of O = (0_H, 1_H); 1_H = ((1,0),(0,0))
w3 = (((F(0),F(0)),(F(0),F(0))), ((F(1),F(0)),(F(0),F(0))))

def A(x,y,z):
    return osub_nested(mul(mul(x,y),z), mul(x,mul(y,z)))
def osub_nested(a,b):
    if isinstance(a,F): return a-b
    return (osub_nested(a[0],b[0]), osub_nested(a[1],b[1]))

assoc = A(w1,w2,w3)
print("witness associator flatten coords:", [str(v) for v in flatten(assoc)])
# index map: re.re.re=0, re.re.im=1, re.im.re=2, re.im.im=3, im.re.re=4, im.re.im=5, im.im.re=6, im.im.im=7
