from mpmath import mp, mpf, log, factorial
mp.dps = 60
b0lo=mpf(237943816)/mpf('1e8'); b0hi=mpf(237943819)/mpf('1e8')
b1lo=mpf(4034989)/mpf('1e8'); b1hi=mpf(4034992)/mpf('1e8')
# m01 = mass0/mass1 = b0^2/b1^2
m01_lo = (b0lo*b0lo)/(b1hi*b1hi)   # smallest
m01_hi = (b0hi*b0hi)/(b1lo*b1lo)   # largest
print('achievable m01_lo =', mp.nstr(m01_lo,14))
print('achievable m01_hi =', mp.nstr(m01_hi,14))
print('m01 width =', mp.nstr(m01_hi-m01_lo,4))
# choose rational m01 endpoints just outside: floor/ceil to convenient denominators
# m01_lo ~ 3477.4708..., m01_hi ~ 3477.4760...
# pick m01_lo_rat = 3477470/1000 = 3477.470 (<= m01_lo), m01_hi_rat = 3477477/1000 = 3477.477 (>= m01_hi)
for cand in ['3477.470','3477.471','3477.476','3477.477']:
    print(f'  cutLog({cand}) = {mp.nstr(log(mpf(cand)),14)}')
print()
# cutLog bracket over m01 in [3477.470, 3477.477]:
mlo=mpf('3477.470'); mhi=mpf('3477.477')
print('true cutLog(mlo)=',mp.nstr(log(mlo),14),' cutLog(mhi)=',mp.nstr(log(mhi),14))
print('true cutLog width over this m01 =', mp.nstr(log(mhi)-log(mlo),4))
# certify: lower L with partialExp(L,N)+rem(L,N) <= mlo ; upper U with mhi <= partialExp(U,N)
def partialExp(x,N): return sum(x**i/factorial(i) for i in range(N))
def expRemBound(x,N): return x**N/factorial(N) * (1/(1-x/(N+1)))
# aim cutLog bracket ~ [8.154060, 8.154062]
for N in [22,23,24]:
    # find largest L (in units of 1e-6) with partialExp(L,N)+rem <= mlo
    for Lm in [8154059,8154060,8154061]:
        L=mpf(Lm)/mpf('1e6')
        ok = partialExp(L,N)+expRemBound(L,N) <= mlo
        if ok:
            best=Lm
    for Um in [8154062,8154063,8154064]:
        U=mpf(Um)/mpf('1e6')
        oku = mhi <= partialExp(U,N)
    print(f'N={N}: L-check partialExp(8.154060,N)+rem = {mp.nstr(partialExp(mpf("8.154060"),N)+expRemBound(mpf("8.154060"),N),16)} (<= {float(mlo)}?)')
    print(f'      U-check partialExp(8.154063,N) = {mp.nstr(partialExp(mpf("8.154063"),N),16)} (>= {float(mhi)}?)')
