from mpmath import mp, mpf, cos, sqrt, log, pi
mp.dps = 60
q = 1/sqrt(2)            # q = cutCos(cutPi/4), q^2 = 1/2
p = cos(mpf(2)/9)
w = sqrt(2)
r = sqrt(3 - 3*p*p)
b0 = 1 + w*p
b1 = 1 - w*(p+r)/2
b2 = 1 - w*(p-r)/2
mass0 = b0*b0; mass1 = b1*b1; mass2 = b2*b2
foldPhaseBorn = (1-q)**2 / (2*(1+q))
mbRatioDerived = foldPhaseBorn * (mpf(2)/3)
print("q =", q)
print("mbRatioDerived =", mbRatioDerived)
print("cutLog mbRatioDerived (L_mb) =", log(mbRatioDerived))
print("cutLog(1/mbRatioDerived) [charm edge, banked [4,41/10]] =", log(1/mbRatioDerived))
print("L_b0 = cutLog mass0 =", log(mass0), " banked [17/10,18/10]")
print("L_b2 = cutLog mass2 =", log(mass2), " banked [-12/10,-1]")
kappa = (1/pi)/3
L_m01 = log(mass0/mass1)
L_mb = log(mbRatioDerived)
L_b0 = log(mass0)
L_b2 = log(mass2)
C = 2*L_m01 + (mpf(7)/3)*L_mb + (mpf(11)/3)*L_b0 - (mpf(5)/3)*L_b2
endpoint = mpf(2425)/18 + kappa*C
print("C (combo) =", C)
print("recomposedEndpoint =", endpoint)
print()
# Width budget: how each input's bracket width contributes to endpoint width
# d endpoint/d L_m01 = 2*kappa ; d/d L_mb = (7/3)*kappa ; d/d L_b0 = (11/3)*kappa ; d/d L_b2 = -(5/3)*kappa
print("sensitivity 2*kappa =", 2*kappa)
print("sensitivity (7/3)*kappa =", (mpf(7)/3)*kappa)
print("sensitivity (11/3)*kappa =", (mpf(11)/3)*kappa)
print("sensitivity (5/3)*kappa =", (mpf(5)/3)*kappa)
# Current widths
print()
print("=== current bracket widths and endpoint-width contribution ===")
# L_m01 banked NB11 width 1e-11
print("L_m01 width 1e-11 -> contrib", 2*kappa*mpf('1e-11'))
# L_mb charm edge width [4,4.1] on 1/mbRatio -> L_mb width 0.1
print("L_mb width 0.1 -> contrib", (mpf(7)/3)*kappa*mpf('0.1'))
# L_b0 width 0.1
print("L_b0 width 0.1 -> contrib", (mpf(11)/3)*kappa*mpf('0.1'))
# L_b2 width 0.2
print("L_b2 width 0.2 -> contrib", (mpf(5)/3)*kappa*mpf('0.2'))
# kappa width: 1/cutPi width ~2e-12, times C/3
print("kappa=(1/cutPi)/3, 1/cutPi width 2e-12 -> kappa width", mpf('2e-12')/3, "-> contrib", (mpf('2e-12')/3)*C)
