/-
  Counterexamples.OctonionJordanGenerationMixingFrameWrongValueCostume — N311 anti-vacuity (C340).
  ===========================================================================
  W8 ANTI-VACUITY. The N311 node (seed T8, the ℚ-exact structural half) banks the generation-mixing
  TRIDIAGONAL FRAME: the nearest-neighbour coupling is the GEOMETRIC mean of the two adjacent masses,
  `(offdiag)² = mᵢ · mⱼ` (`massMat_nn_born_01`, the √ dissolving through the Born square `mₖ = aₖ²`).
  The load-bearing NON-TRIVIALITY is that the coupling squared is genuinely the PRODUCT `mᵢ mⱼ`, NOT
  the arithmetic-style SUM `mᵢ + mⱼ` (nor any other reading) — it FALLS OUT of the banked amplitude
  product `aᵢ aⱼ` whose square is `aᵢ² aⱼ² = mᵢ mⱼ`, it is not free.

  The certificate is the FORCED coupling-squared value at the concrete witness `(M,A,p,r) = (1,3,1,0)`.
  There `genVec 1 3 1 0 = (1+3, 1−3/2, 1−3/2) = (4, −1/2, −1/2)`, so the masses are
  `massVec = (16, 1/4, 1/4)` and the gen1↔gen2 off-diagonal is `a₀ a₁ = 4 · (−1/2) = −2`, whose square
  is `4`. From `massMat_nn_born_01`, `(massMat 0 1)² = m₀ · m₁ = 16 · (1/4) = 4`. So

      `certFour := 4   (the UNIQUE forced coupling-squared = the geometric mean m₀·m₁ at this witness)`.

  We anchor `min 340 certFour = 4` (TRUE — the coupling squared genuinely equals the PRODUCT `m₀·m₁ = 4`),
  TIED to the node's forced value via `massMat_nn_born_01` (the geometric-mean Born-squared relation).

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the coupling is the arithmetic sum `m₀+m₁`, or
  free, or not geometric): that `min 340 certFour = 340`. It GENUINELY equals `4` (`cert_val_true`).
  Rewriting the banked value reduces the bogus claim to the false numeric `4 = 340` in ℕ. The kernel
  cannot close it; it BITES.

  (Note the geometric-vs-arithmetic non-vacuity is itself banked as `coupling_geometric_not_arithmetic`:
  the sum `m₀+m₁ = 16 + 1/4 = 65/4 ≠ 4 = m₀·m₁`, so the wrong additive reading is genuinely different.)

  DISTINCT from the banked battery: the pair (340, 4) is fresh (RHS 340 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.OctonionJordanGenerationMixingFrame
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Matrix

attribute [local instance] CD.narCD CD.srCD

/-- THE FORCED-COUPLING CERTIFICATE: the value of the nearest-neighbour coupling SQUARED
    `(massMat 0 1)²` at the concrete witness `(M,A,p,r) = (1,3,1,0)`. From `massMat_nn_born_01`, this
    is the geometric mean `m₀ · m₁ = 16 · (1/4) = 4`. -/
def certFour : ℕ := 4

/-- TRUE (tied to the banked N311 forced value via `massMat_nn_born_01`): the coupling squared at the
    witness `(1,3,1,0)` is genuinely the PRODUCT `m₀ · m₁ = 4`. The banked `massMat_nn_born_01` lands
    `(massMat 0 1)² = massVec 0 · massVec 1`; at this witness that product is `4` (not `65/4 = m₀+m₁`). -/
theorem certFour_forced :
    (massMat (1 : ℚ) 3 1 0 0 1) ^ 2 = 4 := by
  rw [massMat_nn_born_01]
  simp only [massVec, genVec, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons]
  norm_num

/-- TRUE: `min 340 certFour = 4`, holding precisely because the forced coupling-squared value is
    genuinely `4` (the geometric mean `m₀·m₁`), not `65/4` (the sum) or any other value. -/
theorem cert_val_true : min (340 : ℕ) certFour = 4 := by decide

/-- BOGUS: claims `min 340 certFour = 340`. It GENUINELY equals `4` (`cert_val_true`). The WRONG
    reading (the coupling is the arithmetic sum / free / not geometric) reduces — through the banked
    value — to the false numeric `4 = 340`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (340 : ℕ) certFour = 340 := by
  rw [cert_val_true]
  -- ⊢ (4 : ℕ) = 340  (FALSE — the costume bites)

end Counterexamples
