import sympy as sp
A1, B1, A2, B2, s = sp.symbols('A1 B1 A2 B2 s', positive=True)

def eCross(A, B): return A*B*(1-s)
def eNu(A, B): return A**2 + B**2
def eNd(A, B): return A**2 + (s*B)**2

# P = eCross(A2,B2)^2 * eNu(A1,B1)*eNd(A1,B1) - eCross(A1,B1)^2 * eNu(A2,B2)*eNd(A2,B2)
P = eCross(A2, B2)**2 * eNu(A1, B1)*eNd(A1, B1) - eCross(A1, B1)**2 * eNu(A2, B2)*eNd(A2, B2)
factored = (1-s)**2 * (A1**2*B2**2 - A2**2*B1**2) * (A1**2*A2**2 - s**2*B1**2*B2**2)
print("P - factored simplifies to:", sp.simplify(sp.expand(P - factored)))
