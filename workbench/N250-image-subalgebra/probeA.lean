import Phys.Algebra.TowerGatherFaithfulColourRep

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

-- The image as a Lie subalgebra.
def colourRepImgP : LieSubalgebra ℚ (Module.End ℚ Vsub) := colourRepV.range

-- OBLIGATION 1: dimension is 8 (the first downstream use of injectivity).
example : Module.finrank ℚ colourRepImgP.toSubmodule = 8 := by
  have e := colourRepV.equivRangeOfInjective colourRepV_faithful
  have hfr : Module.finrank ℚ (colourCentralizer) = Module.finrank ℚ (colourRepV.range) :=
    e.toLinearEquiv.finrank_eq
  -- reconcile ↥colourCentralizer with colourCentralizer.toSubmodule, and ↥range with range.toSubmodule
  have h8 : Module.finrank ℚ (colourCentralizer) = 8 := finrank_colourCentralizer_eq_eight
  show Module.finrank ℚ (colourRepV.range).toSubmodule = 8
  rw [← hfr] at *
  exact h8

-- OBLIGATION 2: commutant — every image element commutes with chargeOpV.
example : ∀ M ∈ colourRepImgP, Commute M chargeOpV := by
  intro M hM
  rw [show colourRepImgP = colourRepV.range from rfl, LieHom.mem_range] at hM
  obtain ⟨D, rfl⟩ := hM
  exact colourRepV_commute D

-- OBLIGATION 3: W8 non-vacuity — image nonzero (contains a nonzero element).
example : colourRepImgP ≠ ⊥ := by
  intro h
  have hmem : colourRepV ⟨DI, DI_mem_colour⟩ ∈ colourRepImgP := by
    rw [show colourRepImgP = colourRepV.range from rfl]
    exact LieHom.mem_range_self _ _
  rw [h, LieSubalgebra.mem_bot] at hmem
  exact colourRepV_ne_zero hmem

end

end Phys.Algebra
