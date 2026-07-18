import mpmath as mp
mp.mp.dps = 40
pi = mp.pi
kappa = 1/(3*pi)
conf_wp = mp.mpf(190)/3   # single-channel conf way-point (42 + charge screening thru top+conf)
ew_wp = mp.mpf(1582)/27
# lepton tail log (banked bracket ~3 digits): mass0/mass1 in [1e9/288575, 1e9/286902]
r_lo = mp.mpf('1e9')/288575; r_hi = mp.mpf('1e9')/286902
print('mass0/mass1 bracket:', float(r_lo), float(r_hi), ' width-digits:', float(mp.log10(r_hi-r_lo)))
Llo = mp.log(r_lo); Lhi = mp.log(r_hi)
print('L_lep bracket:', float(Llo), float(Lhi), ' width:', float(Lhi-Llo))

def sc(d, L): return conf_wp + kappa*d*L

Lmid = (Llo+Lhi)/2
print('single-channel endpoint census 16/3:', float(sc(mp.mpf(16)/3, Lmid)))
print('  additive recombined (+70):', float(sc(mp.mpf(16)/3, Lmid))+70)
print('census-conserving lepton census 2:', float(sc(2, Lmid)))
print('  census-conserving recombined (+70):', float(sc(2, Lmid))+70)
print('measured 1/alpha(0) ~ 137.035999 [REMOVABLE PROSE]')
print()
# How much precision does the lepton-tail term carry from the 3-digit mass bracket?
print('census-conserving +70 bracket from mass bracket alone:')
print('  lo:', float(sc(2, Llo)+70), ' hi:', float(sc(2, Lhi)+70), ' width:', float(sc(2,Lhi)-sc(2,Llo)))
