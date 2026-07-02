import Phys.Algebra.TowerGatherFaithfulColourRep

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

def colourRepImgP : LieSubalgebra ℚ (Module.End ℚ Vsub) := colourRepV.range

-- OBLIGATION 1: dimension is 8.
example : Module.finrank ℚ colourRepImgP.toSubmodule = 8 := by
  have e := colourRepV.equivRangeOfInjective colourRepV_faithful
  calc Module.finrank ℚ colourRepImgP.toSubmodule
      = Module.finrank ℚ (colourRepV.range) := rfl
    _ = Module.finrank ℚ (colourCentralizer) := e.toLinearEquiv.finrank_eq.symm
    _ = Module.finrank ℚ colourCentralizer.toSubmodule := rfl
    _ = 8 := finrank_colourCentralizer_eq_eight

-- OBLIGATION 2: commutant.
example : ∀ M ∈ colourRepImgP, Commute M chargeOpV := by
  intro M hM
  rw [show colourRepImgP = colourRepV.range from rfl, LieHom.mem_range] at hM
  obtain ⟨D, rfl⟩ := hM
  exact colourRepV_commute D

-- OBLIGATION 3: W8 non-vacuity.
example : colourRepImgP ≠ ⊥ := by
  intro h
  have hmem : colourRepV ⟨DI, DI_mem_colour⟩ ∈ colourRepImgP := by
    rw [show colourRepImgP = colourRepV.range from rfl]
    exact LieHom.mem_range_self _ _
  rw [h, LieSubalgebra.mem_bot] at hmem
  exact colourRepV_ne_zero hmem

-- OBLIGATION 4 (bonus): a concrete nonzero element of the image (for the capstone teeth).
example : colourRepV ⟨DI, DI_mem_colour⟩ ∈ colourRepImgP :=
  LieHom.mem_range_self _ _

end

end Phys.Algebra
