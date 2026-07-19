from mpmath import mp, mpf, log, pi
mp.dps = 40
kappaLeading = (1/pi)/3
m0 = (mpf('5661726012625402')/mpf('1e15') + mpf('5661726012625422')/mpf('1e15'))/2
b2c = (mpf('580211920147532')/mpf('1e15') + mpf('580211920147542')/mpf('1e15'))/2
m2 = b2c**2
q = (mpf('7071067811865')/mpf('1e13') + mpf('7071067811866')/mpf('1e13'))/2
mb = (1-q)**2/(3*(1+q))
Lm01 = mpf('815406111272')/mpf('1e11')
Lmb = log(mb); Lb0 = log(m0); Lb2 = log(m2)
C = 2*Lm01 + (mpf(7)/3)*Lmb + (mpf(11)/3)*Lb0 - (mpf(5)/3)*Lb2
base = mpf('2425')/18
kC = kappaLeading*C
print('base 2425/18   =', base)
print('kappaLeading*C =', kC)
print('bare endpoint  =', base+kC)
print()
w = mpf(1)/3
# added-screening ratios (manager quoted): depth-2 only w; 2+3 w+w^2=4/9; 2+3+4 =13/27; all-orders w/(1-w)=1/2
for name, r in [('depth2 (w=1/3)', w),
                ('depth2+3 (4/9)', w+w**2),
                ('depth2+3+4 (13/27)', w+w**2+w**3),
                ('all-orders cap (1/2)', w/(1-w))]:
    print(f'{name:24s} added={r} -> endpoint = {base + kC*(1+r)}')
print()
print('all-orders factor 1/(1-w) = 3/2; endpoint = base + (3/2)*kC =', base + mpf(3)/2*kC)
print('(orientation prose) measured 1/alpha(0) ~ 137.035999')
