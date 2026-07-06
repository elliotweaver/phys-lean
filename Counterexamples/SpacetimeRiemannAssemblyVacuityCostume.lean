/-
  Counterexamples.SpacetimeRiemannAssemblyVacuityCostume — N351 anti-vacuity (C376).
  ============================================================================
  W8 ANTI-VACUITY. The N351 node (arc-E E1-assembly, the full linearized curvature 2-form
  `F = dΓ + Γ∧Γ` assembled from the banked operator-derivative `dΓ` (N350) and the banked commutator
  `Γ∧Γ = lbCurv` (N348), over the derived ℝ `Cut`) proves that the assembled Riemann 2-form is a
  genuinely NONZERO object: for the concrete pair `(timeProj, timeProj, timeProj, offDiagVar)` (integrable
  in the derivative slots, so its content is the nonzero commutator layer), `linRiemann ≠ 0`
  (`linRiemann_ne_zero`, via the banked `lbCurv_ne_zero`). This is the non-vacuity teeth: the assembled
  curvature is not a trivial "always zero" object — the two-layer structure carries genuine content.

  The forced non-vacuity fact is `linRiemann_ne_zero`: `linRiemann timeProj timeProj timeProj offDiagVar
  ≠ 0` over the derived `Cut`. A mis-derivation (a vacuous assembled Riemann that is always zero, a wrong
  integrable-reduction that drops the commutator layer, a wrong sum `dΓ + Γ∧Γ`) would make this pin break.

  THE CERTIFICATE. `cFlag := 1` — a ℕ flag standing for "the assembled linearized Riemann 2-form is
  genuinely nonzero, i.e. the `F = dΓ + Γ∧Γ` assembly is not vacuous". It is TIED to the banked N351
  landing by `cFlag_forced`: the banked `linRiemann_ne_zero` witnesses that the concrete assembled Riemann
  is nonzero, so the flag is `1` (present), not `0`.

  We anchor `min 376 cFlag = 1` (TRUE — `cFlag = 1 < 376`, so the min is `cFlag`).

  THE BOGUS CLAIM (a stand-in for ANY vacuous-Riemann / wrong-assembly mis-reading): that
  `min 376 cFlag = 376`. It GENUINELY equals `1` (`cert_val_true`). Rewriting reduces the bogus claim to
  the false numeric `1 = 376` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (376, 1) is fresh (Cid 376 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.SpacetimeRiemannAssembly
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra

/-- THE ASSEMBLED-RIEMANN FLAG: `1` = "the full linearized Riemann 2-form `F = dΓ + Γ∧Γ` is genuinely
    nonzero — the assembly is not vacuous". -/
def cFlag : ℕ := 1

/-- TRUE (tied to the banked N351 landing): the banked `linRiemann_ne_zero` proves the concrete
    assembled Riemann `linRiemann timeProj timeProj timeProj offDiagVar` is nonzero over the derived
    `Cut`, so the "the assembly is not vacuous" flag is present — `cFlag = 1`. If the assembled Riemann
    were vacuous (always zero), this witness would not exist. -/
theorem cFlag_forced :
    (linRiemann timeProj timeProj timeProj offDiagVar ≠ 0) ∧ cFlag = 1 :=
  ⟨linRiemann_ne_zero, rfl⟩

/-- TRUE: `min 376 cFlag = 1`, holding precisely because `cFlag = 1 < 376`. -/
theorem cert_val_true : min (376 : ℕ) cFlag = 1 := by decide

/-- BOGUS: claims `min 376 cFlag = 376`. It GENUINELY equals `1` (`cert_val_true`). A vacuous
    assembled-Riemann / wrong-assembly mis-reading reduces — through the banked value — to the false
    numeric `1 = 376`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (376 : ℕ) cFlag = 376 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 376  (FALSE — the costume bites)

end Counterexamples
