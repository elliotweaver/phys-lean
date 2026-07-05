# Verify the exact combinatorial identity we need for the Lean per-N proof.
# cosTermC(a+b) N = (-1)^N (a+b)^(2N)/(2N)!
#   (a+b)^(2N) = sum_{j=0}^{2N} C(2N,j) a^j b^(2N-j)
# ccCoeff a b N = sum_{k=0}^{N} (-1)^N a^(2k) b^(2(N-k)) / ( (2k)! (2(N-k))! )
#              = (-1)^N/(2N)! * sum_{k} C(2N,2k) a^(2k) b^(2N-2k)   [even j=2k]
# ssCoeff a b (N-1) = sum_{k=0}^{N-1} (-1)^(N-1) a^(2k+1) b^(2(N-1-k)+1) / ((2k+1)!(2(N-1-k)+1)!)
#   powers: a^(2k+1) b^(2N-2k-1), total 2N.  j=2k+1 (odd), from 1 to 2N-1.
#   = (-1)^(N-1)/(2N)! * sum_{k} C(2N,2k+1) a^(2k+1) b^(2N-2k-1)
# So ccCoeff a b N - ssCoeff a b (N-1)
#   = (-1)^N/(2N)! * [ sum_even C(2N,2k) a^(2k)b^(2N-2k) + sum_odd C(2N,2k+1) a^(2k+1)b^(2N-2k-1) ]
#   = (-1)^N/(2N)! * sum_{j=0}^{2N} C(2N,j) a^j b^(2N-j)   [even + odd = all j]
#   = (-1)^N/(2N)! * (a+b)^(2N) = cosTermC(a+b) N.  QED
#
# The Lean key: a full-range binomial sum splits into even-index + odd-index parts.
# We already have sum_range_odd_split for length 2m+1.  Here the range is 2N+1 (j=0..2N).
from fractions import Fraction as F
from math import comb, factorial

def check(N,a,b):
    full = sum(comb(2*N,j)*a**j*b**(2*N-j) for j in range(2*N+1))
    even = sum(comb(2*N,2*k)*a**(2*k)*b**(2*N-2*k) for k in range(N+1))
    odd  = sum(comb(2*N,2*k+1)*a**(2*k+1)*b**(2*N-2*k-1) for k in range(N))
    return full == even+odd, (a+b)**(2*N) == full

a,b=F(3,7),F(5,11)
for N in range(6):
    print(N, check(N,a,b))
