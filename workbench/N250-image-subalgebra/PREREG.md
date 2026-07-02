# N250 PREREG — THE IMAGE of the faithful colour rep as a dim-8 su(3) Lie subalgebra of End ℚ Vsub, in the commutant of chargeOpV

## TARGET (self-authored, worker-body STEP 5; ONE target, no menu)
Build `colourRepImg := colourRepV.range : LieSubalgebra ℚ (Module.End ℚ Vsub)` and PROVE:
- ⭐⭐⭐ `finrank ℚ colourRepImg.toSubmodule = 8` — THE FIRST DOWNSTREAM USE of N249 injectivity:
  image dim = domain dim = 8 REQUIRES faithfulness (via `LieHom.equivRangeOfInjective` →
  `LinearEquiv.finrank_eq` transporting N201 `finrank_colourCentralizer_eq_eight`).
- ⭐⭐ commutant: `∀ M ∈ colourRepImg, Commute M chargeOpV` — every image element commutes with
  the charge complex structure (N248 `colourRepV_commute` lifted to the whole range via `mem_range`).
- W8 non-vacuity: the image is NONZERO (dim 8 ≠ 0; or `colourRepV_ne_zero` gives a nonzero element).
- capstone: image is a Lie subalgebra + dim 8 + in the commutant of chargeOpV + nonzero.

## WHY FORWARD (not a re-pin of N249/N248)
N249 gave injectivity (a property of the map); N248 gave the rep + commute. NEITHER built the
IMAGE as a concrete object nor its dimension. "image dim = 8" is the FIRST place injectivity does
load-bearing work (image dim = domain dim needs faithfulness). Genuinely new structure.

## PROOF ROUTE (measured before production)
- `colourRepImg := colourRepV.range` (Mathlib `LieHom.range` → a `LieSubalgebra`).
- dim: `e := colourRepV.equivRangeOfInjective colourRepV_faithful : ↥colourCentralizer ≃ₗ⁅ℚ⁆ colourRepV.range`;
  `e.toLinearEquiv.finrank_eq : finrank ℚ ↥colourCentralizer = finrank ℚ ↥colourRepV.range`;
  reconcile `↥colourCentralizer` with `colourCentralizer.toSubmodule` (N201 = 8) and
  `↥colourRepV.range` with `colourRepImg.toSubmodule`. THE ONE UNCERTAIN STEP — MEASURE.
- commutant: `M ∈ colourRepImg → ∃ D, colourRepV D = M` (`LieHom.mem_range`); then N248
  `colourRepV_commute D : Commute (colourRepV D) chargeOpV`, rewrite.

## GO / NO-GO
- GO if probe compiles all three obligations (finrank reconciliation resolved, commutant, nonzero)
  net-of-import in a bounded probe, NO coordinate bash, NO maxHeartbeats raise.
- NO-GO / reframe if the finrank reconciliation needs an unbanked bridge (would signal instrument
  wrong → route through `colourRepV.toLinearMap.range` plain Submodule for the dimension, per the
  subtype-depth instrument note; keep LieSubalgebra only for algebra structure).

## KILL CLASSES (declare instrument failure, do NOT grind past)
- ANY `ring`/`decide`/`simp`-blowup / coordinate expansion — this is a PACKAGING node, must be light.
- maxHeartbeats raise above default — instrument wall, STOP.
- ≥2 probe attempts on the same finrank form that time out — switch to the plain-Submodule route.

## COMPILE-COST BUDGET
- Imports ~30-50s (transitive N248/N249 tower). NET-OF-IMPORT bound: each probe obligation < 20s.
  If any single obligation exceeds ~30s net-of-import → W9 instrument wall, decompose/reframe.
- Production whole-module olean expected < 15s net-of-import (pure packaging, like N247/N249).

## RAILS
- COMPLEX FIELD = METALANGUAGE: keep chargeOpV/colourRepV/Vsub/colourCentralizer DERIVED REAL;
  commutant is the REAL `Commute M chargeOpV`. NO Algebra ℚ (Dbl ℚ), NO TensorProduct, NO ℚ[i].
- FREE-FLOATING: magnitude theorem TYPE mentions banked tower objects (colourRepImg/colourRepV/
  Vsub/chargeOpV/colourCentralizer). Extend the strand N240–N249, never fork.
- COSTUME C281: anchor `finrank ℚ colourRepImg.toSubmodule = 8` in the IMAGE-dimension role
  (8 = 281 fresh RHS; LHS the IMAGE dim, distinct from C280's DOMAIN dim and C278's reductive 9=1+8).
- STANDARD: unbroken / complete (#print axioms ⊆ {propext, Classical.choice, Quot.sound}) /
  words-removable (delete colour/su(3)/charge: colourRepV.range is a dim-8 Lie subalgebra of
  End ℚ Vsub whose every element commutes with chargeOpV — pure algebra).
- W8 non-vacuity: image genuinely dim-8 (requiring faithfulness), NOT collapsed.
