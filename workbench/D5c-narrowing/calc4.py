from mpmath import mp, mpf, log
mp.dps = 50
# m01 achievable window (from split@4 cutCos(2/9)) ~ [3477.4708, 3477.4760]
# cutLog(m01). Push m01 window tighter and exp index deeper.
for m in [mpf('3477.44'), mpf('3477.48'), mpf('3477.4708'), mpf('3477.4760'), mpf('3477.47'), mpf('3477.48')]:
    print(f'cutLog({m}) = {mp.nstr(log(m),12)}')
print()
# If we can bracket m01 in [3477.470, 3477.476] say, cutLog in:
print('log(3477.470)=',mp.nstr(log(mpf('3477.470')),12))
print('log(3477.476)=',mp.nstr(log(mpf('3477.476')),12))
print('log(3477.472)=',mp.nstr(log(mpf('3477.472')),12))
# cutLog_ge_certified needs: partialExp(L,N)+expRemBound(L,N) <= m01_lo  (for L <= cutLog(m01_lo))
# cutLog_le_certified needs: m01_hi <= partialExp(U,N)  (for cutLog(m01_hi) <= U)
def partialExp(x,N):
    from mpmath import factorial
    return sum(x**i/factorial(i) for i in range(N))
def expRemBound(x,N):
    from mpmath import factorial
    # x^N/N! * 1/(1-x/(N+1))
    return x**N/factorial(N) * (1/(1-x/(N+1)))
# candidate cutLog endpoints: L=8.15420? try around log(3477.47)=8.154104
L=mpf('8.154100'); U=mpf('8.154110')
for N in [21,22,23,24,25]:
    lhs = partialExp(L,N)+expRemBound(L,N)
    print(f'N={N}: partialExp(L={float(L)},N)+rem = {mp.nstr(lhs,14)} (need <= m01_lo~3477.47)')
