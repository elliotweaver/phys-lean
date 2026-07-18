from fractions import Fraction as F

# Banked amplitude brackets (over derived R Cut), from GenerationMassRatiosNumeric
b0_lo, b0_hi = F(237943, 100000), F(237944, 100000)
b1_lo, b1_hi = F(4034, 100000), F(40365, 1000000)
b2_lo, b2_hi = F(5802, 10000), F(58022, 100000)
sur = F(2, 3)  # survivalCut


def mid(lo, hi):
    return (lo + hi) / 2


b0, b1, b2 = mid(b0_lo, b0_hi), mid(b1_lo, b1_hi), mid(b2_lo, b2_hi)
print('midpoints: b0=%.6f b1=%.6f b2=%.6f' % (float(b0), float(b1), float(b2)))
print()


def mix2(A, B):
    # up frame (A,B); down frame (A, sur*B); cross=A*B*(1-sur); Nu=A^2+B^2; Nd=A^2+(sur*B)^2
    cross = A * B * (1 - sur)
    Nu = A * A + B * B
    Nd = A * A + (sur * B) ** 2
    return cross * cross / (Nu * Nd)


# three edges. Each edge is (leading amplitude, sub-leading amplitude) with the
# sub-leading (deeper) slot survival-dressed in the down frame.
# genVec slots: 0 = heaviest b0, 1 = lightest b1, 2 = middle b2.
edges = {
    '(b0,b2) 1-2 leading': (b0, b2),
    '(b0,b1) 1-3': (b0, b1),
    '(b2,b1) 2-3': (b2, b1),
}
for name, (A, B) in edges.items():
    m2 = mix2(A, B)
    print('%-22s mix2=%.9g  |Vmix|=%.6f  cross=%.6f' % (
        name, float(m2), float(m2) ** 0.5, float(A * B * (1 - sur))))
