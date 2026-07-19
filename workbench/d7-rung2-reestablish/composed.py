from mpmath import mp, mpf, log, pi
mp.dps = 40
# recomposedEndpoint = 2425/18 + kappaLeading * C_inner
# kappaLeading = (1/cutPi)/3
kappaLeading = (1/pi)/3
# C_inner = 2*L_m01 + (7/3)*L_mb + (11/3)*L_b0 - (5/3)*L_b2
# banked s6 numerals
m0 = (mpf('5661726012625402')/mpf('1e15') + mpf('5661726012625422')/mpf('1e15'))/2
b2c = (mpf('580211920147532')/mpf('1e15') + mpf('580211920147542')/mpf('1e15'))/2
m2 = b2c**2
q = (mpf('7071067811865')/mpf('1e13') + mpf('7071067811866')/mpf('1e13'))/2
mb = (1-q)**2/(3*(1+q))
# L_m01: from banked cutLog(mass0/mass1) ~ 8.15406111272e0 (NB11 s6)
Lm01 = mpf('815406111272')/mpf('1e11')
Lmb = log(mb); Lb0 = log(m0); Lb2 = log(m2)
C_inner = 2*Lm01 + (mpf(7)/3)*Lmb + (mpf(11)/3)*Lb0 - (mpf(5)/3)*Lb2
base = mpf('2425')/18
print('base 2425/18       =', base)
print('C_inner            =', C_inner)
print('kappaLeading       =', kappaLeading)
screen_bare = kappaLeading*C_inner
print('bare screening      =', screen_bare)
print('recomposedEndpoint (bare, current banked) =', base + screen_bare)
print()
# fold-forced depth-2 dressing: kappaLeading -> kappaLeading/(1-1/3) = (3/2)*kappaLeading
depthWeight = mpf(1)/3
factor = 1/(1-depthWeight)
print('depthWeight = 1/3, dressing factor 1/(1-w) =', factor)
screen_dressed = factor*screen_bare
print('dressed screening   =', screen_dressed)
composed = base + screen_dressed
print('COMPOSED endpoint (fold-forced depth-2)   =', composed)
print()
# measured 1/alpha(0) ~ 137.036 (removable orientation prose only)
print('(orientation prose only) measured 1/alpha(0) ~ 137.035999')
print('composed - measured =', composed - mpf('137.035999084'))
