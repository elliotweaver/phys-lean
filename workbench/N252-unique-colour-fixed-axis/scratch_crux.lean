import Phys.Algebra.TowerGatherColourChargeOneCause
import Phys.Algebra.TowerGatherIrreducible27
import Phys.Algebra.OctonionAssociative3Form

/-!
  SCRATCH N252 — the crux.
-/

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Polynomial

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-- The regular colour element: sum of two colour generators. -/
def Dreg : derivationLieQ := DL 0 + DL 13

/-- imRep Dreg = qI (add7 (dm 0) (dm 13)). -/
theorem imRep_Dreg : imRep Dreg = qI (add7 (dm 0) (dm 13)) := by
  rw [Dreg, map_add, imRep_DL_0, imRep_DL_13, ← qI_add]

/-- Dreg annihilates u1 (colour). -/
theorem Dreg_u1 : (Dreg : Module.End ℚ (O ℚ)) u1 = 0 := by
  show ((DL 0 + DL 13 : derivationLieQ) : Module.End ℚ (O ℚ)) u1 = 0
  rw [AddSubmonoid.coe_add, LinearMap.add_apply]
  show D0E u1 + D13E u1 = 0
  ext <;> simp [D0E, D13E, u1, c0, c1, c2, c3, c4, c5, c6, c7]

/-- Dreg ∈ colourCentralizer. -/
theorem Dreg_mem_colour : Dreg ∈ colourCentralizer := by
  rw [colourCentralizer_eq_stab, mem_stabLieQ]
  exact Dreg_u1

/-- ⊇ : sgl ∈ ker (qI MH). -/
theorem sgl_mem_ker_qI_MH : sgl ∈ LinearMap.ker (qI (add7 (dm 0) (dm 13))) := by
  rw [LinearMap.mem_ker]
  apply Subtype.ext
  rw [qI_coe]
  show qZ (add7 (dm 0) (dm 13)) u1 = 0
  ext <;> simp [qZ, add7, dm, d0m, d13m, u1, c0, c1, c2, c3, c4, c5, c6, c7]

/-- ⊆ CRUX : ker (qI MH) ≤ span{sgl}. -/
theorem ker_qI_MH_le_span_sgl :
    LinearMap.ker (qI (add7 (dm 0) (dm 13))) ≤ Submodule.span ℚ {sgl} := by
  intro x hx
  rw [LinearMap.mem_ker] at hx
  have hcoe : qZ (add7 (dm 0) (dm 13)) (x : O ℚ) = 0 := by
    have := congrArg (fun z : ImO => (z : O ℚ)) hx
    simpa [qI_coe] using this
  -- x real part is 0
  have hc0 : c0 (x : O ℚ) = 0 := reQ_ImO_zero x.2
  -- extract coordinate equations from hcoe
  have e2 : c2 (qZ (add7 (dm 0) (dm 13)) (x : O ℚ)) = 0 := by rw [hcoe]; simp [c2]
  have e3 : c3 (qZ (add7 (dm 0) (dm 13)) (x : O ℚ)) = 0 := by rw [hcoe]; simp [c3]
  have e4 : c4 (qZ (add7 (dm 0) (dm 13)) (x : O ℚ)) = 0 := by rw [hcoe]; simp [c4]
  have e5 : c5 (qZ (add7 (dm 0) (dm 13)) (x : O ℚ)) = 0 := by rw [hcoe]; simp [c5]
  have e6 : c6 (qZ (add7 (dm 0) (dm 13)) (x : O ℚ)) = 0 := by rw [hcoe]; simp [c6]
  have e7 : c7 (qZ (add7 (dm 0) (dm 13)) (x : O ℚ)) = 0 := by rw [hcoe]; simp [c7]
  simp only [qZ, add7, dm, d0m, d13m, c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk,
    AddHom.coe_mk, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons] at e2 e3 e4 e5 e6 e7
  -- Now goal
  rw [Submodule.mem_span_singleton]
  refine ⟨c1 (x : O ℚ), ?_⟩
  apply Subtype.ext
  show (c1 (x : O ℚ) • (sgl : O ℚ)) = (x : O ℚ)
  show c1 (x : O ℚ) • u1 = (x : O ℚ)
  ext <;>
    simp only [c0, c1, c2, c3, c4, c5, c6, c7, u1, cd_qsmul_re, cd_qsmul_im, Dbl.smul_re,
      Dbl.smul_im] <;>
    linarith [e2, e3, e4, e5, e6, e7, hc0]

/-- THE HEADLINE (kernel form): ker (imRep Dreg) = span{sgl}. -/
theorem ker_imRep_Dreg : LinearMap.ker (imRep Dreg) = Submodule.span ℚ {sgl} := by
  rw [imRep_Dreg]
  exact le_antisymm ker_qI_MH_le_span_sgl (by
    rw [Submodule.span_le, Set.singleton_subset_iff, SetLike.mem_coe]
    exact sgl_mem_ker_qI_MH)

end

end Phys.Algebra
