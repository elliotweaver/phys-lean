/-
  Counterexamples.FoldRootSwapCostume — N2a costume B (must be REJECTED).
  ===========================================================================
  THE GARBAGE WITNESS: claiming the SWAP map on the doubled carrier is the complex
  unit. The complex unit must satisfy `J² = -id`; the swap `Jswap(a,b) = (b,a)`
  has `Jswap² = +id`, NOT `-id`. The sign is everything: `+id` is a (non-self-blind)
  reflection, not the fold's square root.

  `J₂_isFoldRoot` (Phys/Cascade/ComplexUnit.lean) proves the CORRECT operator
  `J₂(a,b) = (-b,a)` is the fold-root. This costume asserts the swap is a
  fold-root — `Jswap (Jswap p) = -p` — which is FALSE (`Jswap (Jswap p) = p`, and
  `p = -p` forces `p = 0`, not all `p`). The kernel must REJECT it. If it ever
  COMPILES, the sign of the complex unit was doing no work — exactly the "wrong
  stop" the costume battery exists to catch.

  The manifest's PASS_SIGNATURE matches the elaboration error below.
-/
import Mathlib.Analysis.SpecialFunctions.Pow.Real

/-- WRONG STOP: claiming the swap map `(a,b) ↦ (b,a)` is a fold-root (`J² = -id`).
    False: the swap squares to `+id`, so `Jswap (Jswap p) = p ≠ -p` in general.
    Must FAIL to elaborate. -/
theorem foldRoot_swap_BOGUS :
    ∀ p : ℝ × ℝ, (fun q : ℝ × ℝ => (q.2, q.1)) ((fun q : ℝ × ℝ => (q.2, q.1)) p) = -p := by
  intro p
  simp [Prod.ext_iff]
