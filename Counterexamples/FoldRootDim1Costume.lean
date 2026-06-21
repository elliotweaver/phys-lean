/-
  Counterexamples.FoldRootDim1Costume — N2a costume A (must be REJECTED).
  ===========================================================================
  THE GARBAGE WITNESS: claiming a LINEAR fold-root exists at the base carrier ℝ
  (dimension 1). A fold-root needs `J (J x) = -x`; a linear endo of ℝ is `c • (·)`
  so this forces `c² = -1`, impossible over ℝ (`c² ≥ 0`). This is the OBSTRUCTION
  that forces the cascade to double 1 → 2.

  `no_foldRoot_dim1` (Phys/Cascade/ComplexUnit.lean) proves NO such map exists.
  This costume asserts the negation — that the identity (a concrete linear endo)
  is a fold-root on ℝ — which is FALSE (`id (id x) = x ≠ -x`). The kernel must
  REJECT it. If it ever COMPILES, the dim-1 obstruction was vacuous — exactly the
  "wrong continuation" the costume battery exists to catch.

  The manifest's PASS_SIGNATURE matches the elaboration error below.
-/
import Mathlib.LinearAlgebra.Prod
import Mathlib.Analysis.SpecialFunctions.Pow.Real

/-- WRONG CONTINUATION: claiming the identity on ℝ is a fold-root (`id² = -id`).
    False: `id (id x) = x`, and `x = -x` over ℝ forces `x = 0`, not all `x`.
    Must FAIL to elaborate. -/
theorem foldRoot_dim1_BOGUS :
    ∀ x : ℝ, (fun y : ℝ => (LinearMap.id : ℝ →ₗ[ℝ] ℝ) y)
              ((fun y : ℝ => (LinearMap.id : ℝ →ₗ[ℝ] ℝ) y) x) = -x := by
  intro x
  simp
