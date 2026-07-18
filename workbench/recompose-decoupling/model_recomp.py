import mpmath as mp
mp.mp.dps = 40
pi = mp.pi
kappa = 1/(3*pi)                      # kappaLeading = 1/(3π)
L_top = 28*pi/3                       # cutLog(topBandRatio) = 28π/3
L_conf = 8*pi/3                       # cutLog(confBandRatio) = 8π/3
L_lep = mp.mpf('8.154061112580743509671544826723377757635')  # cutLog(mass0/mass1)
def bs(c,L): return kappa*c*L

chg = mp.mpf(16)/3
iso = mp.mpf(2)
hyp = mp.mpf(10)/3
lepC = mp.mpf(2)   # leptonCensus (census-conserving, coloured removed at Λ)

print("bandScreen(chg) topBand =", bs(chg,L_top), " (=448/27=", mp.mpf(448)/27, ")")
print("bandScreen(chg) confBand=", bs(chg,L_conf), " (=128/27=", mp.mpf(128)/27, ")")
print("bandScreen(lepC) lepTail=", bs(lepC,L_lep))
print()

def recomp(s):
    return 112 + bs(chg-s,L_top) + bs(chg,L_conf) + bs(lepC,L_lep)
print("recombinedConservingEndpoint(s=0) =", recomp(0))
print("  = 190/3+70 + bandScreen(2)(m0/m1) =", mp.mpf(190)/3+70 + bs(2,L_lep))
print()

add = 112 + bs(chg,L_top)+bs(chg,L_conf)+bs(chg,L_lep)
print("additive recombined (full charge tail) =", add, " (banked ~137.9476)")
print("census-conserving < additive?  ", recomp(0), "<", add, "->", recomp(0)<add)
print()

print("recombined EW way-point = 1582/27+70 =", mp.mpf(1582)/27+70)
print("recombined conf way-point = 190/3+70 =", mp.mpf(190)/3+70)
print()

print("s-term subtracts: -bandScreen(s) topBand, s=1/8 ->", -bs(mp.mpf(1)/8,L_top))
print("measured 1/alpha(0)=137.035999 -- PROSE. conserving high+lepton=", recomp(0), "UNDERSHOOTS; freeze-out(RNYF) screens UP.")
print("15-digit numeral BLOCKED on {s, rb,rc,rl}. FRAME/way-points are the deliverable.")
