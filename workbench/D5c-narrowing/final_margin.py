from fractions import Fraction as F
C2 = F(144356177, 156250000)
u_lo = 2*C2*C2 - 1   # exact lower bound for u=2c^2-1 (since c>C2>0 => c^2>C2^2)
print("C2 =", float(C2))
print("2*C2^2-1 =", float(u_lo), "=", u_lo)
print("cos(pi/4)=0.70710678...")
print("u_lo - 1/2squared check: u_lo^2 =", float(u_lo*u_lo), " (>1/2? %s)"%(u_lo*u_lo>F(1,2)))
print("u_lo - 0.7071 =", float(u_lo - F(7071,10000)))
# pick a rational L with C2 chain: u > u_lo. Want L <= u_lo and L^2 > 1/2 with margin.
# u_lo ~ 0.7071068. sqrt(1/2)=0.70710678. margin tiny. Use L = u_lo itself (exact).
# nlinarith final: need 2*u^2 - 1 > 0 given u > u_lo(exact rational) and u_lo^2 > 1/2.
print()
print("final 2*u_lo^2 - 1 =", float(2*u_lo*u_lo-1), "=", 2*u_lo*u_lo-1)
# Provide nlinarith: hu2: u > u_lo (rational), then u^2 > u_lo^2 (u>0), 2u_lo^2-1>0 by norm_num.
