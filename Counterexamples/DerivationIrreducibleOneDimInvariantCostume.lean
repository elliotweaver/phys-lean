/-
  Counterexamples.DerivationIrreducibleOneDimInvariantCostume — N27 costume (must be REJECTED).
  ===========================================================================
  THE GARBAGE CLAIM for the N27 complete-reducibility / d=1 exclusion pin. N27 banks that the
  faithful 7-dim action of `derivationLieQ` is COMPLETELY REDUCIBLE — every invariant subspace
  `W` has the Born-orthogonal complement as a genuine invariant complement
  (`isCompl_gBil_orthogonal`, `isCompl_gPerp`) — and has NO 1-dimensional invariant subspace
  (`no_one_dim_invariant_ImO`, `deriv_eigenvalue_zero`: a skew-adjoint operator of the
  anisotropic Born self-overlap has no nonzero real eigenvalue). The teeth: the Born form is
  DEFINITE (anisotropic), so its restriction to every subspace is nondegenerate and the
  orthogonal complement is a true complement — in particular the orthogonal complement of the
  WHOLE space `⊤` is `⊥`, never `⊤`.

  THE GARBAGE CLAIM the kernel MUST reject (anti-vacuity, W8): that the Born-orthogonal
  complement of the FULL space `⊤` is again `⊤` (a DEGENERATE reading, as if the self-overlap
  form vanished). This is genuinely FALSE: `isCompl_gBil_orthogonal ⊤` gives
  `IsCompl ⊤ (gBil.orthogonal ⊤)`, whose `inf_eq_bot` forces `gBil.orthogonal ⊤ = ⊥`; since
  `O ℚ` is nontrivial, `⊥ ≠ ⊤`. So discharging `gBil.orthogonal ⊤ = ⊤` from the banked
  complement fact leaves the kernel with the false `⊥ = ⊤`, which it rejects. A degenerate
  (non-definite) reading would destroy complete reducibility; W8 demands this bite.

  The manifest's PASS_SIGNATURE matches the elaboration error below.
-/
import Phys.Algebra.DerivationIrreducible

namespace Counterexamples

open Phys.Algebra Phys.Cascade Phys.Cascade.CD
open LinearMap (BilinForm)

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- WRONG: claiming the Born-orthogonal complement of the full space `⊤` is `⊤` (a
    degenerate-form reading). The banked complete-reducibility fact `isCompl_gBil_orthogonal`
    forces it to be `⊥` (its `inf_eq_bot`/`codisjoint` give complement of `⊤` is `⊥`). So the
    proof collapses to `⊥ = ⊤`, false in the nontrivial module `O ℚ`. Must FAIL to compile. -/
theorem orthogonal_top_eq_top_BOGUS :
    gBil.orthogonal (⊤ : Submodule ℚ (O ℚ)) = ⊤ := by
  have hcompl := isCompl_gBil_orthogonal (⊤ : Submodule ℚ (O ℚ))
  -- IsCompl ⊤ (gBil.orthogonal ⊤) ⟹ gBil.orthogonal ⊤ = ⊥
  have hbot : gBil.orthogonal (⊤ : Submodule ℚ (O ℚ)) = ⊥ := by
    have := hcompl.inf_eq_bot
    simpa using this
  rw [hbot]

end Counterexamples
