import Phys.Algebra.OctonionJordanHermTraceCommutator
import Mathlib.Tactic

namespace Counterexamples
open Phys.Algebra Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Matrix
attribute [local instance] CD.narCD CD.srCD

-- certificate: the dilation coefficient. (Lmul 1).restrict ⟨1,_⟩ = 2•⟨1,_⟩, so its (0,0) real
-- coordinate is 2 (since 1 has (0,0)=1, and 2•1 has (0,0)=2).
-- read the arena-level value at member 1.
noncomputable def dilApplied : Matrix (Fin 3) (Fin 3) (O ℚ) :=
  ((Lmul (1 : Matrix (Fin 3) (Fin 3) (O ℚ))).restrict
    (lmul_mapsTo (by simp : (1 : Matrix (Fin 3) (Fin 3) (O ℚ))ᴴ = 1))
    ⟨1, one_mem_hermSub⟩ : hermSub)

-- via dilation_restrict = 2•id, dilApplied = 2•1
theorem dilApplied_eq : dilApplied = (2:ℚ) • (1 : Matrix (Fin 3) (Fin 3) (O ℚ)) := by
  unfold dilApplied
  rw [dilation_restrict]
  simp only [LinearMap.smul_apply, LinearMap.id_coe, id_eq, SetLike.val_smul]

-- the (0,0) real coordinate is 2
noncomputable def certVal : ℚ := (dilApplied 0 0).re.re.re

theorem certVal_eq : certVal = 2 := by
  unfold certVal
  rw [dilApplied_eq]
  simp [Matrix.smul_apply, Matrix.one_apply]
  sorry

#check certVal_eq

end Counterexamples
