/-
  Counterexamples.ComplexUnitDerivedRealObstructionCostume — N14 costume
  (must be REJECTED).
  ===========================================================================
  THE GARBAGE WITNESS for the WHY-DOUBLE OBSTRUCTION re-derived over the DERIVED ℝ
  `Phys.Foundation.ContinuumQ.Cut` (N14): claiming a LINEAR fold-root EXISTS on the
  derived LINE `Cut` (dimension 1). A fold-root needs `J (J x) = -x`; a linear endo
  of the line `Cut` is `c • (·)`, forcing `c² = -1`, impossible over the ordered
  FIELD `Cut` (`c² ≥ 0`, the trunk's self-overlap positivity, N11–N13).

  `no_foldRoot_dim1` / `no_foldRoot_dim1_of_evenLaw` (Phys/Cascade/ComplexUnit.lean)
  prove NO such map exists OVER THE DERIVED ℝ. This is the obstruction that forces the
  cascade to double 1 → 2 — now living over the fold-derived continuum, NOT imported ℝ.

  This costume asserts the negation — that the IDENTITY (a concrete `Cut`-linear endo)
  is a fold-root on `Cut` — which is FALSE (`id (id x) = x ≠ -x` unless `x = 0`). After
  `simp` collapses `id (id x)` to `x`, the goal is `x = -x` over `Cut`, which does not
  hold for all `x`. The kernel must REJECT it. If it ever COMPILES, the derived-ℝ dim-1
  obstruction was vacuous — exactly the "wrong continuation" the battery exists to catch
  (docs/RUNBOOK.md W8), and the proof that the imported-ℝ → derived-ℝ re-grounding kept
  the obstruction load-bearing.

  The manifest's PASS_SIGNATURE matches the elaboration error below.
-/
import Phys.Cascade.ComplexUnit

namespace Counterexamples

open Phys.Cascade Phys.Foundation

/-- WRONG CONTINUATION: claiming the identity on the DERIVED ℝ `Cut` is a fold-root
    (`id² = -id`). False: `id (id x) = x`, and `x = -x` over the ordered field `Cut`
    forces `x = 0`, not all `x`. Must FAIL to elaborate. -/
theorem foldRoot_dim1_derivedReal_BOGUS :
    ∀ x : ContinuumQ.Cut,
      (fun y : ContinuumQ.Cut => (LinearMap.id : ContinuumQ.Cut →ₗ[ContinuumQ.Cut] ContinuumQ.Cut) y)
        ((fun y : ContinuumQ.Cut => (LinearMap.id : ContinuumQ.Cut →ₗ[ContinuumQ.Cut] ContinuumQ.Cut) y) x)
      = -x := by
  intro x
  simp

end Counterexamples
