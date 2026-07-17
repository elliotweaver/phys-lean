# CasimirProjectionSelectsS — s = 1/8 (owner course injection, t_0b31c1e9)

## The correction (run 839)

Run 838 banked `s = gatherIsoSpinCensus · (funCas/adjCas) = 4·(3/8) = 3/2`. Owner directive
(2026-07-17 13:28) declared this WRONG: multiplying the Casimir fraction into the RAW cross-census
`4` is the SAME raw-census category error the overshoot theorem already refuted (tempering the
census is still counting the census). Banked-arithmetic sanity: D2c anti-screening at `s=3/2` drives
the composed endpoint well below every honest way-point — fails the composed structure's OWN
consistency, the only sanity check that matters.

## The corrected route (owner-supplied, DERIVED here)

The Casimir fraction `3/8` acts on the DEPTH layer, not the raw census. The gather's adjoint
self-census is seen by the matter FUNDAMENTAL doublet ONLY THROUGH the per-depth self-look-back — the
banked D3 return-surface weight `w = depthWeight = 1/3` (mean Born self-overlap ⟨cos²⟩ over the fold's
return surface). So `s` is the Casimir fraction of ONE depth of self-look-back:

    s := projectedS = (funCas/adjCas) · depthWeight = (3/8) · (1/3) = 1/8.

## Numeric check (orientation only; no measured digit enters any proof)

```
casimirRatio 3/8 == isoDepth/chargeTraceDepth?  True
s = (3/8)*(1/3) = 1/8
interior 0<s<2? True | netIsoDepth = 2 - 1/8 = 15/8 > 0  True
s < casimirRatio(3/8)? True | s < 1? True | s < 3/2? True
s != 4? True  s != 2? True  s != 1? True  s != 3/2? True
bare dressedInvAlphaEM(1/3, s=1)   ~= 143.62
bare dressedInvAlphaEM(1/3, s=3/2) ~= 139.97
bare dressedInvAlphaEM(1/3, s=1/8) ~= 150.01   (join+freeze-out bounded terms carry the remainder)
```

## One cause (two independent banked corroborations)

- (a) The SAME `3/8` that splits the DEPTHS splits the CASIMIRS: `funCas/adjCas = 3/8 =
  isoDepth/chargeTraceDepth` (`casimirRatio_eq_depthRatio`).
- (b) The SAME `1/3` that dresses every channel (D3 `depthWeight`, channel-independent) IS the single
  depth of self-look-back the doublet sees the census through. Born self-overlap on both sides.

## Grade

THEOREM-EXACT (over `Cut`). `s = 1/8` DERIVED; ceiling `{1,3/2}` REJECTED (both raw-census values,
`s` strictly below both). No route-not-yet-found remains for the value of `s`. Foundations-only ⊆
{propext, Classical.choice, Quot.sound}. NO fit (≈1.90 named only to exclude).
