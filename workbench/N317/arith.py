from fractions import Fraction as F
from math import comb

# One chiral generation, Furey/ladder picture: one chirality S+ = exterior algebra of the colour 3.
# occupation k=0..3, multiplicity C(3,k), electric charge Q = k/3 (ladder number/3).
def trQ2_ladder():
    s = F(0)
    for k in range(4):
        q = F(k, 3)
        s += comb(3, k) * q * q      # S+
        s += comb(3, k) * q * q      # S- (conjugate, Q -> -Q, same |Q|)
    return s
print('Tr(Q^2) ladder over 16 =', trQ2_ladder())   # expect 16/3

# Standard SM 15-state generation (all left-handed), the DEFINITIVE check
gen = [('QL_u', F(2,3), F(1,2), 3), ('QL_d', F(-1,3), F(-1,2), 3),
       ('uc', F(-2,3), F(0), 3), ('dc', F(1,3), F(0), 3),
       ('L_nu', F(0), F(1,2), 1), ('L_e', F(-1), F(-1,2), 1),
       ('ec', F(1), F(0), 1)]
trT3sq = sum(m*t3*t3 for _, q, t3, m in gen)
trQsq  = sum(m*q*q   for _, q, t3, m in gen)
trQT3  = sum(m*q*t3  for _, q, t3, m in gen)
trY2   = sum(m*(q-t3)**2 for _, q, t3, m in gen)   # y := Q - T3
print('Tr(T3^2) =', trT3sq, ' Tr(Q^2) =', trQsq, ' Tr(QT3) =', trQT3, ' Tr(y^2) =', trY2)
print('Tr(y^2)/Tr(T3^2) =', trY2/trT3sq, '  (target 5/3)')
print('sin^2 = Tr(T3^2)/(Tr(T3^2)+Tr(y^2)) =', trT3sq/(trT3sq+trY2), '  (target 3/8)')
print('sin^2 = Tr(T3^2)/Tr(Q^2) =', trT3sq/trQsq, '  (Weinberg GUT form, target 3/8)')

# occupation-number moments over one chirality (S+): dims C(3,k), value k
print('Sum_k C(3,k) =', sum(comb(3,k) for k in range(4)))       # 8 states
print('Sum_k C(3,k)*k =', sum(comb(3,k)*k for k in range(4)))   # Tr N over S+
print('Sum_k C(3,k)*k^2 =', sum(comb(3,k)*k*k for k in range(4)))  # 24
