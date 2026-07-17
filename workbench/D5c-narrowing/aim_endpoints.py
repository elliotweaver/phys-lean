from fractions import Fraction as F
from mpmath import mp, mpf, factorial
import mpmath, math
mp.dps = 120

# split@5 pB: partialCos5(2/9) exact, rem5 bound
pc5 = F(13226284829, 13559717115)
x = mpf(2)/9
def cosRemBound(x,N): return x**(2*N)/factorial(2*N)*(1/(1-x**2/((2*N+1)*(2*N+2))))
rem5 = cosRemBound(x,5)
# rational rem bound: cosRemBound(2/9,5) = (2/9)^10/10! * 1/(1-(2/9)^2/132)
rem5_exact = F(2,9)**10/F(math.factorial(10))*(1/(1-F(2,9)**2/132))
print("rem5 exact =", rem5_exact, "~", float(rem5_exact))
# pick R5 rational >= rem5, clean: 1/1e13
R5=F(1,10**13)
print("R5=1e-13 >= rem5?", R5>=rem5_exact)
pB_lo_e = pc5 - R5; pB_hi_e = pc5 + R5
# 1e10 grid endpoints
plo=F(9754100853,10**10); phi=F(9754100854,10**10)
print("pB [%s,%s]  plo<=pc5-R5? %s  phi>=pc5+R5? %s"%(plo,phi, plo<=pB_lo_e, phi>=pB_hi_e))
print("  margins: (pc5-R5)-plo=%.3e  phi-(pc5+R5)=%.3e"%(float(pB_lo_e-plo),float(phi-pB_hi_e)))

# wB sqrt2 1e12 grid
wlo=F(1414213562373,10**12); whi=F(1414213562374,10**12)
print("\nwB [%s,%s]  wlo^2<=2? %s (margin %.3e)  whi^2>=2? %s (margin %.3e)"%(
    wlo,whi, wlo*wlo<=2, float(2-wlo*wlo), whi*whi>=2, float(whi*whi-2)))

# rB: r^2=3-3p^2. rlo^2<=3-3phi^2, rhi^2>=3-3plo^2
rlo=F(38174008945,10**11); rhi=F(38174009023,10**11)
print("\nrB [%s,%s]"%(rlo,rhi))
print("  rlo^2<=3-3phi^2? %s (margin %.3e)"%(rlo*rlo<=3-3*phi*phi, float((3-3*phi*phi)-rlo*rlo)))
print("  rhi^2>=3-3plo^2? %s (margin %.3e)"%(rhi*rhi>=3-3*plo*plo, float(rhi*rhi-(3-3*plo*plo))))

# products
wp_lo=wlo*plo; wp_hi=whi*phi; wr_lo=wlo*rlo; wr_hi=whi*rhi
# clean grid for wp,wr (1e10)
wp_lo_g=F(math.floor(float(wp_lo)*10**10),10**10); wp_hi_g=F(math.ceil(float(wp_hi)*10**10),10**10)
wr_lo_g=F(math.floor(float(wr_lo)*10**10),10**10); wr_hi_g=F(math.ceil(float(wr_hi)*10**10),10**10)
print("\nwp [%s,%s] (exact [%.11f,%.11f])"%(wp_lo_g,wp_hi_g,float(wp_lo),float(wp_hi)))
print("wr [%s,%s] (exact [%.11f,%.11f])"%(wr_lo_g,wr_hi_g,float(wr_lo),float(wr_hi)))
# b0=1+wp, b1=1-(wp+wr)/2
b0_lo=1+wp_lo_g; b0_hi=1+wp_hi_g
b1_lo=1-(wp_hi_g+wr_hi_g)/2; b1_hi=1-(wp_lo_g+wr_lo_g)/2
# clean grid b0(1e10) b1(1e11)
b0_lo_g=F(math.floor(float(b0_lo)*10**10),10**10); b0_hi_g=F(math.ceil(float(b0_hi)*10**10),10**10)
b1_lo_g=F(math.floor(float(b1_lo)*10**11),10**11); b1_hi_g=F(math.ceil(float(b1_hi)*10**11),10**11)
print("b0 [%s,%s]"%(b0_lo_g,b0_hi_g))
print("b1 [%s,%s]"%(b1_lo_g,b1_hi_g))
# masses
m0_lo=b0_lo_g*b0_lo_g; m0_hi=b0_hi_g*b0_hi_g
m1_lo=b1_lo_g*b1_lo_g; m1_hi=b1_hi_g*b1_hi_g
m01_lo=m0_lo/m1_hi; m01_hi=m0_hi/m1_lo
print("\nm01 [%.9f,%.9f] width %.3e"%(float(m01_lo),float(m01_hi),float(m01_hi-m01_lo)))
lo6=F(math.floor(float(m01_lo)*10**6),10**6); hi6=F(math.ceil(float(m01_hi)*10**6),10**6)
print("m01 6dp [%s,%s] (lo<=exact? %s  hi>=exact? %s)"%(lo6,hi6, lo6<=m01_lo, hi6>=m01_hi))
