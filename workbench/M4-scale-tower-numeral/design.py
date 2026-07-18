#!/usr/bin/env python3
"""M4 — THE SCALE-TOWER NUMERALS. Design the certified two-sided rational brackets
for M/v = topBandRatio = cutExp(28pi/3) and v/M = ewClosureRatio (banked) etc.,
all via the SAME cutExp(pi/3)^n reciprocal/power pipeline as M2/M3.

The full dimensionful skeleton is a set of DERIVED edge scales (all as ratios to M_oct:=1):
  octEdgeScale  = 1                            (the octonion ceiling M)
  ewEdgeScale   = ewClosureRatio = cutExp(-28pi/3)   (v/M)   -- M2 bracket [184405/1e18,184445/1e18]
  confEdgeScale = confinementScaleRatio = cutExp(-12pi)  (Lambda/M) -- M3 bracket [42408/1e21,42414/1e21]

Band RATIOS (dimensionless, > 1):
  topBandRatio  = M/v = octEdge/ewEdge = ewClosureRatio^{-1} = cutExp(28pi/3) = cutExp(pi/3)^28
  confBandRatio = v/Lambda = ewEdge/confEdge = cutExp(8pi/3) = cutExp(pi/3)^8  -- M3 bracket [4347,4350]

M4's NEW numerals (not yet banked): topBandRatio (M/v) as a two-sided bracket.
Also the FULL-tower ratio M/Lambda = confinementScaleRatio^{-1} (M3 has it), and
the derived way-points must re-emerge FREE: 42, 1582/27, 448/27, 128/27, 190/3.
"""
from fractions import Fraction as F
from mpmath import mp, exp, pi
import math
mp.dps = 80

# small-arg exp bracket (banked M2 cutExp_pi3_bracket): cutExp(pi/3) in [Elo,Ehi]
Elo = F(284965, 100000)
Ehi = F(284966, 100000)

def power_bracket(n):
    return Elo**n, Ehi**n

print("=== TRUE VALUES (mpmath) ===")
print("cutExp(28pi/3) [M/v] =", exp(28*pi/3))
print("cutExp(8pi/3)  [v/L] =", exp(8*pi/3))
print("cutExp(12pi)   [M/L] =", exp(12*pi))
print()

# topBandRatio = cutExp(pi/3)^28 :  M/v
lo28, hi28 = power_bracket(28)
print("=== topBandRatio = M/v = cutExp(pi/3)^28 ===")
print("Elo^28 =", float(lo28))
print("Ehi^28 =", float(hi28))
# find a clean rational bracket [LO * 1e8, HI * 1e8] enclosing [Elo^28, Ehi^28]
scale = F(10)**8
LO = math.floor(lo28 / scale)
HI = math.ceil(hi28 / scale)
print(f"floor(Elo^28/1e8) = {LO}   ceil(Ehi^28/1e8) = {HI}")
print("check LO*1e8 <= Elo^28 :", F(LO)*scale <= lo28)
print("check Ehi^28 <= HI*1e8 :", hi28 <= F(HI)*scale)
print("width(HI-LO) =", HI-LO, " rel =", float((HI-LO)/((LO+HI)/2)))
print()

# The two-sided bracket for topBandRatio directly: [LO*1e8, HI*1e8]
print("PROPOSED topBandRatio bracket: [", LO, "* 1e8 ,", HI, "* 1e8 ]")
print("  i.e.", float(F(LO)*scale), "..", float(F(HI)*scale))
print()

# Consistency: topBandRatio should be reciprocal of ewClosureRatio bracket.
# ewClosureRatio in [184405/1e18, 184445/1e18] => 1/that in:
elo = F(184405, 10**18); ehi = F(184445, 10**18)
print("=== cross-check: reciprocal of ewClosureRatio M2 bracket ===")
print("1/ehi =", float(1/ehi), "  1/elo =", float(1/elo))
print("  (topBandRatio must lie in this reciprocal interval too)")
print("  our LO*1e8 =", float(F(LO)*scale), " >= 1/ehi?", F(LO)*scale >= 1/ehi)
print("  our HI*1e8 =", float(F(HI)*scale), " <= 1/elo?", F(HI)*scale <= 1/elo)
print()

# M/Lambda = confinementScaleRatio^{-1} = cutExp(pi/3)^36 (M3 already has [23577*1e12, 23581*1e12])
lo36, hi36 = power_bracket(36)
print("=== M/Lambda = cutExp(pi/3)^36 (banked M3) sanity ===")
print("Elo^36 =", float(lo36), " Ehi^36 =", float(hi36))
print("M3 bracket [23577*1e12, 23581*1e12] =", 23577e12, "..", 23581e12)
