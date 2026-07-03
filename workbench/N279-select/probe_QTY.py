import numpy as np
def M(mapping):
    A = np.zeros((7,7))
    for j,img in mapping.items():
        for i,coef in img:
            A[i-1, j-1] = coef
    return A
# Q = chargeOp = crossOp(u1), from Cmat (N253)
Q = M({1:[], 2:[(3,1)], 3:[(2,-1)], 4:[(5,1)], 5:[(4,-1)], 6:[(7,-1)], 7:[(6,1)]})
# Y = hyperOp = crossOp(kappaO1)=crossOp(e4), from N278 action lemmas
Y = M({1:[(5,-1)], 2:[(6,-1)], 3:[(7,-1)], 4:[], 5:[(1,1)], 6:[(2,1)], 7:[(3,1)]})
# T3 = imRep(DI) = qI Imat (N253)
T3 = M({1:[], 2:[(3,2)], 3:[(2,-2)], 4:[], 5:[], 6:[(7,2)], 7:[(6,-2)]})
def comm(A,B): return A@B - B@A
print("Q antisym?", np.allclose(Q,-Q.T), "Y antisym?", np.allclose(Y,-Y.T), "T3 antisym?", np.allclose(T3,-T3.T))
print("[Q,T3]==0:", np.allclose(comm(Q,T3),0), " [Y,T3]==0:", np.allclose(comm(Y,T3),0), " [Q,Y]==0:", np.allclose(comm(Q,Y),0))
QY = comm(Q,Y)
print("[Q,Y] =\n", QY.astype(int))
print("[Q,Y] antisym?", np.allclose(QY,-QY.T))
