/-
  Counterexamples.ForcedStopCoreAdjointNonCentralCostume — N2d-MIDDLE-core anti-vacuity
  costume (must be REJECTED).
  ===========================================================================
  THE GARBAGE WITNESS for the POLARIZATION CORE's load-bearing crux — the ADJOINT
  IDENTITY `bilin (u·v) w = bilin v (star u · w)`. This is the single non-bare-ring
  step in the forward Hurwitz chain (`Phys/Cascade/ForcedStop.lean`, `CDcore.adjoint3`,
  `bilin_L_zero`): it is what lets `bilin (L x y) w` collapse to `0`, forcing the left
  scaling law and hence base associativity. The whole forced equivalence
  `Nrm multiplicative on CD A ⟺ A associative` rests on it.

  THE POINT (docs/RUNBOOK.md W5, THE ONE LAW). The adjoint identity is NOT a bare-ring
  fact. It holds on the structure the DOUBLING produces — a base `A = CD (CD B)`, whose
  traces `a + star a` and self-overlaps `a · star a` are CENTRAL (the trunk's Born =
  self-overlap = CENTRAL positivity) — and `adjoint3` derives it there as an `ext`+`ring`
  identity, never positing centrality. The costume asserts the SAME identity on a base
  where centrality FAILS: `M₂ ℚ`, the `2×2` rationals (a `Ring` with `StarRing` via
  conjugate-transpose, whose off-diagonal self-overlaps are non-central). On the carrier
  `CD (M₂ ℚ)` (built with the local `narCD`/`srCD` instances), at the witness

      u = ⟨E₀₁, 0⟩,  v = ⟨E₁₀, 0⟩,  w = ⟨E₀₀, 0⟩   (Eᵢⱼ the matrix units)

  the `(0,0)` entry of the two sides DISAGREE: `bilin (u·v) w` is `2` (`adj_lhs`),
  `bilin v (star u · w)` is `0` (`adj_rhs`). Claiming the adjoint identity holds here
  forces the false core `2 = 0`.

  This guards ANTI-VACUITY (docs/RUNBOOK.md W8): `adjoint3` genuinely USES the cascade's
  centrality — it is FALSE on a non-central base, so the polarization core is not a
  vacuous restatement true over any `*`-ring. If this BOGUS adjoint instance ever
  COMPILED, the forward Hurwitz chain (`bilin_L_zero`, `scaling_of_H`, the forced iff)
  would rest on a bare-ring identity that does not exist, and the equivalence would be
  empty. The kernel must REJECT it.

  The two component lemmas `adj_lhs = 2` and `adj_rhs = 0` are themselves genuinely
  PROVED (the projected entries really are `2` and `0`); only the final equality is
  bogus, and it reduces — via those proved values — to the false core `2 = 0`. The
  manifest's PASS_SIGNATURE matches that core.
-/
import Phys.Cascade.ForcedStop
import Mathlib.Data.Matrix.Basic
import Mathlib.Data.Matrix.Mul
import Mathlib.Algebra.Star.Basic
import Mathlib.Tactic

open Phys.Cascade

namespace Phys.Cascade

/-- The non-central `*`-ring base: the `2×2` rationals (conjugate-transpose star). Its
    off-diagonal self-overlaps are NOT central — the exact structure the cascade's
    doubling does NOT produce, where the adjoint identity fails. -/
abbrev CMM2 := Matrix (Fin 2) (Fin 2) ℚ

attribute [local instance] CD.narCD CD.srCD

/-- Matrix unit `E₀₁`. -/
def cmA : CMM2 := !![0,1;0,0]
/-- Matrix unit `E₁₀`. -/
def cmB : CMM2 := !![0,0;1,0]
/-- Matrix unit `E₀₀`. -/
def cmC : CMM2 := !![1,0;0,0]

/-- Adjoint witness `u = ⟨E₀₁, 0⟩` on `CD (M₂ ℚ)`. -/
def cmU : CD CMM2 := ⟨cmA, 0⟩
/-- Adjoint witness `v = ⟨E₁₀, 0⟩` on `CD (M₂ ℚ)`. -/
def cmV : CD CMM2 := ⟨cmB, 0⟩
/-- Adjoint witness `w = ⟨E₀₀, 0⟩` on `CD (M₂ ℚ)`. -/
def cmW : CD CMM2 := ⟨cmC, 0⟩

set_option maxHeartbeats 1000000

/-- The LEFT side of the adjoint identity at the witness, projected to entry `(0,0)`, is
    `2` (genuinely non-degenerate — this is what makes the adjoint bite on a non-central
    base). -/
theorem adj_lhs : (CD.bilin (cmU * cmV) cmW) 0 0 = (2 : ℚ) := by
  simp only [CD.bilin, cmU, cmV, cmW, cmA, cmB, cmC, CD.mul_re, CD.mul_im, CD.star_re,
    CD.star_im, CD.add_re, star_zero, mul_zero, zero_mul, add_zero, zero_add,
    Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_two, Matrix.star_apply, star_trivial,
    Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.empty_val', Matrix.cons_val_fin_one, Matrix.zero_apply]
  norm_num

/-- The RIGHT side of the adjoint identity at the witness, projected to entry `(0,0)`, is
    `0` (the non-centrality of `M₂ ℚ` sends the conjugated product the other way). -/
theorem adj_rhs : (CD.bilin cmV (star cmU * cmW)) 0 0 = (0 : ℚ) := by
  simp only [CD.bilin, cmU, cmV, cmW, cmA, cmB, cmC, CD.mul_re, CD.mul_im, CD.star_re,
    CD.star_im, CD.add_re, star_zero, mul_zero, zero_mul, add_zero, zero_add,
    Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_two, Matrix.star_apply, star_trivial,
    Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.empty_val', Matrix.cons_val_fin_one, Matrix.zero_apply]
  norm_num

end Phys.Cascade

/-- WRONG (VACUITY) CLAIM: that the ADJOINT IDENTITY `bilin (u·v) w = bilin v (star u · w)`
    holds at the witness `u = cmU, v = cmV, w = cmW` on `CD (M₂ ℚ)` — whose base `M₂ ℚ`
    is NON-CENTRAL (the structure the cascade's doubling does NOT produce). Projecting both
    sides to entry `(0,0)` (proved lemmas `adj_lhs = 2`, `adj_rhs = 0`) this reduces to the
    false core `2 = 0` and must FAIL to elaborate. -/
theorem core_adjoint_noncentral_BOGUS :
    (CD.bilin (Phys.Cascade.cmU * Phys.Cascade.cmV) Phys.Cascade.cmW) 0 0
      = (CD.bilin Phys.Cascade.cmV (star Phys.Cascade.cmU * Phys.Cascade.cmW)) 0 0 := by
  rw [Phys.Cascade.adj_lhs, Phys.Cascade.adj_rhs]
