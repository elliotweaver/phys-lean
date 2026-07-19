from mpmath import mp, mpf, cos, sqrt, log, pi
mp.dps = 60
q = mpf(2)/3  # Q derived
p = cos(mpf(2)/9)
w = sqrt(2)
r = sqrt(3 - 3*p*p)
b0 = 1 + w*p
b1 = 1 - w*(p+r)/2
b2 = 1 - w*(p-r)/2
mass0 = b0*b0; mass1 = b1*b1; mass2 = b2*b2
# foldPhaseBorn = (1-q)^2/(2(1+q));  mbRatioDerived = foldPhaseBorn*(2/3)
foldPhaseBorn = (1-q)**2 / (2*(1+q))
mbRatioDerived = foldPhaseBorn * (mpf(2)/3)
print("mass0 =", mass0, " cutLog:", log(mass0))
print("mass2 =", mass2, " cutLog:", log(mass2))
print("foldPhaseBorn =", foldPhaseBorn)
print("mbRatioDerived =", mbRatioDerived, " cutLog:", log(mbRatioDerived))
print("cutLog(1/mbRatioDerived) [charm edge, currently [4,41/10]] =", log(1/mbRatioDerived))
# kappa
kappa = (1/pi)/3
print("kappa =", kappa)
# recomposedEndpoint
L_m01 = log(mass0/mass1)
L_mb = log(mbRatioDerived)
L_b0 = log(mass0)
L_b2 = log(mass2)
endpoint = mpf(2425)/18 + kappa*(2*L_m01 + (mpf(7)/3)*L_mb + (mpf(11)/3)*L_b0 - (mpf(5)/3)*L_b2)
print("recomposedEndpoint =", endpoint)
# 2425/18
print("2425/18 =", mpf(2425)/18)
# the combination inside
C = 2*L_m01 + (mpf(7)/3)*L_mb + (mpf(11)/3)*L_b0 - (mpf(5)/3)*L_b2
print("C (combo) =", C)
print("kappa*C =", kappa*C)
