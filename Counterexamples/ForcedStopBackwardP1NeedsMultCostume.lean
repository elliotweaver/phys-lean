/-
  Counterexamples.ForcedStopBackwardP1NeedsMultCostume — N2d-hard-backward
  anti-vacuity costume (must be REJECTED).
  ===========================================================================
  THE GARBAGE WITNESS for the backward-half polarization content, in the precise
  wrong shape the task names: claiming the composition identity `P1`
  (`bilin (x·z) (y·z) = bilin x y · Nrm z`) holds UNCONDITIONALLY — i.e. WITHOUT the
  multiplicativity hypothesis `Nrm (u v) = Nrm u · Nrm v`. The whole content of `P1`
  (`Phys/Cascade/ForcedStop.lean`) is that it is FORCED BY multiplicativity; it is FALSE
  on a non-composition algebra. At the terminal algebra `S ℚ = CD (O ℚ)` (where `Nrm`
  is NOT multiplicative) the identity FAILS on the concrete witness
  `x = e₄, y = e₁₅, z = zdX` (`zdX = e₁ + e₁₀`): projecting both sides to the base
  scalar `.re.re.re` gives `4` on the left (`bilin (x·z) (y·z)`, lemma `c13_lhs`) and
  `0` on the right (`bilin x y · Nrm z`, lemma `c13_rhs`). Claiming they are equal
  forces the false core `4 = 0`.

  This guards ANTI-VACUITY (docs/RUNBOOK.md W8): `P1` genuinely USES its hypothesis. If
  this BOGUS unconditional `P1` ever COMPILED, the banked `P1` would be a vacuous
  restatement true without the composition law — exactly the empty-shell failure the
  battery exists to catch. The kernel must REJECT it.

  The two component lemmas `c13_lhs = 4` and `c13_rhs = 0` are themselves PROVED (the
  projected sides really are `4` and `0`); only the final equality is bogus, and it
  reduces — via those proved values — to the false core `4 = 0`. The manifest's
  PASS_SIGNATURE matches that core.
-/
import Phys.Cascade.ForcedStop
import Mathlib.Data.Rat.Defs
import Mathlib.Tactic

open Phys.Cascade

namespace Phys.Cascade

/-- The first costume witness `e₄ ∈ S ℚ` (flat basis direction 4). -/
def c13X : S ℚ := ⟨⟨⟨⟨0, 0⟩, ⟨0, 0⟩⟩, ⟨⟨1, 0⟩, ⟨0, 0⟩⟩⟩, ⟨⟨⟨0, 0⟩, ⟨0, 0⟩⟩, ⟨⟨0, 0⟩, ⟨0, 0⟩⟩⟩⟩

/-- The second costume witness `e₁₅ ∈ S ℚ` (flat basis direction 15). -/
def c13Y : S ℚ := ⟨⟨⟨⟨0, 0⟩, ⟨0, 0⟩⟩, ⟨⟨0, 0⟩, ⟨0, 0⟩⟩⟩, ⟨⟨⟨0, 0⟩, ⟨0, 0⟩⟩, ⟨⟨0, 0⟩, ⟨0, 1⟩⟩⟩⟩

set_option maxHeartbeats 2000000 in
/-- The LEFT side of `P1` at the witness, projected to the base scalar, is `4`
    (genuinely non-degenerate — this is what makes the identity bite). -/
theorem c13_lhs :
    (CD.bilin (c13X * zdX) (c13Y * zdX)).re.re.re = (4 : ℚ) := by
  simp only [CD.bilin]
  simp [c13X, c13Y, zdX, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
    CD.add_re, CD.add_im, Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im']
  norm_num

set_option maxHeartbeats 2000000 in
/-- The RIGHT side of `P1` at the witness, projected to the base scalar, is `0`
    (`Nrm` is not multiplicative here, so the right side collapses). -/
theorem c13_rhs :
    (CD.bilin c13X c13Y * CD.Nrm zdX).re.re.re = (0 : ℚ) := by
  simp only [CD.bilin, CD.Nrm]
  simp [c13X, c13Y, zdX, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
    CD.add_re, CD.add_im, Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im']

end Phys.Cascade

/-- WRONG (VACUITY) CLAIM: that `P1`'s composition identity holds at the witness
    `x = c13X, y = c13Y, z = zdX` on `S ℚ` WITHOUT the multiplicativity hypothesis.
    Projecting both sides to the base scalar (proved lemmas `c13_lhs = 4`,
    `c13_rhs = 0`) this reduces to the false core `4 = 0` and must FAIL to
    elaborate. -/
theorem backward_P1_needs_mult_BOGUS :
    (CD.bilin (Phys.Cascade.c13X * zdX) (Phys.Cascade.c13Y * zdX)).re.re.re
      = (CD.bilin Phys.Cascade.c13X Phys.Cascade.c13Y * CD.Nrm zdX).re.re.re := by
  rw [Phys.Cascade.c13_lhs, Phys.Cascade.c13_rhs]
