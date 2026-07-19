from mpmath import mp, mpf, log, sqrt, floor, ceil, exp, factorial
mp.dps = 90
D = lambda p: mpf(10)**p

def rembound(q,N):
    return q**N/factorial(N)*(1/(1-q/(N+1)))
def partialExp(q,N):
    return sum(q**i/factorial(i) for i in range(N))

def cert_lower(c, a, N):
    # need partialExp(a,N)+rembound(a,N) <= c  => a <= cutLog c
    lhs = partialExp(a,N)+rembound(a,N)
    return lhs <= c, mp.nstr(c-lhs,4)
def cert_upper(c, b, N):
    # need c <= partialExp(b,N)  => cutLog c <= b
    rhs = partialExp(b,N)
    return c <= rhs, mp.nstr(rhs-c,4)

print("="*70)
print("L_b0 = cutLog mass0")
m0_lo = mpf(5661726012625402)/D(15); m0_hi = mpf(5661726012625422)/D(15)
a = mpf(1733728794954)/D(12); b = mpf(1733728794955)/D(12)   # lo,hi target bracket
print(" mass0 clean bracket used:", m0_lo, m0_hi)
for N in [20,21,22]:
    print(f"  LOWER a=1733728794954/1e12 N={N}:", cert_lower(m0_lo,a,N))
for N in [20,21,22]:
    print(f"  UPPER b=1733728794955/1e12 N={N}:", cert_upper(m0_hi,b,N))
print(" => cutLog mass0 in [1733728794954/1e12, 1733728794955/1e12] width 1e-12")

print("="*70)
print("L_b2 = cutLog mass2  (via 1/mass2)")
wp_lo = mpf(689719085816627)/mpf(500000000000000); wp_hi = mpf(689719085816629)/mpf(500000000000000)
wr_lo = mpf(269931005964161)/mpf(500000000000000); wr_hi = mpf(269931005964169)/mpf(500000000000000)
b2_lo = 1-(wp_hi-wr_lo)/2; b2_hi = 1-(wp_lo-wr_hi)/2
mass2_lo = b2_lo*b2_lo; mass2_hi = b2_hi*b2_hi
print(" mass2 bracket:", mp.nstr(mass2_lo,18), mp.nstr(mass2_hi,18))
# clean rational bounds for mass2 (lo below, hi above) at 1e15 grid
m2cl = int(floor(mass2_lo*D(15))); m2ch = int(ceil(mass2_hi*D(15)))
print(" mass2 clean: [", m2cl,"/1e15,", m2ch,"/1e15]")
m2_clean_lo = mpf(m2cl)/D(15); m2_clean_hi = mpf(m2ch)/D(15)
# 1/mass2 bracket: [1/m2_clean_hi, 1/m2_clean_lo]
inv2_lo = 1/m2_clean_hi; inv2_hi = 1/m2_clean_lo
print(" 1/mass2 in [", mp.nstr(inv2_lo,18),",", mp.nstr(inv2_hi,18),"]")
# I'll write 1/mass2 bracket as rationals directly: lo = 1e15/m2ch, hi=1e15/m2cl (exact)
print("  => write 1/mass2 lo =", 10**15,"/",m2ch," hi =",10**15,"/",m2cl)
# cutLog(1/mass2) bracket
Linv2_lo_t = log(inv2_lo); Linv2_hi_t = log(inv2_hi)
print(" cutLog(1/mass2) true:", mp.nstr(Linv2_lo_t,18), mp.nstr(Linv2_hi_t,18))
a2 = int(floor(Linv2_lo_t*D(12))); b2 = int(ceil(Linv2_hi_t*D(12)))
print(" target [", a2,"/1e12,", b2,"/1e12] width", b2-a2,"e-12")
a2v = mpf(a2)/D(12); b2v = mpf(b2)/D(12)
for N in [16,17,18]:
    print(f"  LOWER a2={a2}/1e12 N={N}:", cert_lower(inv2_lo,a2v,N))
for N in [16,17,18]:
    print(f"  UPPER b2={b2}/1e12 N={N}:", cert_upper(inv2_hi,b2v,N))
print(f" => cutLog mass2 in [-{b2}/1e12, -{a2}/1e12]")

print("="*70)
print("L_mb = cutLog mbRatio (via 1/mbRatio), q pushed deeper")
# q^2=1/2, push q to 1e13 grid
qn_lo = int(floor(1/sqrt(2)*D(13))); qn_hi = int(ceil(1/sqrt(2)*D(13)))
print(" q bracket @1e13: [", qn_lo,"/1e13,", qn_hi,"/1e13]")
q_lo = mpf(qn_lo)/D(13); q_hi = mpf(qn_hi)/D(13)
# verify q_lo^2 < 1/2 < q_hi^2
print("  q_lo^2 =", mp.nstr(q_lo**2,18), "  q_hi^2 =", mp.nstr(q_hi**2,18), " (bracket 0.5)")
mb_lo = (1-q_hi)**2/(3*(1+q_hi)); mb_hi = (1-q_lo)**2/(3*(1+q_lo))
print(" mbRatio in [", mp.nstr(mb_lo,18),",", mp.nstr(mb_hi,18),"] width", mp.nstr(mb_hi-mb_lo,4))
# clean mbRatio rationals at 1e15
mbcl = int(floor(mb_lo*D(15))); mbch = int(ceil(mb_hi*D(15)))
print(" mbRatio clean: [", mbcl,"/1e15,", mbch,"/1e15]")
mb_clean_lo = mpf(mbcl)/D(15); mb_clean_hi = mpf(mbch)/D(15)
inv_mb_lo = 1/mb_clean_hi; inv_mb_hi = 1/mb_clean_lo
print(" 1/mbRatio in [", mp.nstr(inv_mb_lo,18),",", mp.nstr(inv_mb_hi,18),"]")
print("  => write 1/mbRatio lo =",10**15,"/",mbch," hi =",10**15,"/",mbcl)
Linvmb_lo_t = log(inv_mb_lo); Linvmb_hi_t = log(inv_mb_hi)
print(" cutLog(1/mbRatio) true:", mp.nstr(Linvmb_lo_t,18), mp.nstr(Linvmb_hi_t,18))
amb = int(floor(Linvmb_lo_t*D(12))); bmb = int(ceil(Linvmb_hi_t*D(12)))
print(" target [", amb,"/1e12,", bmb,"/1e12] width", bmb-amb,"e-12")
ambv = mpf(amb)/D(12); bmbv = mpf(bmb)/D(12)
for N in [28,29,30,31]:
    print(f"  LOWER amb={amb}/1e12 N={N}:", cert_lower(inv_mb_lo,ambv,N))
for N in [28,29,30,31]:
    print(f"  UPPER bmb={bmb}/1e12 N={N}:", cert_upper(inv_mb_hi,bmbv,N))
print(f" => cutLog mbRatio in [-{bmb}/1e12, -{amb}/1e12]")
