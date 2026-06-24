from fractions import Fraction as F
from model import o_mul, o_star, o_from_vec, o_to_vec
import pickle, random
N=8
data=pickle.load(open('nullbasis.pkl','rb'))
mats=[[[F(x) for x in row] for row in m] for m in data['mats']]
def applyM(M,v): return [sum(M[a][i]*v[i] for i in range(N)) for a in range(N)]
def reQ(o): return o_to_vec(o)[0]
random.seed(1)
def rv(): return [F(random.randint(-3,3)) for _ in range(N)]
ok_skew=True; ok_tracefree=True; ok_bskew=True
def bQ(a,b): return reQ(o_mul(a,o_star(b)))
for M in mats:
  for _ in range(30):
    xv=rv(); yv=rv()
    x=o_from_vec(xv); y=o_from_vec(yv)
    Dx=o_from_vec(applyM(M,xv)); Dy=o_from_vec(applyM(M,yv))
    if reQ(o_mul(x,Dy)) + reQ(o_mul(y,Dx))!=0: ok_skew=False
    if reQ(Dx)!=0: ok_tracefree=False
    if bQ(Dx,y)+bQ(x,Dy)!=0: ok_bskew=False
print('reQ(x*Dy)+reQ(y*Dx)==0 for all basis D:', ok_skew)
print('reQ(Dx)==0 (trace-free) for all basis D:', ok_tracefree)
print('bQ(Dx,y)+bQ(x,Dy)==0 (literal skew):', ok_bskew)
