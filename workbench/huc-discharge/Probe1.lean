import Phys.Algebra.TopAnchorInsertionPinning

namespace Phys.Algebra.HucDischargeProbe

open Phys.Algebra
open Phys.Algebra.UpDownRelativeScaleFoldPhase
open Phys.Algebra.FreezeoutEdgeCrossSectorReduction
open Phys.Algebra.DownConfinementRelativeScale
open Phys.Algebra.QuarkHadronTower
open Phys.Algebra.EdgeLogArgAudit
open Phys.Algebra.HucBornSquareAnchor
open Phys.Algebra.TopAnchorInsertionPinning
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

-- (A) THE DISCHARGE: light-edge rung with huc SUPPLIED by huc_fully_derived (no longer a free hyp).
theorem light_log_rung_huc_discharged (M Mu Md Mlam : Cut)
    (hM : M ≠ 0) (hu : Mu ≠ 0) (hl : Mlam ≠ 0)
    (hud : (Md / Mu) ^ 2 = mbRatioDerived)
    (hMu : Mu ^ 2 = M * insertionChain [])
    (hMlam : Mlam ^ 2 = M * confinementScaleRatio) :
    cutLog (edgeLight Md (Mlam ^ 2))
      = cutLog mbRatioDerived + 8 * cutPi / 3 + cutLog (bMass 2) :=
  light_log_carries_rung Mu Md Mlam hu hl hud (huc_fully_derived M Mu Mlam hM hMu hMlam)

theorem rung_isolated_huc_discharged (M Mu Md Mlam : Cut)
    (hM : M ≠ 0) (hu : Mu ≠ 0) (hl : Mlam ≠ 0)
    (hud : (Md / Mu) ^ 2 = mbRatioDerived)
    (hMu : Mu ^ 2 = M * insertionChain [])
    (hMlam : Mlam ^ 2 = M * confinementScaleRatio) :
    cutLog (edgeLight Md (Mlam ^ 2)) - (cutLog mbRatioDerived + cutLog (bMass 2))
      = 8 * cutPi / 3 := by
  rw [light_log_rung_huc_discharged M Mu Md Mlam hM hu hl hud hMu hMlam]; ring

-- (B) At the banked witness amplitudes: M=1, Mu=cutExp(-14π/3), Mlam=cutExp(-6π) — NO huc, NO abstract
-- anchor hypotheses. The confinement rung provenance stands on the banked tower half-rungs alone.
theorem light_log_rung_at_witness (Md : Cut)
    (hud : (Md / cutExp (-(14 * cutPi / 3))) ^ 2 = mbRatioDerived) :
    cutLog (edgeLight Md ((cutExp (-(6 * cutPi))) ^ 2))
      = cutLog mbRatioDerived + 8 * cutPi / 3 + cutLog (bMass 2) :=
  light_log_rung_huc_discharged 1 (cutExp (-(14 * cutPi / 3))) Md (cutExp (-(6 * cutPi)))
    one_ne_zero (ne_of_gt (cutExp_pos _)) (ne_of_gt (cutExp_pos _)) hud
    top_pinning_satisfiable born_anchors_satisfiable.2

end

end Phys.Algebra.HucDischargeProbe
