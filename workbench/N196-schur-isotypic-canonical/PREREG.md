# N196 — PREREG (frozen GO/NO-GO + KILL before compute)

## Context
HEAD f51613c clean (N195 fully committed; git status only workbench scratch — NOT a crime scene).
Gauge-rep arc N184–N195 complete: 3 factors, inclusion tower u(1)↪su(2)↪g₂, all three
actions on the 7, joint so(4) bigrading 7=(3,1)⊕(2,2), BOTH summands irreducible (N194 (2,2),
N195 (3,1)). W4.5 sufficiency bias VERY STRONG (11 consecutive gauge-rep nodes).

## MEASURE-FIRST verdict (frozen)
Of the §N195-superseded fronts:
- (i) FULL ISOTYPIC / SCHUR DECOMPOSITION. The rejected (N195) version was "both irreducible +
  dim mismatch ⟹ Schur" = a mechanical juxtaposition with NO new lever. CHOSEN, done RIGHT with a
  GENUINELY-NEW lever that does NOT invoke either irreducibility:
    * the (3,1) = iotaO(ImH) is su(2)_T-TRIVIAL (N192 leftImDeriv_iotaO: leftImDeriv Q (iotaO a)=0);
    * the (2,2) = kappaO(⊤) has NO nonzero su(2)_T-fixed vector — because it is the LEFT-REGULAR
      H-module and H ℚ is a DIVISION/associative algebra (left-mult by hI is bijective: hI·b=0⟹b=0
      via star hI·(hI·b)=(star hI·hI)·b and hI²=−1; surjective via hI·(star hI·c)=c).
  A su(2)_T-equivariant map between the two summands must therefore VANISH (both directions):
    (3,1)→(2,2): f(iotaO a) is su(2)_T-fixed in (2,2) [intertwining + triviality of source] ⟹ =0.
    (2,2)→(3,1): leftImDeriv hI annihilates the iotaO image ⟹ f(kappaO(hI·b))=0 ∀b; L_hI onto ⟹ f≡0.
  This is the genuine intertwiner-vanishing the task demands, and it is the CAPSTONE that turns
  "both summands irreducible" into "the decomposition 7=(3,1)⊕(2,2) is the canonical / unique
  isotypic decomposition (multiplicity-free, no cross maps)". The SAME Born-positivity/division
  survival at the quaternion rung (the cause that stops the cascade) now forces the no-cross-map.
- (ii) so(4)⊕complement in g₂: ℤ↔ℚ type bridge (leftImDeriv/secondSU2 over ℤ vs derivationLieQ over
  ℚ). HEAVIER — deferred.
- (iii) hypercharge / electroweak / Yang–Mills / DIFFERENT joint: PIVOT target, childed as N197.

This node is framed as the CLOSING CAPSTONE of the gauge-rep arc; N197 is the HONEST PIVOT to a
genuinely different physics joint (W4.5).

## GO / NO-GO
GO if: the no-su(2)_T-fixed-vector lemma + BOTH cross-Hom-vanishings compile foundations-only,
each obligation a structural rewrite through banked N190/N191/N192 levers + H associativity.
NO-GO (reframe/pivot) if: any obligation needs a coordinate brute over O ℚ, an unbanked H-division
fact that itself is heavy, or a ℤ↔ℚ bridge.

## KILL
KILL any single obligation at 60s / 200000 heartbeats. ≥2 obligations at KILL ⟹ instrument wall
(W9) → decompose or reframe, do NOT inflate. KILL the whole front if the probe is not clean in 2
attempts → pivot to (iii) directly.

## Banked levers (import DerivationRep7SU2TBranching N192 + IrreducibleBimodule N194 + IrreducibleAdjoint N195)
iotaO/kappaO/iotaO_injective/kappaO_injective/ImH/mem_ImH (N190);
leftImDeriv/leftImDeriv_iotaO/leftImDeriv_kappaO (N191/N192);
hI/hJ/hK + star hI=-hI (N184); H_associative + mul_assoc (Quaternion);
quatNorm/quatNorm_ne_zero/starMulSelf_eq_quatNorm (N194, only if needed).

## Costume C228 (W8 anti-vacuity)
A WRONG claim of the front reducing to a false numeric DISTINCT from the battery (… C226 194=1,
C227 195=-2). Use 196 = <distinct value>, e.g. the deep coordinate of leftImDeriv hI (kappaO 1) =
kappaO hI is GENUINELY ≠ 0 (the (2,2) singlet line kappaO 1 is NOT su(2)_T-fixed — same teeth as
N194 singletLine), so a WRONG claim "the (2,2) HAS a nonzero su(2)_T-fixed vector / a nonzero cross
intertwiner exists / the decomposition is NOT canonical" forces a false numeric. Pick 196 = 0 style
with a genuinely-nonzero coordinate, e.g. some coordinate = 196 vs its true value.

## Name-collision guard (grep before finalize)
New names candidates: kappaTop_no_su2T_fixed / left_mul_hI_injective / left_mul_hI_surjective /
hom_iotaImH_to_kappaTop_eq_zero / hom_kappaTop_to_iotaImH_eq_zero / isotypic_decomposition_canonical /
leftImDeriv_annihilates_map_iotaImH + W8 witnesses. Grep all across Phys/ Counterexamples/ Audits/ Phys.lean.
