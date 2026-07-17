from mpmath import mp, mpf, log, exp, factorial
mp.dps = 60
def partialExp(x,N): return sum(x**i/factorial(i) for i in range(N))
def expRemBound(x,N): return x**N/factorial(N) * (1/(1-x/(N+1)))
# m01 rational endpoints (must bracket achievable [3477.4708, 3477.4760]):
mlo = mpf('3477.470')   # <= 3477.4708 ok
mhi = mpf('3477.477')   # >= 3477.4760 ok
print('m01 rational bracket [%.4f, %.4f]' % (float(mlo), float(mhi)))
print('true cutLog: [%s, %s]' % (mp.nstr(log(mlo),14), mp.nstr(log(mhi),14)))
print()
# LOWER cutLog endpoint L: need partialExp(L,N)+expRemBound(L,N) <= mlo, maximize L
# choose L candidates in 1e-7 units
print('=== LOWER (need partialExp(L,N)+rem <= %.4f) ===' % float(mlo))
for N in [23,24,25]:
    for Lm in [81540600,81540595,81540590,81540580]:
        L=mpf(Lm)/mpf('1e7')
        v=partialExp(L,N)+expRemBound(L,N)
        if v<=mlo:
            print(f'  N={N} L={Lm}/1e7={float(L):.7f}: partialExp+rem={mp.nstr(v,15)} <= {float(mlo)} OK (cutLog>= {float(L)})')
            break
    else:
        print(f'  N={N}: none of the L candidates certified')
print()
print('=== UPPER (need %.4f <= partialExp(U,N)) ===' % float(mhi))
for N in [24,25,26,27,28]:
    for Um in [81540625,81540630,81540640,81540650,81540700,81541000]:
        U=mpf(Um)/mpf('1e7')
        v=partialExp(U,N)
        if mhi<=v:
            print(f'  N={N} U={Um}/1e7={float(U):.7f}: partialExp={mp.nstr(v,15)} >= {float(mhi)} OK (cutLog<= {float(U)})')
            break
    else:
        print(f'  N={N}: none certified (partialExp(8.15407,{N})={mp.nstr(partialExp(mpf("8.15407"),N),15)})')
