import numpy as np
def M(mapping):
    A=np.zeros((7,7))
    for j,img in mapping.items():
        for i,coef in img: A[i-1,j-1]=coef
    return A
# idx0..6 = u1,e2,e3,e4(=kO1),e5,e6,e7
Q  = M({1:[],2:[(3,1)],3:[(2,-1)],4:[(5,1)],5:[(4,-1)],6:[(7,-1)],7:[(6,1)]})   # crossOp(u1)
Y  = M({1:[(5,-1)],2:[(6,-1)],3:[(7,-1)],4:[],5:[(1,1)],6:[(2,1)],7:[(3,1)]})   # crossOp(kO1=e4)
def comm(A,B): return A@B-B@A
def e(i): 
    v=np.zeros(7); v[i]=1; return v
QY=comm(Q,Y)
# u1 x kO1 = crossOp(u1)(e4) = Q@e(3)
u1_x_kO1 = Q@e(3)
print("u1 x kO1 (= Q(kO1)) =", u1_x_kO1.astype(int), " -> which unit?")
# so u1 x kO1 = e5 (idx4)? 
# crossOp(e5) matrix: need the multiplication table. Instead: is QY proportional to crossOp(some unit)?
# QY sends: u1->? 
for i in range(7):
    img=QY@e(i)
    nz=[(j,int(img[j])) for j in range(7) if abs(img[j])>1e-9]
    print(f"[Q,Y](e{i+1}) = {nz}")
print()
print("u1 x kO1 lands on unit index:", [j for j in range(7) if abs(u1_x_kO1[j])>1e-9])
