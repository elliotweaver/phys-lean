import Phys.Algebra.TowerGatherForcedChargeEigenspace

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Polynomial

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

-- TARGET 1: colour commutes with the charge operator.
theorem colour_commute_chargeOp (D : derivationLieQ) (hD : D ∈ colourCentralizer) :
    Commute (imRep D) chargeOp := by
  have h : ⁅imRep D, chargeOp⁆ = 0 := (chargeOp_stabilizer_iff D).mpr hD
  have h2 : imRep D * chargeOp - chargeOp * imRep D = 0 := h
  exact sub_eq_zero.mp h2

-- TARGET 2: colour annihilates the neutral singlet.
theorem colour_kills_sgl (D : derivationLieQ) (hD : D ∈ colourCentralizer) :
    imRep D sgl = 0 := by
  apply Subtype.ext
  rw [imRep_coe]
  show (D : Module.End ℚ (O ℚ)) u1 = 0
  exact (commutes_JO_iff (isDerivQ_of_mem D)).mp (mem_colourCentralizer.mp hD)

-- TARGET 3: colour preserves the 0-eigenspace (kernel).
theorem colour_mapsTo_ker_chargeOp (D : derivationLieQ) (hD : D ∈ colourCentralizer) :
    Set.MapsTo (imRep D) ↑(LinearMap.ker chargeOp) ↑(LinearMap.ker chargeOp) := by
  have hc : Commute (imRep D) chargeOp := colour_commute_chargeOp D hD
  intro x hx
  simp only [SetLike.mem_coe, LinearMap.mem_ker] at hx ⊢
  have : chargeOp (imRep D x) = imRep D (chargeOp x) := by
    have := hc.eq
    calc chargeOp (imRep D x) = (chargeOp * imRep D) x := rfl
      _ = (imRep D * chargeOp) x := by rw [this]
      _ = imRep D (chargeOp x) := rfl
  rw [this, hx, map_zero]

-- TARGET 4: colour preserves the charged complement (range).
theorem colour_mapsTo_range_chargeOp (D : derivationLieQ) (hD : D ∈ colourCentralizer) :
    Set.MapsTo (imRep D) ↑(LinearMap.range chargeOp) ↑(LinearMap.range chargeOp) := by
  have hc : Commute (imRep D) chargeOp := colour_commute_chargeOp D hD
  intro x hx
  simp only [SetLike.mem_coe, LinearMap.mem_range] at hx ⊢
  obtain ⟨z, rfl⟩ := hx
  refine ⟨imRep D z, ?_⟩
  have := hc.eq
  calc chargeOp (imRep D z) = (chargeOp * imRep D) z := rfl
    _ = (imRep D * chargeOp) z := by rw [this]
    _ = imRep D (chargeOp z) := rfl

-- TARGET 5: the charged complement is exactly 6-dimensional.
theorem finrank_range_chargeOp : Module.finrank ℚ (LinearMap.range chargeOp) = 6 := by
  have hrn := LinearMap.finrank_range_add_finrank_ker chargeOp
  rw [finrank_ker_chargeOp, finrank_ImO] at hrn
  omega

end

end Phys.Algebra
