from mpmath import mp, mpf, pi
mp.dps = 40

# banked sharp central values (D7NarrowingRung1, ~9 digits certified midpoints)
L_m01 = mpf('8.154061112725')   # [8.15406111272, 8.15406111273]
L_mb  = mpf('-4.08930665')      # [-4.0893067, -4.0893066]
L_b0  = mpf('1.73372875')       # [1.7337287, 1.7337288]
L_b2  = mpf('-1.0887237')       # [-1.0887238, -1.0887236]
kappa = 1/(3*pi)

base = mpf(2425)/18
inner_lead = 2*L_m01 + (mpf(7)/3)*L_mb + (mpf(11)/3)*L_b0 - (mpf(5)/3)*L_b2
endpoint_lead = base + kappa*inner_lead
print("current (leading lepton tail)     :", endpoint_lead)

inner_runL = 3*L_m01 + (mpf(7)/3)*L_mb + (mpf(11)/3)*L_b0 - (mpf(5)/3)*L_b2
endpoint_runL = base + kappa*inner_runL
print("depth-2 run on LEPTON tail (3*L01):", endpoint_runL)
print("  delta lepton-only =", endpoint_runL-endpoint_lead)

inner_runAll = 3*L_m01 + (mpf(3)/2)*((mpf(7)/3)*L_mb + (mpf(11)/3)*L_b0 - (mpf(5)/3)*L_b2)
endpoint_runAll = base + kappa*inner_runAll
print("depth-2 run on ALL screening logs :", endpoint_runAll)
print()
print("measured 1/alpha(0) ~ 137.035999  (orientation only)")
print("kappa*L_m01 (added by lepton-tail run) =", kappa*L_m01)
