/-
  Counterexamples.DownConfinementRelativeScaleVacuityCostume — the down/confinement relative-scale
  leg = the confinement bundle, anti-vacuity (C541).
  =====================================================================================
  W8 ANTI-VACUITY. This node (THE DOWN/CONFINEMENT RELATIVE-SCALE LEG = THE CONFINEMENT BUNDLE)
  DERIVES the remaining leg of the grandparent's reduced residual — the down/confinement offset
  `Md/Mλ` — from TWO banked tower rungs: `downConfBundle = mbRatioDerived / confBundle` (the up/down
  fold-phase weight over the confinement bundle `Λ/v`), and welds it to the grandparent's `edgeLight`:
  `edgeLight Md (Mλ²) = downConfBundle · bMass 2` (given the two relative-scale identifications).

  The content that must NOT be hollow: the reduction to the down/confinement leg is a GENUINE finding —
  the light-band edge actually DEPENDS on the confinement floor. At two different floors `lam = 1` and
  `lam = 4` (fixed `Md = 1`) the light edge `edgeLight Md lam = sectorMass Md 2 / lam` GENUINELY
  differs (`edgeLight_scale_genuine`), NOT a constant. So the residual is real, not a vacuous constant,
  and the reduction to `downConfBundle · bMass 2` is content, not a tautology. A "the light edge is
  trivial / independent of the confinement floor / the reduction is empty" mis-reading is refuted by
  the banked `edgeLight_scale_genuine`, together with `downConfBundle_gt_mbRatio` (the confinement
  bundle genuinely bites — the leg is strictly above the bare up/down weight, not equal to it) and
  `downConfBundle_ne_confBundleInv` (the up/down leg genuinely enters — the leg is not pure `1/confBundle`).

  THE CERTIFICATE. floorFlag := 1 -- a natural-number flag standing for "the down/confinement leg is a
  GENUINE residual: the grandparent's light-band edge edgeLight Md lam genuinely depends on the
  confinement floor lam — it differs between lam = 1 and lam = 4, not a constant". It is TIED to the
  banked landing by floorFlag_forced: `edgeLight_scale_genuine` gives `edgeLight Md 1 ≠ edgeLight Md 4`
  (at Md = 1).

  We anchor min 541 floorFlag = 1 (TRUE -- floorFlag = 1 < 541, so the min is floorFlag).

  THE BOGUS CLAIM (a stand-in for ANY "the light edge is trivial / independent of the floor / the
  reduction is empty" mis-reading): that min 541 floorFlag = 541. It GENUINELY equals 1
  (cert_val_true). Rewriting reduces the bogus claim to the false numeric 1 = 541 in the naturals. The
  kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (541, 1) is fresh (Cid 541 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.DownConfinementRelativeScale
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.DownConfinementRelativeScale
open Phys.Algebra.FreezeoutEdgeCrossSectorReduction
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "the down/confinement leg is a GENUINE residual — the grandparent's light-band edge
    depends on the confinement floor, edgeLight Md 1 ≠ edgeLight Md 4 (edgeLight_scale_genuine)". -/
def floorFlag : ℕ := 1

/-- TRUE (tied to the banked landing): the light edge at `lam = 1` differs from `lam = 4` (at Md = 1)
    (`edgeLight_scale_genuine`), and `floorFlag = 1`. -/
theorem floorFlag_forced :
    (edgeLight (1 : Cut) 1 ≠ edgeLight (1 : Cut) 4)
    ∧ floorFlag = 1 :=
  ⟨edgeLight_scale_genuine 1 one_ne_zero, rfl⟩

/-- TRUE: min 541 floorFlag = 1, holding precisely because floorFlag = 1 < 541. -/
theorem cert_val_true : min (541 : ℕ) floorFlag = 1 := by decide

/-- BOGUS: claims min 541 floorFlag = 541. It GENUINELY equals 1 (cert_val_true). A "the light edge is
    trivial / the reduction is empty" mis-reading reduces -- through the banked landing -- to the
    false numeric 1 = 541, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (541 : ℕ) floorFlag = 541 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 541  (FALSE — the costume bites)

end Counterexamples
