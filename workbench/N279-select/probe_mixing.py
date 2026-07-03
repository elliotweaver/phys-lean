import numpy as np
def conj_n(x):
    y=x.copy(); y[1:]=-y[1:]; return y
def mul_cd(x,y,n):
    if n==1: return np.array([x[0]*y[0]])
    h=n//2; a,b=x[:h],x[h:]; c,d=y[:h],y[h:]
    return np.concatenate([mul_cd(a,c,h)-mul_cd(conj_n(d),b,h), mul_cd(d,a,h)+mul_cd(b,conj_n(c),h)])
def mul(x,y): return mul_cd(x,y,8)
def bE(i):
    v=np.zeros(8); v[i]=1; return v
E=[bE(i) for i in range(8)]
# crossOp(a) on ImO (7-dim, coords idx1..7 -> our 0..6)
def crossOp7(a):
    A=np.zeros((7,7))
    for j in range(1,8):
        p=mul(a,E[j]); A[:,j-1]=p[1:]
    return A
Q  = crossOp7(E[1])   # chargeOp = crossOp(u1)
Y  = crossOp7(E[4])   # hyperOp = crossOp(kappaO1=e4)
# T3 = imRep DI = 2*(the Cartan) - from Imat
T3=np.array([
 [0,0,0,0,0,0,0],[0,0,-2,0,0,0,0],[0,2,0,0,0,0,0],
 [0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,-2],[0,0,0,0,0,2,0]])
def comm(A,B): return A@B-B@A
def tr(A,B): return np.trace(A@B)   # trace form (proportional to Killing)
print("Trace form on so(7)-elements (traceForm7 = tr(A B)):")
print(" B(Q,Q)=",tr(Q,Q)," B(Y,Y)=",tr(Y,Y)," B(T3,T3)=",tr(T3,T3))
print(" B(Q,Y)=",tr(Q,Y)," B(Q,T3)=",tr(Q,T3)," B(Y,T3)=",tr(Y,T3))
print()
print("[T3,Y]==0?",np.allclose(comm(T3,Y),0)," [Q,T3]==0?",np.allclose(comm(Q,T3),0)," [Q,Y]==0?",np.allclose(comm(Q,Y),0))
print()
# Is Q in span{T3,Y}? project Q onto span{T3,Y} in the trace form
def vec(A): return np.array([A[i,j] for i in range(7) for j in range(i+1,7)])
B=np.array([vec(T3),vec(Y)]).T
coef,res,rk,sv=np.linalg.lstsq(B,vec(Q),rcond=None)
Qproj=B@coef
resid=vec(Q)-Qproj
print("Q = a*T3 + b*Y ? coefs a,b =",np.round(coef,4)," residual norm=",round(np.linalg.norm(resid),4))
print("So Q in span{T3,Y}?", np.linalg.norm(resid)<1e-9)
print()
# The 'mixing angle': angle between Q and the neutral plane / between Q and T3,Y directions
# In SM: Q = T3 + Y/2. Check normalized. Our T3 has scale 2 (doubling). Define t3 = T3/2 (unit-ish).
t3=T3/2.0
print("With t3=T3/2:  Q ?= t3 + c*Y")
B2=np.array([vec(t3),vec(Y)]).T
coef2,_,_,_=np.linalg.lstsq(B2,vec(Q),rcond=None)
print("  Q = a*t3+b*Y coefs=",np.round(coef2,4)," resid=",round(np.linalg.norm(B2@coef2-vec(Q)),4))
