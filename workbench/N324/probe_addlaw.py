# Numerical check of the per-N addition-formula combinatorial identity (Python, exact rationals)
# cutCos(a+b) = cutCos a cutCos b - cutSin a sin b :  match the N-th Cauchy coefficient.
#
# cutCos(a+b) = sum_N cosTermC(a+b) N,  cosTermC(a+b) N = (-1)^N (a+b)^(2N)/(2N)!
# ccCoeff a b N = sum_{k+l=N} cosTermC a k cosTermC b l
# ssCoeff a b N = sum_{k+l=N} sinTermC a k sinTermC b l
#   sinTermC a k = (-1)^k a^(2k+1)/(2k+1)!
# Claim: cosTermC(a+b) N = ccCoeff a b N - ssCoeff a b (N-1)   (with ssCoeff at "-1" = 0 for N=0)
from fractions import Fraction as F
from math import comb, factorial

def cosTerm(x, n): return F((-1)**n) * x**(2*n) / factorial(2*n)
def sinTerm(x, n): return F((-1)**n) * x**(2*n+1) / factorial(2*n+1)

def ccCoeff(a,b,N): return sum(cosTerm(a,k)*cosTerm(b,N-k) for k in range(N+1))
def ssCoeff(a,b,N): return sum(sinTerm(a,k)*sinTerm(b,N-k) for k in range(N+1))
def cosTermSum(a,b,N): return F((-1)**N)*(a+b)**(2*N)/factorial(2*N)

a, b = F(3,7), F(5,11)
print("cos(a+b) addition per-N:")
ok=True
for N in range(6):
    lhs = cosTermSum(a,b,N)
    rhs = ccCoeff(a,b,N) - (ssCoeff(a,b,N-1) if N>=1 else F(0))
    good = (lhs==rhs)
    ok = ok and good
    print(f"  N={N}: lhs={lhs}  rhs={rhs}  match={good}")
print("ALL cos match:", ok)

# sin addition:  cutSin(a+b) = cutSin a cutCos b + cutCos a cutSin b
def scCoeff(a,b,N): return sum(sinTerm(a,k)*cosTerm(b,N-k) for k in range(N+1))
def csCoeff(a,b,N): return sum(cosTerm(a,k)*sinTerm(b,N-k) for k in range(N+1))
def sinTermSum(a,b,N): return F((-1)**N)*(a+b)**(2*N+1)/factorial(2*N+1)
print("\nsin(a+b) addition per-N:")
ok2=True
for N in range(6):
    lhs = sinTermSum(a,b,N)
    rhs = scCoeff(a,b,N) + csCoeff(a,b,N)
    good=(lhs==rhs); ok2=ok2 and good
    print(f"  N={N}: match={good}")
print("ALL sin match:", ok2)
