# N183 — THE 2ND-ORDER MATRIX/ENTRY/OPERATOR TANGENT of expMap (PREREG, frozen before compute)

## Target (front (i), the forced node per ROADMAP §N183 / N182 handoff)
Lift the banked SCALAR 2nd-order power-series derivative `cut_powerseries_deriv2` (N182,
Phys/Foundation/ContinuumScalarDeriv2.lean) to the matrix exponential `expMap`, EXACTLY
mirroring how N41g (Phys/Algebra/DerivationOTangent.lean) lifted the first-order
`cut_powerseries_deriv` to `expMap_entry_tangent` → `expMap_vec_tangent` → `expO_tangent`.

The 2nd-order tangent recovers the QUADRATIC coefficient ½•M² (= expTerm M 2), the genuine
2nd-order data the first-order tangent (coefficient M) cannot express:

    (t²)⁻¹ • (expMap(t•M) − 1 − t•M)  →  ½•M²   as t → 0 in 𝓝[≠] 0.

## Decls planned (production: Phys/Algebra/DerivationOTangent2.lean, namespace Phys.Algebra)
1. `expTerm_two_entry`        : expTerm M 2 i j = (1/2 : Cut) * (M^2) i j      (2! = 2)
2. `expMap_entry_tangent2`    : (t²)⁻¹·(expMap(t•M) i j − 1_{ij} − t·M_{ij}) → expTerm M 2 i j
                                 = cut_powerseries_deriv2 applied to a n := expTerm M n i j
                                   (entire, expTerm_entry_abs_summable), a₀=1_{ij}, a₁=M_{ij}, a₂=expTerm M 2 i j
3. `expMap_smul_tangent2`     : (t²)⁻¹ • (expMap(t•M) − 1 − t•M) → (1/2:Cut)•M^2   (matrix, the HEADLINE)
4. `expMap_vec_tangent2`      : (t²)⁻¹ • (expMap(t•M) *ᵥ v − v − t•(M *ᵥ v)) → (1/2:Cut)•(M^2 *ᵥ v)
5. `expO_tangent2` (★★)       : (t²)⁻¹ • (expO((t•D')…)x − x − t•(D' x)) → (1/2:Cut)•(D'^2 x)
                                 (operator form over the non-associative O Cut, transported through coordOCut
                                  via coordOCut_expO + derivMatrix_smul + expO_matrix_rep D' 2 x)
6. `expO_tangent2_zero` (W8)  : the zero-derivation's 2nd-order tangent is 0 (hypothesis class inhabited)

## W8 NON-VACUITY (the costume MUST bite, ½•M² is genuine 2nd-order data)
Concrete witness wM := single 0 1 1 + single 1 0 2 (or a diag witness). The genuine 2nd-order
coefficient expTerm wM 2 0 0 (= ½•(wM²)_{00}) evaluates to a concrete nonzero value DISTINCT
from the first-order coefficient wM 0 0 = 0 — genuine 2nd-order data the first-order tangent
cannot express. Costume C215 claims this genuine value = 183, forcing a false numeric
(distinct from the battery: … C212 180=1, C213 1=181, C214 1=182). Target false numeric:
the genuine value VS 183. Pick wM so the genuine value is small (1 or 2) → "<v> = 183".

## GO / NO-GO
GO if: the scratch probe compiles clean (entry tangent2 is a one-`congr'` mirror of the banked
expMap_entry_tangent + the extra `expTerm_one_entry` rewrite; matrix/vector/operator forms mirror
N41g exactly); axiom audit clean; costume bites. NO-GO / RETHINK if any obligation fights —
THE ONE LAW (W5): return to the trunk, do NOT grind, do NOT inflate maxHeartbeats.

## KILL (instrument-failure threshold, W9)
KILL = 90s / obligation, 150s / file. If any single obligation exceeds 90s in the bounded probe,
STOP — it is an instrument wall (decompose / reframe), not a longer grind. The first-order
analog built in seconds; the 2nd-order is the SAME shape one peel deeper, so this should be LIGHT.

## STANDARD
UNBROKEN: descends only from the banked cut_powerseries_deriv2 (N182) + expTerm/expMap machinery
(N39/N40 DerivationAutExp/DerivationAutExpHom) + the N41g coordinate transport (coordOCut_expO,
derivMatrix_smul, expO_matrix_rep) over the derived ℝ Cut. NO Mathlib HasDerivAt/deriv/NormedField,
NO Mathlib ℝ/ℂ as content, NO posited Taylor/smooth structure, NO bridge.
COMPLETE: foundations-only {propext, Classical.choice, Quot.sound}, audited vs built olean.
WORDS-REMOVABLE: no physics words in statements; pure analysis over the derived field.
