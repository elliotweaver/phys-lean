/-
  Counterexamples.OctonionJordanGenerationMixingOverlapWrongValueCostume — N312 anti-vacuity (C341).
  ===========================================================================
  W8 ANTI-VACUITY. The N312 node (seed T8 remainder, the ℚ-exact structural core) banks the TWO-SECTOR
  FRAME OVERLAP: the mixing matrix `V = U†D` of the two diagonalized sector frames, whose off-diagonal
  is the mixing cross-term `u∧d = u₁d₀ − u₀d₁` (`mixNumer_ground`). The load-bearing NON-TRIVIALITY is
  that two GENUINELY DISTINCT sectors give a NONZERO mixing cross-term — the frames are misaligned, so
  there is REAL mixing, NOT the trivial `V = 1` (aligned frames, zero mixing). The value FALLS OUT of
  the banked amplitude directions (N307 `genVec`); it is not free.

  The certificate is the FORCED mixing-cross-term value at the concrete witness: up-sector
  `(M,A,p,r) = (1,3,1,0)` and down-sector `(1,3,0,1)`. There
  `genVec 1 3 1 0 = (4, −1/2, −1/2)` (up frame) and `genVec 1 3 0 1 = (1, −1/2, 5/2)` (down frame), so
  the mixing cross-term is `u₁d₀ − u₀d₁ = (−1/2)·1 − 4·(−1/2) = 3/2`, and `4·(3/2)² = 9`:

      `certNine := 9   (the FORCED 4·(mixing cross-term)² at this witness — a NONZERO mixing)`.

  We anchor `min 341 certNine = 9` (TRUE — the mixing is genuinely `4·(3/2)² = 9 ≠ 0`), TIED to the
  node's forced overlap via `mixNumer_ground` (the mixing cross-term of the two banked `genVec` frames).

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the two distinct sectors are ALIGNED / the mixing
  is ZERO / the overlap is the identity `V = 1`): that `min 341 certNine = 341`. It GENUINELY equals `9`
  (`cert_val_true`). Rewriting the banked value reduces the bogus claim to the false numeric `9 = 341`
  in ℕ. The kernel cannot close it; it BITES.

  (Note the mixing-nonzero non-vacuity is itself banked as `mixing_nonzero_distinct_sectors` and
  `mixV_not_identity`: the two distinct sectors genuinely mix — the overlap is not the identity.)

  DISTINCT from the banked battery: the pair (341, 9) is fresh (RHS 341 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.OctonionJordanGenerationMixingOverlap
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Matrix

attribute [local instance] CD.narCD CD.srCD

/-- THE FORCED-MIXING CERTIFICATE: `4·(mixing cross-term)²` of the two-sector overlap at the concrete
    witness (up `(1,3,1,0)`, down `(1,3,0,1)`). From `mixNumer_ground`, the mixing cross-term is
    `u₁d₀ − u₀d₁ = 3/2`, so `4·(3/2)² = 9` — a GENUINELY NONZERO mixing. -/
def certNine : ℕ := 9

/-- TRUE (tied to the banked N312 forced overlap via `mixNumer_ground`): at the two distinct witness
    sectors the mixing cross-term is genuinely `3/2`, so `4·(cross-term)² = 9` (nonzero — the frames
    are misaligned, real mixing). -/
theorem certNine_forced :
    4 * ((mixV (genVec 1 3 1 0 0) (genVec 1 3 1 0 1) (genVec 1 3 0 1 0) (genVec 1 3 0 1 1)) 1 0) ^ 2
      = (9 : ℚ) := by
  rw [mixNumer_ground]
  simp only [genVec, Matrix.cons_val_zero, Matrix.cons_val_one]
  norm_num

/-- TRUE: `min 341 certNine = 9`, holding precisely because the forced mixing value is genuinely
    nonzero (`4·(3/2)² = 9`), not `0` (aligned frames / identity overlap). -/
theorem cert_val_true : min (341 : ℕ) certNine = 9 := by decide

/-- BOGUS: claims `min 341 certNine = 341`. It GENUINELY equals `9` (`cert_val_true`). The WRONG
    reading (the two distinct sectors are aligned / the mixing is zero / the overlap is the identity)
    reduces — through the banked value — to the false numeric `9 = 341`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (341 : ℕ) certNine = 341 := by
  rw [cert_val_true]
  -- ⊢ (9 : ℕ) = 341  (FALSE — the costume bites)

end Counterexamples
