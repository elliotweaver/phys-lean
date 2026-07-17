from fractions import Fraction as F
b0_lo=F(237943,100000); b0_hi=F(237944,100000)
b2_lo=F(58020,100000); b2_hi=F(58022,100000)  # 5802/10000 = 58020/100000
r_lo = b2_lo/b0_hi; r_hi = b2_hi/b0_lo
print('b2/b0 actual range', float(r_lo), float(r_hi))
L=F(24383,100000); U=F(24385,100000)
print('undressed bracket valid:', L<=r_lo, r_hi<=U)
print('L*b0_hi <= b2_lo ?', L*b0_hi<=b2_lo)
print('b2_hi <= U*b0_lo ?', b2_hi<=U*b0_lo)
d_lo=F(2,3)*r_lo; d_hi=F(2,3)*r_hi
print('dressed actual', float(d_lo), float(d_hi))
DL=F(16255,100000); DU=F(16257,100000)
print('(2/3)*L', float(F(2,3)*L), '(2/3)*U', float(F(2,3)*U))
print('dressed bracket contains actual:', DL<=d_lo, d_hi<=DU)
print('DL <= (2/3)*L:', DL<=F(2,3)*L, '  (2/3)*U <= DU:', F(2,3)*U<=DU)
print('DL^2',float(DL*DL),'DU^2',float(DU*DU))
