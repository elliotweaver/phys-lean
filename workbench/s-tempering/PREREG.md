# PREREG — the Casimir-ratio PROJECTION that SELECTS s (owner DECISION 4, t_0b31c1e9 run 838)

## THE OWNER DIRECTIVE (DECISION 4 = return to my own named route)
NONE of (1)/(2)/(3) [the grade-collision options]. Instead: derive the FUNDAMENTAL-VS-ADJOINT
PROJECTION my own first route-finder (workbench/D-renarrow/RESULT.py) already named — the fraction
of the gather's ADJOINT census the matter FUNDAMENTAL doublet SEES — from the banked
REPRESENTATION structure (su(2) Casimir dichotomy adjCas=8 vs funCas=3, N277/N279) + the banked
depth weight. NO scale tower, NO C6 build, NO new seed, NO new axiom. The ladder-grade scale-tower
cap is REAL and RESPECTED — it is the WRONG INSTRUMENT; I do not need it (W5: instrument wrong,
never the floor). The census-native menu {1,3/2} is the RAW-CENSUS genre my own overshoot theorem
already refuted: raw census values are NOT s; s is the census PROJECTED.

## THE THEORY-NATIVE DERIVATION (why the Casimir ratio is FORCED, not chosen)
The gather is the isospin connection resolving itself — it carries the ADJOINT content (the two
su(2)_L triplets of the fund-7, N277). The matter running census `isoDepth` is the FUNDAMENTAL
(doublet) content (N342/N279). The anti-screening magnitude `s` = the fraction of the gather's
adjoint self-census the fundamental doublet actually SEES.

TRUNK: Born = self-overlap = the positive QUADRATIC form. The census is a self-overlap count, so it
is a QUADRATIC object. The intrinsic quadratic invariant of a representation is its quadratic
CASIMIR — banked as an actual EIGENVALUE THEOREM on each carrier:
  • ADJOINT (triplet): casimirOp acts as (−8)•id  (N277 `casimirOp_u1I`)  ⟹ adjCas magnitude = 8
  • FUNDAMENTAL (doublet): Σ(lreg)² acts as (−3)•id (N279 `leftReg_casimir_eq_neg_three`) ⟹ funCas = 3
The fraction the fundamental sees of the adjoint self-census is therefore the ratio of the SAME
quadratic invariant on the two carriers:
        casimirRatio := funCas / adjCas = 3/8.
The PROJECTED reduction = the cross-census depth weight × the Casimir projection:
        projectedS := gatherIsoSpinCensus · (funCas/adjCas) = 4 · (3/8) = 3/2.
where gatherIsoSpinCensus = 2·isoDepth = 4 is the banked adjoint census (the depth weight).

## WHY 3/8 (Casimir) AND NOT 1/4 (Dynkin) — the ceiling RESOLVED
The predecessor's ceiling had TWO admissible readings: ratioTempered=3/2 (charge:iso depth ratio 3:8)
and doublingTempered=1 (doubling-square = std su(2) Dynkin index T(fund):T(adj)=1:4). The Dynkin
index is the TRACE-normalization Tr(TᵃTᵇ)=T(R)δᵃᵇ — a trace over a PRODUCT of two DIFFERENT
generators; it is the dimension-weighted reading. The census here is the fold's own SELF-overlap
(same generator squared, summed over the algebra) = the CASIMIR, NOT the Dynkin trace. So the FORCED
projection is the Casimir ratio 3/8, which SELECTS projectedS = 3/2 = ratioTempered and REJECTS
doublingTempered = 1. The ceiling (temperings_disagree) is resolved by the representation-theory
datum the census layer lacked — supplied by the banked Casimir eigenvalues, NOT the scale tower.

## ONE-CAUSE CORROBORATION (a genuine novelty joint, not a coincidence)
casimirRatio = funCas/adjCas = 3/8  EQUALS  isoDepth/chargeTraceDepth = 2/(16/3) = 3/8.
Two INDEPENDENT banked structures — the su(2) Casimir dichotomy (N277/N279) and the charge:isospin
depth ratio (N253/N342/X6) — agree on 3/8. The projection is corroborated; only the Dynkin reading
(1/4) dissents, and it is the reading measuring a different (trace, not self-overlap) invariant.

## LOAD-BEARING (free-floating rail): the magnitudes 8 and 3 are TIED to the banked eigenvalues
adjCas=8 and funCas=3 are NOT asserted literals — each is EXTRACTED from its banked Casimir
eigenvalue theorem with TEETH (uniqueness): any c with casimirOp u1M = c•u1M forces c=−8 (via
u1M≠0); any c with Σ(lreg)²=c•id forces c=−3 (via a nonzero test vector). A wrong magnitude fails
to compile. So the projection genuinely rests on N277/N279, not on re-picking a ceiling value.

## THEOREMS (all over Cut / the banked objects)
- adjCasMag_forced : ∀ c:ℚ, casimirOp u1M = c•u1M → c = -8            (teeth, ties to N277)
- funCasMag_forced : ∀ c:ℚ, (Σ lreg²) = c•id → c = -3                 (teeth, ties to N279)
- casimirRatio_eq : casimirRatio = 3/8
- projectedS_eq : projectedS = 3/2
- projectedS_admissible : 0 < projectedS ∧ projectedS < isoDepth       (interior)
- projectedS_below_crosscensus : projectedS < gatherIsoSpinCensus      (strictly below 2·isoDepth by rep-ratio)
- projectedS_net_positive : 0 < netIsoDepth projectedS                 (=1/2 > 0)
- projectedS_selects_ratioTempered : projectedS = ratioTempered        (SELECTS 3/2)
- projectedS_rejects_doublingTempered : projectedS ≠ doublingTempered  (REJECTS 1 — ceiling resolved)
- casimirRatio_eq_depthRatio : casimirRatio = isoDepth / chargeTraceDepth   (one-cause corroboration)
- teeth: projectedS ≠ gatherIsoSpinCensus ; casimirRatio ≠ 1/4 (Dynkin) ; projectedS ≠ isoDepth (boundary)
- projection_selection_landing (welded capstone, non-hollow)

## DISCIPLINE
foundations-only ⊆ {propext,Classical.choice,Quot.sound}; NO fit (3/8 from Casimirs, never from
where 137.036 sits — the fit value ≈1.90 is named only to EXCLUDE); NO new axiom; NO scale tower;
Cut ground, Mathlib machinery only; costume C536 bites; import guard never OneAxiom/MassGapOne.
Module: Phys/Algebra/CasimirProjectionSelectsS.lean
