from fractions import Fraction as F

# Banked amplitude brackets over derived R Cut (GenerationMassRatiosNumeric)
b0_lo, b0_hi = F(237943, 100000), F(237944, 100000)
b1_lo, b1_hi = F(4034, 100000), F(40365, 1000000)
b2_lo, b2_hi = F(5802, 10000), F(58022, 100000)
sur = F(2, 3)
deficit = 1 - sur  # 1/3


def edge_mix2_bracket(Alo, Ahi, Blo, Bhi):
    # up=(A,B); down=(A, sur*B). cross = A*B*(1-sur). Nu=A^2+B^2; Nd=A^2+(sur*B)^2
    # cross bracket (A,B>0):
    cross_lo = Alo * Blo * deficit
    cross_hi = Ahi * Bhi * deficit
    # Nu bracket
    Nu_lo = Alo**2 + Blo**2
    Nu_hi = Ahi**2 + Bhi**2
    # Nd bracket
    Nd_lo = Alo**2 + (sur * Blo)**2
    Nd_hi = Ahi**2 + (sur * Bhi)**2
    den_lo = Nu_lo * Nd_lo
    den_hi = Nu_hi * Nd_hi
    # mix2 lower: cross_lo^2 / den_hi ; upper: cross_hi^2 / den_lo
    m2_lo = cross_lo**2 / den_hi
    m2_hi = cross_hi**2 / den_lo
    return cross_lo, cross_hi, Nu_lo, Nu_hi, Nd_lo, Nd_hi, m2_lo, m2_hi


print("=== 1-3 edge (b0, b1): A=b0 leading, B=b1 dressed ===")
r = edge_mix2_bracket(b0_lo, b0_hi, b1_lo, b1_hi)
cl, ch, nul, nuh, ndl, ndh, m2l, m2h = r
print("cross  in [%s, %s] ~ [%.6f, %.6f]" % (cl, ch, float(cl), float(ch)))
print("Nu     in [%.6f, %.6f]" % (float(nul), float(nuh)))
print("Nd     in [%.6f, %.6f]" % (float(ndl), float(ndh)))
print("mix2   in [%.10g, %.10g]" % (float(m2l), float(m2h)))
print("  suggested bracket: [%d/1e9, %d/1e9]" % (int(float(m2l)*1e9)-1, int(float(m2h)*1e9)+2))
print()

print("=== 2-3 edge (b2, b1): A=b2 leading, B=b1 dressed ===")
r = edge_mix2_bracket(b2_lo, b2_hi, b1_lo, b1_hi)
cl, ch, nul, nuh, ndl, ndh, m2l, m2h = r
print("cross  in [%s, %s] ~ [%.6f, %.6f]" % (cl, ch, float(cl), float(ch)))
print("Nu     in [%.6f, %.6f]" % (float(nul), float(nuh)))
print("Nd     in [%.6f, %.6f]" % (float(ndl), float(ndh)))
print("mix2   in [%.10g, %.10g]" % (float(m2l), float(m2h)))
print("  suggested bracket: [%d/1e8, %d/1e8]" % (int(float(m2l)*1e8)-1, int(float(m2h)*1e8)+2))
print()

print("=== 1-2 edge (banked C2 cabMix2) in [60740/1e7, 60770/1e7] = [0.0060740, 0.0060770] ===")
print()

# The ordering: mix2_12 > mix2_23 > mix2_13
print("ORDERING CHECK (disjointness of brackets):")
print("mix2_12_lo = 0.0060740 ; mix2_23_hi ~ %.8f" % float(edge_mix2_bracket(b2_lo,b2_hi,b1_lo,b1_hi)[7]))
print("mix2_23_lo ~ %.8f ; mix2_13_hi ~ %.8f" % (
    float(edge_mix2_bracket(b2_lo,b2_hi,b1_lo,b1_hi)[6]),
    float(edge_mix2_bracket(b0_lo,b0_hi,b1_lo,b1_hi)[7])))

# Structural WHY: mix2 ~ (1-sur)^2 (B/A)^2 to leading order; ordering governed by B/A ratio
print()
print("=== STRUCTURAL WHY: the sub/leading amplitude ratio governs the order ===")
b0m, b1m, b2m = (b0_lo+b0_hi)/2, (b1_lo+b1_hi)/2, (b2_lo+b2_hi)/2
print("ratio 1-2  b2/b0 = %.6f" % float(b2m/b0m))
print("ratio 2-3  b1/b2 = %.6f" % float(b1m/b2m))
print("ratio 1-3  b1/b0 = %.6f" % float(b1m/b0m))
print("order forced by: b0>b2 (amp order) AND b2^2 vs b0*b1:")
print("  b2^2   = %.6f" % float(b2m**2))
print("  b0*b1  = %.6f" % float(b0m*b1m))
print("  b2^2 > b0*b1 ?", b2m**2 > b0m*b1m)
