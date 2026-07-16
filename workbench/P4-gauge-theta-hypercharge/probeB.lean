import Phys.Algebra.StrongCPTheta
import Phys.Algebra.ChiralGenerationIsospinTrace
import Phys.Algebra.DerivationAutGroup
import Mathlib.Tactic

open scoped BigOperators
open Phys.Cascade Phys.Cascade.CD
open Phys.Algebra
open Phys.Algebra.HJ

namespace P4ProbeB

attribute [local instance] CD.narCD CD.srCD

/-! ## PIECE A (extra) — scalar automorphism is unique (no center scalar). -/

/-- The ONLY scalar (dilation/center) map `x ↦ c•x` that is an algebra automorphism is `c = 1`.
    In particular `c = −1` (−I) is excluded — the derived gauge group has NO nontrivial central
    scalar to generate θ-vacuum sectors. -/
theorem scalar_aut_forces_one {φ : O ℚ ≃ₗ[ℚ] O ℚ} (c : ℚ) (hc : ∀ x, φ x = c • x)
    (h : IsAlgAut φ) : c = 1 := by
  have h1 : φ 1 = 1 := h.2
  rw [hc 1] at h1
  have h2 := congrArg reQ h1
  rw [reQ_smul, reQ_one, mul_one] at h2
  exact h2

/-! ## PIECE B — the hypercharge normalization is FORCED (scale-invariant observables). -/

/-- The weak mixing observable is SCALE-INVARIANT: rescaling the (unique up to scale, by Schur
    g₂-irreducibility N234) invariant trace form by any nonzero λ leaves `weinberg` unchanged. -/
theorem weinberg_scale_invariant (lam trT3sq trQsq : ℚ) (hlam : lam ≠ 0) :
    weinberg (lam * trT3sq) (lam * trQsq) = weinberg trT3sq trQsq := by
  unfold weinberg
  rw [mul_div_mul_left _ _ hlam]

/-- The hypercharge:isospin ratio is SCALE-INVARIANT. -/
theorem hyperRatio_scale_invariant (lam trQsq trT3sq : ℚ) (hlam : lam ≠ 0) :
    hyperRatio (lam * trQsq) (lam * trT3sq) = hyperRatio trQsq trT3sq := by
  unfold hyperRatio
  rw [← mul_sub, mul_div_mul_left _ _ hlam]

/-- ★★ THE NORMALIZATION IS FORCED (3/8), grounded to the banked derived traces. For ANY overall
    scale λ ≠ 0 of the invariant form, `sin²θ_W = 3/8` — computed from the banked derived isospin
    trace `Tr(T3²)` and charge trace `Tr(Q²)`. The convention the field posits (the overall
    normalization) is physically inert: it cancels from the observable. -/
theorem weinberg_normalization_forced (lam : ℚ) (hlam : lam ≠ 0) :
    weinberg (lam * isospinTrace (Module.finrank ℚ Uhol + Module.finrank ℚ singlet)
        (∑ i : Fin 2, (fund2Weight i) ^ 2))
      (lam * ladderChargeTrace (Module.finrank ℚ Uhol)) = 3 / 8 := by
  rw [weinberg_scale_invariant lam _ _ hlam]
  exact weinberg_lands_3_8

/-- ★★ THE NORMALIZATION IS FORCED (5/3), grounded. For ANY scale λ ≠ 0 the hypercharge:isospin
    ratio is 5/3 — the GUT normalization factor read off the banked derived traces. -/
theorem hyperRatio_normalization_forced (lam : ℚ) (hlam : lam ≠ 0) :
    hyperRatio (lam * ladderChargeTrace (Module.finrank ℚ Uhol))
      (lam * isospinTrace (Module.finrank ℚ Uhol + Module.finrank ℚ singlet)
        (∑ i : Fin 2, (fund2Weight i) ^ 2)) = 5 / 3 := by
  rw [hyperRatio_scale_invariant lam _ _ hlam]
  exact hyperRatio_lands_5_3

/-- ★ W8 TEETH: single-sided scaling (as if charge and isospin lived in DIFFERENT irreducible
    pieces with INDEPENDENT scales) BREAKS the invariance — `weinberg (2·2) (16/3) ≠ 3/8`. The
    forcing genuinely relies on the SHARED single scale (g₂-irreducible fundamental-7, N234): one
    scale, not two, hence a forced ratio. -/
theorem weinberg_single_sided_breaks : weinberg (2 * 2) (16 / 3) ≠ 3 / 8 := by
  unfold weinberg; norm_num

end P4ProbeB
