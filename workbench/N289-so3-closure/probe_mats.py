"""Compute the explicit constant matrices Mc=[sA1,sB1], Ma=[sB1,sC1], Mb=[sC1,sA1]."""
from fractions import Fraction as F
# work over ℚ only (real-unit slots have real entries); model octonion as its real part here
def sA1():  # slotA 1 = Xz 1 0 0 : (0,1)=1,(1,0)=1
    return {(0,1):F(1),(1,0):F(1)}
def sB1():  # slotB 1 = Xz 0 1 0 : (0,2)=1,(2,0)=1
    return {(0,2):F(1),(2,0):F(1)}
def sC1():  # slotC 1 = Xz 0 0 1 : (1,2)=1,(2,1)=1
    return {(1,2):F(1),(2,1):F(1)}
def mget(M,i,j): return M.get((i,j),F(0))
def mmul(A,B): return {(i,j):sum(mget(A,i,k)*mget(B,k,j) for k in range(3)) for i in range(3) for j in range(3)}
def msub(A,B): return {(i,j):mget(A,i,j)-mget(B,i,j) for i in range(3) for j in range(3)}
def comm(A,B): return msub(mmul(A,B),mmul(B,A))
def show(nm,M):
    print(nm, {k:v for k,v in M.items() if v!=0})
Mc=comm(sA1(),sB1()); Ma=comm(sB1(),sC1()); Mb=comm(sC1(),sA1())
show("Mc=[sA1,sB1]",Mc)
show("Ma=[sB1,sC1]",Ma)
show("Mb=[sC1,sA1]",Mb)
show("[Mc,Ma]-Mb (should be 0)", msub(comm(Mc,Ma),Mb))
