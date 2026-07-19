from fractions import Fraction as F

# endpoint(f) = base + f*S,  base = 2425/18, S = screening magnitude at depth-1 (f=1)
base = F(2425, 18)
bare = F(136307188, 1000000)          # banked recomposedEndpoint (f=1)
S = bare - base

w = F(1,3)
S3 = 1+w+w**2       # 13/9
S4 = 1+w+w**2+w**3  # 40/27
Sinf = 1/(1-w)      # 3/2  (the FORCED all-orders fixed point)

def endpoint(f): return base + f*S

measured = F(137035999, 1000000)  # 137.035999 (removable prose, NOT a proof input)

print("ENDPOINT VALUES (base + f*S):")
print("  f=S1=1     depth-1 (bare)        endpoint = %.6f" % float(endpoint(F(1))))
print("  f=S3=13/9  depth-3 truncation    endpoint = %.6f   <-- window LOWER edge" % float(endpoint(S3)))
print("  f=meas                            endpoint = %.6f   (MEASURED 1/alpha(0))" % float(measured))
print("  f=S4=40/27 depth-4 truncation    endpoint = %.6f   <-- window UPPER edge" % float(endpoint(S4)))
print("  f=Sinf=3/2 ALL-ORDERS (FORCED)   endpoint = %.6f   <-- fold's forced landing" % float(endpoint(Sinf)))
print()
print("The requested (S3,S4) 'window' = (%.6f, %.6f) endpoint span" % (float(endpoint(S3)), float(endpoint(S4))))
print("MEASURED value %.6f lies INSIDE it. FORCED value %.6f lies ABOVE it." % (float(measured), float(endpoint(Sinf))))
print()
print("Gap forced->measured: %.6f (+%.3f%%)" % (float(endpoint(Sinf)-measured), 100*float((endpoint(Sinf)-measured)/measured)))
print()
print("CONCLUSION: the (S3,S4) window is the pair of consecutive geometric partial-sum")
print("truncations that BRACKET the measured value. The fold FORCES the all-orders sum (3/2),")
print("which is ABOVE the window. Landing inside requires per-band FINITE TRUNCATION of the")
print("forced all-orders resummation -- selected per-band only to hit the data window.")
