import numpy as np
def M(mapping):
    A=np.zeros((7,7))
    for j,img in mapping.items():
        for i,coef in img: A[i-1,j-1]=coef
    return A
Q  = M({1:[],2:[(3,1)],3:[(2,-1)],4:[(5,1)],5:[(4,-1)],6:[(7,-1)],7:[(6,1)]})
Y  = M({1:[(5,-1)],2:[(6,-1)],3:[(7,-1)],4:[],5:[(1,1)],6:[(2,1)],7:[(3,1)]})
T3 = M({1:[],2:[(3,2)],3:[(2,-2)],4:[],5:[],6:[(7,2)],7:[(6,-2)]})
def comm(A,B): return A@B-B@A
def vec(A): return np.array([A[i,j] for i in range(7) for j in range(i+1,7)])
QY=comm(Q,Y)
B=np.array([vec(Q),vec(Y),vec(T3)]).T
coef,res,rk,sv=np.linalg.lstsq(B,vec(QY),rcond=None)
print("[Q,Y] in span{Q,Y,T3}? residual=",round(np.linalg.norm(B@coef-vec(QY)),6)," coef=",np.round(coef,3))
# proper Lie closure via basis of vectors + matrices
def closure(gens):
    mats=list(gens); V=[vec(m) for m in mats]
    Vm=np.array(V)
    def rank(Vm): return np.linalg.matrix_rank(Vm,tol=1e-9)
    changed=True
    while changed:
        changed=False
        cur=len(mats)
        for i in range(cur):
            for j in range(i+1,cur):
                c=comm(mats[i],mats[j])
                if np.allclose(c,0): continue
                test=np.vstack([Vm,vec(c)])
                if rank(test)>rank(Vm):
                    mats.append(c); Vm=test; changed=True
    return mats,rank(Vm)
mats,d=closure([Q,Y])
print("dim of Lie algebra <Q,Y> =",d)
Vm=np.array([vec(m) for m in mats])
print("T3 in <Q,Y>?", np.linalg.matrix_rank(np.vstack([Vm,vec(T3)]),tol=1e-9)==d)
mats2,d2=closure([Q,Y,T3])
print("dim of Lie algebra <Q,Y,T3> =",d2)
