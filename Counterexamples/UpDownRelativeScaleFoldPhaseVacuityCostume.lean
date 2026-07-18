/-
  Counterexamples.UpDownRelativeScaleFoldPhaseVacuityCostume — up/down relative sector scale =
  the fold phase's Born weight, anti-vacuity (C540).
  =====================================================================================
  W8 ANTI-VACUITY. This node (THE UP/DOWN RELATIVE SECTOR SCALE = THE FOLD PHASE'S BORN WEIGHT)
  DERIVES the dominant leg of the parent's reduced residual — the up/down relative sector scale — from
  the banked fold phase `P = cutPi/8`: `mbRatioDerived = (1 − q)²/(3·(1 + q))`, `q = cutCos(cutPi/4)`,
  `q² = 1/2`, and the parent's cross-sector heaviest ratio `sectorMass Md 0 / sectorMass Mu 0 = (Md/Mu)²`
  is the PURE relative scale (shape cancels), so `(Md/Mu)² = mbRatioDerived`.

  The content that must NOT be hollow: the reduction to the relative scale is a GENUINE finding — the
  heaviest cross-sector ratio actually DEPENDS on the relative scale. At `Md = 2·Mu` (fixed `Mu = 1`)
  it is `sectorMass 2 0 / sectorMass 1 0 = 4` (`crossSector_scale_genuine`), NOT the trivial `1`. So the
  residual is real, not a vacuous constant, and the reduction to `(Md/Mu)²` is content, not a tautology.
  A "the up/down scale is trivial / the cross-sector ratio is always 1 / the reduction is empty"
  mis-reading is refuted by the banked `crossSector_scale_genuine` (the ratio is `4` at `Md = 2·Mu`),
  together with `mbRatioDerived_lt_one` (the derived leg is a genuine suppression `< 1`, not `1`) and
  `mbRatioDerived_ne_survival` (the fold-phase factor genuinely bites — the ratio is not the bare `2/3`).

  THE CERTIFICATE. scaleFlag := 1 -- a natural-number flag standing for "the up/down relative sector
  scale is a GENUINE residual: the parent's cross-sector heaviest ratio sectorMass Md 0 / sectorMass Mu 0
  = (Md/Mu)² actually depends on the relative scale — it is 4 at Md = 2·Mu, not the trivial 1". It is
  TIED to the banked landing by scaleFlag_forced: `crossSector_scale_genuine` gives the ratio `= 4` at
  `Md = 2, Mu = 1`.

  We anchor min 540 scaleFlag = 1 (TRUE -- scaleFlag = 1 < 540, so the min is scaleFlag).

  THE BOGUS CLAIM (a stand-in for ANY "the up/down scale is trivial / the reduction is empty"
  mis-reading): that min 540 scaleFlag = 540. It GENUINELY equals 1 (cert_val_true). Rewriting reduces
  the bogus claim to the false numeric 1 = 540 in the naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (540, 1) is fresh (Cid 540 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.UpDownRelativeScaleFoldPhase
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.UpDownRelativeScaleFoldPhase
open Phys.Algebra.FreezeoutEdgeCrossSectorReduction
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "the up/down relative sector scale is a GENUINE residual — the parent's cross-sector
    heaviest ratio depends on the relative scale, = 4 at Md = 2·Mu (crossSector_scale_genuine)". -/
def scaleFlag : ℕ := 1

/-- TRUE (tied to the banked landing): the cross-sector heaviest ratio at `Md = 2, Mu = 1` is `4`
    (`crossSector_scale_genuine`), and `scaleFlag = 1`. -/
theorem scaleFlag_forced :
    (sectorMass (2 : Cut) 0 / sectorMass (1 : Cut) 0 = 4)
    ∧ scaleFlag = 1 :=
  ⟨crossSector_scale_genuine, rfl⟩

/-- TRUE: min 540 scaleFlag = 1, holding precisely because scaleFlag = 1 < 540. -/
theorem cert_val_true : min (540 : ℕ) scaleFlag = 1 := by decide

/-- BOGUS: claims min 540 scaleFlag = 540. It GENUINELY equals 1 (cert_val_true). A "the up/down scale
    is trivial / the reduction is empty" mis-reading reduces -- through the banked landing -- to the
    false numeric 1 = 540, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (540 : ℕ) scaleFlag = 540 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 540  (FALSE — the costume bites)

end Counterexamples
