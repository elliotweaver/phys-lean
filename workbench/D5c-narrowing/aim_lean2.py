from fractions import Fraction as F
from mpmath import mp, mpf, factorial, log
import mpmath, math
mp.dps = 120

plo=F(9754100853,10**10); phi=F(9754100854,10**10)
wlo=F(1414213562373,10**12); whi=F(1414213562374,10**12)
rlo=F(38174008945,10**11); rhi=F(38174009023,10**11)

wp_prod_lo=wlo*plo; wp_prod_hi=whi*phi
wr_prod_lo=wlo*rlo; wr_prod_hi=whi*rhi
# 1e10 grid
wp_lo=F(math.floor(float(wp_prod_lo)*1e10),10**10); wp_hi=F(math.ceil(float(wp_prod_hi)*1e10),10**10)
wr_lo=F(math.floor(float(wr_prod_lo)*1e10),10**10); wr_hi=F(math.ceil(float(wr_prod_hi)*1e10),10**10)
print("wp [%s,%s] w %.2e (lo<=? %s hi>=? %s)"%(wp_lo,wp_hi,float(wp_hi-wp_lo),wp_lo<=wp_prod_lo,wp_hi>=wp_prod_hi))
print("wr [%s,%s] w %.2e (lo<=? %s hi>=? %s)"%(wr_lo,wr_hi,float(wr_hi-wr_lo),wr_lo<=wr_prod_lo,wr_hi>=wr_prod_hi))

b0_lo=1+wp_lo; b0_hi=1+wp_hi
b1_lo=1-(wp_hi+wr_hi)/2; b1_hi=1-(wp_lo+wr_lo)/2
print("\nb0 [%s,%s]"%(b0_lo,b0_hi))
print("b1 [%s,%s] w %.2e"%(b1_lo,b1_hi,float(b1_hi-b1_lo)))

m0_lo=b0_lo*b0_lo; m0_hi=b0_hi*b0_hi
m1_lo=b1_lo*b1_lo; m1_hi=b1_hi*b1_hi
m01_lo=m0_lo/m1_hi; m01_hi=m0_hi/m1_lo
print("\nm01 exact [%.9f, %.9f] w %.3e"%(float(m01_lo),float(m01_hi),float(m01_hi-m01_lo)))
lo6=F(math.floor(float(m01_lo)*1e6),10**6); hi6=F(math.ceil(float(m01_hi)*1e6),10**6)
print("m01 6dp [%s=%.6f, %s=%.6f]"%(lo6,float(lo6),hi6,float(hi6)))

tlo=mpf(lo6.numerator)/mpf(lo6.denominator); thi=mpf(hi6.numerator)/mpf(hi6.denominator)
def partialExp(x,N):
    s=mpf(0); term=mpf(1)
    for k in range(N):
        s+=term; term*=x/(k+1)
    return s
def expRemBound(x,N): return (x**N/factorial(N))*(1/(1-x/(N+1)))
print("cutLog true [%.10f, %.10f]"%(float(log(tlo)),float(log(thi))))
res={}
for (Nlo,Nhi) in [(27,30),(28,31)]:
    clo=None
    for i in range(815406090,815406140):
        c=mpf(i)/mpf('1e8')
        if partialExp(c,Nlo)+expRemBound(c,Nlo)<=tlo: clo=i
        else: break
    chi=None
    for i in range(815406170,815406100,-1):
        c=mpf(i)/mpf('1e8')
        if thi<=partialExp(c,Nhi): chi=i
        else: break
    print("  idx(%d/%d): cutLog [%d/1e8, %d/1e8] w %.3e"%(Nlo,Nhi,clo,chi,(chi-clo)/1e8))
    res[(Nlo,Nhi)]=(clo,chi)

# ===== ASSEMBLY =====
d=F(16,3)
la=F(res[(27,30)][0],10**8); lb=F(res[(27,30)][1],10**8)
parent_w=F(4802931662,70685829)-F(19211728054,282743343)
print("\nparent 1/a(0) width %.4e; bracket [%.9f,%.9f]"%(float(parent_w),float(F(19211728054,282743343)),float(F(4802931662,70685829))))
for (lzlo,lzhi,tag) in [(157079628,157079635,"safe635"),(157079628,157079634,"push634")]:
    pa=F(50000000,lzhi); pb=F(50000000,lzlo)
    lo=F(190,3)+d/3*la*pa; hi=F(190,3)+d/3*lb*pb
    w=hi-lo
    print("\n[%s] cutLog[%d,%d]/1e8 lz[%d,%d]/1e8"%(tag,res[(27,30)][0],res[(27,30)][1],lzlo,lzhi))
    print("  1/a(0) [%s, %s]"%(lo,hi))
    print("     = [%.10f, %.10f] w %.4e (%.1fx narrower)"%(float(lo),float(hi),float(w),float(parent_w/w)))
    print("  nested? lo>=parent_lo %s ; hi<=parent_hi %s"%(lo>=F(19211728054,282743343), hi<=F(4802931662,70685829)))
    dlo=F(74,1)+d/2*la*pa; dhi=F(74,1)+d/2*lb*pb
    print("  dressed [%s, %s]"%(dlo,dhi))
