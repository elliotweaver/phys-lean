from mpmath import mp, mpf, sqrt, cos, log, e, factorial
from fractions import Fraction as F
mp.dps = 90

q = 1/sqrt(2); p = cos(mpf(2)/9); w = sqrt(2); r = sqrt(3-3*p*p)
b0=1+w*p; b2=1-w*(p-r)/2
mass0=b0*b0; mass2=b2*b2
foldPhaseBorn=(1-q)**2/(2*(1+q)); mbRatio=foldPhaseBorn*(mpf(2)/3)

def rem_bound(a, N):
    # expRemBound q N (assume = q^N/N! * something). ContinuumBracket expRemBound:
    # standard tail bound a^N/N! * (N+1)/N or similar. Use a^N/N!*2 as safe over-est for a<N
    return mpf(a)**N/factorial(N)*2

def need_N_for_width(a_val, target_relerr):
    for N in range(2,60):
        if mpf(a_val)**N/factorial(N) < target_relerr:
            return N
    return None

print("=== L_b0 = cutLog mass0, true", log(mass0))
print("mass0 NB11 sharp: [5.661726012625402, 5.661726012625422] width ~2e-14")
print("N for a=1.734, rem<1e-14:", need_N_for_width(1.734,1e-14))
print("N for a=1.734, rem<1e-10:", need_N_for_width(1.734,1e-10))
print("N for a=1.734, rem<1e-8:", need_N_for_width(1.734,1e-8))

print()
print("=== L_b2 via 1/mass2, cutLog(1/mass2) true", log(1/mass2))
print("1/mass2 ~2.9704805; need exp at ~1.0887")
print("N for a=1.089, rem<1e-8:", need_N_for_width(1.089,1e-8))
print("N for a=1.089, rem<1e-10:", need_N_for_width(1.089,1e-10))

print()
print("=== L_mb: mbRatioDerived exact algebraic =", mbRatio)
print("cutLog(1/mbRatio) true", log(1/mbRatio))
print("1/mbRatio =", 1/mbRatio, "~59.7  -> exp at ~4.089")
print("N for a=4.09, rem<1e-8:", need_N_for_width(4.09,1e-8))
print("N for a=4.09, rem<1e-6:", need_N_for_width(4.09,1e-6))
print("N for a=4.09, rem<1e-10:", need_N_for_width(4.09,1e-10))

# mbRatio exact rational-in-sqrt: (1-q)^2/(3(1+q)), q=1/sqrt2
# rationalize: multiply num and den. Let s=sqrt2. q=1/s. 
# (1-1/s)^2 = 1 - 2/s + 1/2 = 3/2 - 2/s = 3/2 - sqrt2
# 3(1+1/s) = 3 + 3/s = 3 + (3/2)sqrt2
# mbRatio = (3/2 - sqrt2)/(3 + (3/2)sqrt2)
print()
print("mbRatio closed check (3/2 - sqrt2)/(3 + 3/2 sqrt2) =", (mpf(3)/2 - sqrt(2))/(3 + mpf(3)/2*sqrt(2)))
