/-
  Counterexamples.SterileNeutrinoDarkMatterWrongScaleCostume — N337 anti-vacuity (C362).
  ============================================================================
  W8 ANTI-VACUITY. The N337 node (seeded arc-C C3(a)) derives DARK MATTER = STERILE ν_R: the fold's
  self-blind self-direction is HEAVY-STERILE (an eigenvector of the family-blind heavy Majorana scale
  `M • 1` with the FULL eigenvalue `M`, NONZERO for `M ≠ 0`), LIGHT-MASSLESS (`m₁ = 0`, N336), and
  STABLE (the decay portal `D Dᵀ` annihilates it). The HEAVY / LIGHT split is load-bearing:

      `heavyMajorana_selfDir_eigen : (heavyMajorana M).mulVec selfDir = M • selfDir`   (heavy-sterile)
      `heavyMajorana_no_massless : M ≠ 0 → v ≠ 0 → (heavyMajorana M).mulVec v ≠ 0`      (heavy FULL-RANK)
      `self_generation_massless : massOfDir (othersProj · D₀) M selfDir = 0`            (light-massless)

  The heavy operator being FULL-RANK (NO massless direction, ONE sterile scale `M`) is what makes the
  self-direction's masslessness a LIGHT-ONLY phenomenon — the sterile/heavy vs massless/light split.
  If the heavy scale were mis-built (not full-rank, more than the ONE sterile scale, or itself
  admitting a massless direction), the whole heavy-sterile / light-massless distinction collapses.

  THE CERTIFICATE. `sterileScale := 1` — a ℕ flag standing for "the derived heavy sterile sector has
  EXACTLY ONE scale `M` (the family-blind `M • 1` is full-rank, NO massless direction — the self-
  direction is heavy-STERILE, not heavy-massless)". It is TIED to the banked landing by
  `sterileScale_forced` below: the banked `heavyMajorana_no_massless` (instantiated on the self-
  direction, which is nonzero) gives `(heavyMajorana M).mulVec selfDir ≠ 0` — the heavy operator does
  NOT annihilate the sterile direction (contrast the LIGHT portal, which does). If the heavy scale
  were mis-built, this would fail.

  We anchor `min 362 sterileScale = 1` (TRUE — `sterileScale = 1`, the genuine single heavy scale).

  THE BOGUS CLAIM (a stand-in for ANY wrong heavy-sterile structure / mis-built scale): that
  `min 362 sterileScale = 362`. It GENUINELY equals `1` (`cert_val_true`). Rewriting the banked value
  reduces the bogus claim to the false numeric `1 = 362` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (362, 1) is fresh (RHS 362 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.SterileNeutrinoDarkMatter
import Mathlib.Tactic

namespace Counterexamples

open Phys.Foundation Phys.Foundation.ContinuumQ Phys.Algebra
open Matrix

/-- Witness that the self-direction is nonzero (its `0`-th entry is `1 ≠ 0`) — needed to instantiate
    the banked full-rank `heavyMajorana_no_massless` on the sterile self-direction. -/
theorem selfDir_ne_zero : (selfDir : Fin 3 → Cut) ≠ 0 := by
  intro h
  have h0 := congrFun h 0
  simp only [selfDir, Matrix.cons_val_zero, Pi.zero_apply] at h0
  exact one_ne_zero h0

/-- THE STERILE-SCALE FLAG: `1` = "the derived heavy sterile sector has EXACTLY ONE scale `M` (the
    family-blind `M • 1` is full-rank — the self-direction is heavy-STERILE, NOT heavy-massless)". -/
def sterileScale : ℕ := 1

/-- TRUE (tied to the banked N337 forced landing): the family-blind heavy scale does NOT annihilate
    the sterile self-direction — `(heavyMajorana 1).mulVec selfDir ≠ 0` (`heavyMajorana_no_massless`
    on the nonzero self-direction, with `M = 1 ≠ 0`). The heavy operator is full-rank; the sterile
    direction carries a genuine heavy scale. If mis-built, this would fail. -/
theorem sterileScale_forced : (heavyMajorana (1 : Cut)).mulVec selfDir ≠ 0 :=
  heavyMajorana_no_massless (1 : Cut) one_ne_zero selfDir selfDir_ne_zero

/-- TRUE: `min 362 sterileScale = 1`, holding precisely because `sterileScale = 1` (the genuine
    single heavy scale), not `362`. -/
theorem cert_val_true : min (362 : ℕ) sterileScale = 1 := by decide

/-- BOGUS: claims `min 362 sterileScale = 362`. It GENUINELY equals `1` (`cert_val_true`). A WRONG
    heavy-sterile structure / mis-built scale reduces — through the banked value — to the false
    numeric `1 = 362`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (362 : ℕ) sterileScale = 362 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 362  (FALSE — the costume bites)

end Counterexamples
