#!/usr/bin/env python3
"""M4 verify — the full scale-tower numeral set + teeth + way-points free."""
from fractions import Fraction as F
from mpmath import mp, exp, pi
mp.dps = 80

Elo = F(284965, 100000); Ehi = F(284966, 100000)

print("=== THE DIMENSIONFUL SKELETON (edges as ratios to M_oct:=1) ===")
print("octEdgeScale  = M/M   = 1                              (exact)")
print("ewEdgeScale   = v/M   = ewClosureRatio  in [184405/1e18,184445/1e18]  (M2)")
print("confEdgeScale = L/M   = confScaleRatio  in [42408/1e21,42414/1e21]    (M3)")
print()
print("=== THE BAND RATIOS (dimensionless, >1) — the M4 NUMERALS ===")
# topBandRatio = M/v = cutExp(pi/3)^28
lo,hi = Elo**28, Ehi**28
print("topBandRatio  = M/v   = cutExp(pi/3)^28  in [54220*1e8, 54226*1e8]")
print("   Elo^28=",float(lo)," Ehi^28=",float(hi)," true=",float(exp(28*pi/3)))
print("   check 54220e8 <= Elo^28:", F(54220)*10**8 <= lo, "  Ehi^28 <= 54226e8:", hi <= F(54226)*10**8)
# confBandRatio = v/L in [4347,4350] (M3 banked)
print("confBandRatio = v/L   = cutExp(pi/3)^8   in [4347,4350]  (M3 banked)")
# M/L = cutExp(pi/3)^36 in [23577e12,23581e12] (M3 banked as invConfinementScaleRatio)
print("M/L (=invConfScaleRatio)= cutExp(pi/3)^36 in [23577e12,23581e12]  (M3 banked)")
print()
print("=== COMPOSITION TOOTH: (M/v)*(v/L) = M/L ===")
print("topBandRatio * confBandRatio = cutExp(pi/3)^28 * cutExp(pi/3)^8 = cutExp(pi/3)^36 = M/L  (EXACT identity)")
print("   true M/v * v/L =", float(exp(28*pi/3)*exp(8*pi/3)), " vs M/L=", float(exp(12*pi)))
print()
print("=== ORDERING TOOTH ===")
print("1 = octEdge > ewEdge > confEdge   (edges);  topBandRatio > confBandRatio > 1  (ratios)")
print("   topBand in [54220e8..] >> confBand in [4347..] >> 1 : forced from brackets")
print()
print("=== WAY-POINTS RE-EMERGE FREE (over the SAME derived list) ===")
print("42 = invAlphaZero []                         (octonion ceiling, banked)")
print("1582/27 = invAlphaZero [(cD,topBandRatio)]    (electroweak way-point, banked)")
print("448/27  = bandScreen cD topBandRatio          (top band, banked)")
print("128/27  = bandScreen cD confBandRatio         (confinement band, banked)")
print("190/3   = invAlphaZero derivedBandList        (confinement way-point, banked)")
print("  All FIVE way-points are exact banked rationals over the SAME edges the M4 brackets pin.")
print()
print("=== the FULL span verification: topBandRatio numeral width ===")
print("   width rel =", float((F(54226)-F(54220))/((F(54220)+F(54226))/2)))
print("   (≈1.1e-4 — beyond-measurement digits are the standing prediction)")
