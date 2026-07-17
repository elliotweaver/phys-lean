"""D5-next-9: lift 1/cutPi onto the 1e9-grid.
LOWER bound: double-double-angle near-pi/8 at y < N9lo/4e9.  Need y_max < pi/8 and a threshold
C with cos(pi/8) < C < cos(y_max) (the near-pi/8 lower bound), and 2*(2C^2-1)^2-1 > 0 <=> C>cos(pi/8).
UPPER sign: cutCos(N9hi/1e9) < 0, needs cosRemBound(N9hi/1e9, N) < |cos(N9hi/1e9)|.
"""
import mpmath as mp
mp.mp.dps = 60
pi = mp.pi
E9 = mp.mpf(10)**9
half = pi/2
print("pi/2*1e9 =", mp.nstr(half*E9, 25), " floor=1570796326, ceil=1570796327")
print("pi/8     =", mp.nstr(pi/8, 30))
cpi8 = mp.cos(pi/8)
print("cos(pi/8)=", mp.nstr(cpi8, 30))
print()

def cosRemBound(x, N):
    # (x^(2N)/(2N)!) * (1 - x^2/((2N+1)(2N+2)))^-1
    num = x**(2*N)/mp.factorial(2*N)
    return num*(1/(1 - x**2/((2*N+1)*(2*N+2))))

# ---- LOWER: near-pi/8 at 1e9 lower tick candidates ----
print("=== LOWER bound (double-double-angle near-pi/8) ===")
for N9lo in [1570796326, 1570796325, 1570796324]:
    ymax = mp.mpf(N9lo)/(4*E9)
    print("N9lo=%d  x<%d/1e9  y=x/4 < %s" % (N9lo, N9lo, mp.nstr(ymax,20)))
    print("   ymax < pi/8 ?", ymax < pi/8, " gap(pi/8 - ymax)=", mp.nstr(pi/8-ymax,6))
    cym = mp.cos(ymax)
    print("   cos(ymax)=", mp.nstr(cym,30), " window (cos ymax - cos pi/8)=", mp.nstr(cym-cpi8,6))
    rem6 = cosRemBound(ymax,6)
    print("   cosRemBound(ymax,6)=", mp.nstr(rem6,6))
    print()

# ---- UPPER sign at 1e9 ticks, find min N per tick ----
print("=== UPPER sign cutCos(N9hi/1e9)<0: need cosRemBound < |cos| ===")
for N9hi in [1570796327, 1570796328, 1570796330, 1570796333, 1570796334, 1570796340]:
    x = mp.mpf(N9hi)/E9
    c = mp.cos(x)
    print("N9hi=%d  x=%s  cos(x)=%s  (x-pi/2=%s)" % (N9hi, mp.nstr(x,20), mp.nstr(c,6), mp.nstr(x-half,6)))
    for N in [6,7,8,9]:
        rem = cosRemBound(x,N)
        ok = rem < abs(c)
        print("     N=%d cosRemBound=%s   %s" % (N, mp.nstr(rem,6), "OK <|cos|" if ok else ""))
    print()
