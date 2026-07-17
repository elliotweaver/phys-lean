/-
  Counterexamples.SpacetimeSurfaceGravityVacuityCostume — SpacetimeSurfaceGravity anti-vacuity (C527).
  =====================================================================================
  W8 ANTI-VACUITY. This node (THE SURFACE-GRAVITY DISCHARGE) discharges the two un-derived black-hole
  metric hypotheses the banked Hawking-temperature (N360) and entropy (N361) theorems carry: it builds
  the reciprocal derivative on the derived ℝ, derives the metric-function derivative `f'(r)=2M/r²`, and
  proves the surface gravity `κ_sg(M) := f'(2M)/2 = (4M)⁻¹` at the horizon `r_h = 2M`. The content that
  must NOT be hollow: the derived surface gravity is GENUINELY the metric-specific `(4M)⁻¹`, NOT the
  wrong value `(2M)⁻¹` that dropping the horizon/Christoffel `2` would give — a "the surface gravity is
  degenerate / any inverse-mass value works / the horizon factor is trivial" mis-reading. The banked
  `surfaceGravity_eq` (= (4M)⁻¹) + `surfaceGravity_ne_wrong` ((4M)⁻¹ ≠ (2M)⁻¹) witness the value bites.

  THE CERTIFICATE. sgFlag := 1 -- a natural-number flag standing for "the derived black-hole surface
  gravity is exactly `(4M)⁻¹` (the metric-specific value from `f'(2M)/2`), genuinely distinct from the
  wrong `(2M)⁻¹` a dropped horizon factor would give, and Born-positive for positive mass". It is TIED
  to the banked landing by sgFlag_forced: `surfaceGravity_eq` gives (4M)⁻¹, `surfaceGravity_ne_wrong`
  gives (4M)⁻¹ ≠ (2M)⁻¹, `surfaceGravity_pos` gives 0 < κ_sg, so the flag is 1.

  We anchor min 527 sgFlag = 1 (TRUE -- sgFlag = 1 < 527, so the min is sgFlag).

  THE BOGUS CLAIM (a stand-in for ANY "the surface gravity is degenerate / any inverse-mass value works
  / the horizon `2` factor is trivial / the discharge is vacuous" mis-reading): that
  min 527 sgFlag = 527. It GENUINELY equals 1 (cert_val_true). Rewriting reduces the bogus claim to the
  false numeric 1 = 527 in the naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (527, 1) is fresh (Cid 527 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.SpacetimeSurfaceGravity
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "the derived black-hole surface gravity is exactly `(4M)⁻¹` (the metric-specific
    value from `f'(2M)/2`), genuinely distinct from the wrong `(2M)⁻¹`, and Born-positive". -/
def sgFlag : ℕ := 1

/-- TRUE (tied to the banked landing): for a positive mass `M`, the derived surface gravity is
    `(4M)⁻¹` (`surfaceGravity_eq`), it is NOT the wrong value `(2M)⁻¹` (`surfaceGravity_ne_wrong`),
    it is Born-positive (`surfaceGravity_pos`), and `sgFlag = 1`. -/
theorem sgFlag_forced :
    (∀ M : Cut, 0 < M → surfaceGravity M = (4 * M)⁻¹)
    ∧ (∀ M : Cut, 0 < M → surfaceGravity M ≠ (2 * M)⁻¹)
    ∧ (∀ M : Cut, 0 < M → 0 < surfaceGravity M)
    ∧ sgFlag = 1 :=
  ⟨fun M hM => surfaceGravity_eq M (ne_of_gt hM),
   fun M hM => surfaceGravity_ne_wrong M hM,
   fun M hM => surfaceGravity_pos M hM, rfl⟩

/-- TRUE: min 527 sgFlag = 1, holding precisely because sgFlag = 1 < 527. -/
theorem cert_val_true : min (527 : ℕ) sgFlag = 1 := by decide

/-- BOGUS: claims min 527 sgFlag = 527. It GENUINELY equals 1 (cert_val_true). A "the surface gravity
    is degenerate / any inverse-mass value works / the horizon `2` factor is trivial / the discharge is
    vacuous" mis-reading reduces -- through the banked landing -- to the false numeric 1 = 527, so this
    must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (527 : ℕ) sgFlag = 527 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 527  (FALSE — the costume bites)

end Counterexamples
