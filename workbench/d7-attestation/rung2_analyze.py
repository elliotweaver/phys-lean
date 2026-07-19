from mpmath import mp, mpf, log, cos, pi, sqrt, factorial
mp.dps = 70

# ---- current banked 1/cutPi ext6 bracket (NarrowedBracket12.inv_cutPi_bracket_ext6) ----
inv_pi_lo = mpf(1250000000)/mpf(3926990817)
inv_pi_hi = mpf(50000000000)/mpf(157079632679)
print("1/cutPi ext6 lo =", mp.nstr(inv_pi_lo,25))
print("1/cutPi ext6 hi =", mp.nstr(inv_pi_hi,25))
print("1/pi true        =", mp.nstr(1/pi,25))
print("1/cutPi ext6 WIDTH =", mp.nstr(inv_pi_hi-inv_pi_lo,6))
print("kappa=(1/cutPi)/3 width =", mp.nstr((inv_pi_hi-inv_pi_lo)/3,6))
print()

# ---- input true values from banked s6 brackets ----
m0_lo = mpf(5661726012625402)/mpf(10**15)
m0_hi = mpf(5661726012625422)/mpf(10**15)
print("mass0 bracket:", mp.nstr(m0_lo,17), mp.nstr(m0_hi,17), "width", mp.nstr(m0_hi-m0_lo,4))
L_b0 = log((m0_lo+m0_hi)/2)
print("L_b0 = cutLog mass0 =", mp.nstr(L_b0,20))

wp_lo = mpf(689719085816627)/mpf(500000000000000)
wp_hi = mpf(689719085816629)/mpf(500000000000000)
wr_lo = mpf(269931005964161)/mpf(500000000000000)
wr_hi = mpf(269931005964169)/mpf(500000000000000)
b2_lo = 1 - (wp_hi - wr_lo)/2
b2_hi = 1 - (wp_lo - wr_hi)/2
print("b2 s6 bracket:", mp.nstr(b2_lo,17), mp.nstr(b2_hi,17), "width", mp.nstr(b2_hi-b2_lo,4))
mass2_lo = b2_lo*b2_lo
mass2_hi = b2_hi*b2_hi
print("mass2 s6 bracket:", mp.nstr(mass2_lo,17), mp.nstr(mass2_hi,17), "width", mp.nstr(mass2_hi-mass2_lo,4))
L_b2 = log((mass2_lo+mass2_hi)/2)
print("L_b2 = cutLog mass2 =", mp.nstr(L_b2,20))
print()

q = 1/sqrt(2)
print("q true =", mp.nstr(q,25))
mb = (1-q)**2/(3*(1+q))
print("mbRatio true =", mp.nstr(mb,20))
L_mb = log(mb)
print("L_mb = cutLog mbRatio =", mp.nstr(L_mb,20))
print("1/mbRatio =", mp.nstr(1/mb,20))
print()

Lm01_lo = mpf(815406111272)/mpf(10**11)
Lm01_hi = mpf(815406111273)/mpf(10**11)
print("L_m01 banked:", mp.nstr(Lm01_lo,15), mp.nstr(Lm01_hi,15), "width", mp.nstr(Lm01_hi-Lm01_lo,4))
L_m01 = (Lm01_lo+Lm01_hi)/2
print()

kappa = (1/pi)/3
C = 2*L_m01 + mpf(7)/3*L_mb + mpf(11)/3*L_b0 - mpf(5)/3*L_b2
endpoint = mpf(2425)/18 + kappa*C
print("C =", mp.nstr(C,20))
print("kappa =", mp.nstr(kappa,20))
print("endpoint = 1/alpha(0) =", mp.nstr(endpoint,25))
print()

print("=== sensitivity: for endpoint total width ~1e-12, budget each input ===")
print("d/dL_m01 =", mp.nstr(2*kappa,6), "-> L_m01 width <", mp.nstr(mpf('2e-13')/(2*kappa),4))
print("d/dL_mb  =", mp.nstr(mpf(7)/3*kappa,6), "-> L_mb width <", mp.nstr(mpf('2e-13')/(mpf(7)/3*kappa),4))
print("d/dL_b0  =", mp.nstr(mpf(11)/3*kappa,6), "-> L_b0 width <", mp.nstr(mpf('2e-13')/(mpf(11)/3*kappa),4))
print("d/dL_b2  =", mp.nstr(mpf(5)/3*kappa,6), "-> L_b2 width <", mp.nstr(mpf('2e-13')/(mpf(5)/3*kappa),4))
print("d/dkappa = C =", mp.nstr(C,6), "-> kappa width <", mp.nstr(mpf('2e-13')/abs(C),4),
      "-> 1/cutPi width <", mp.nstr(3*mpf('2e-13')/abs(C),4))
print()
print("NOTE current 1/cutPi width", mp.nstr(inv_pi_hi-inv_pi_lo,4),
      "-> endpoint contribution", mp.nstr((inv_pi_hi-inv_pi_lo)/3*abs(C),4))
