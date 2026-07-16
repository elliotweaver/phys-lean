import Phys.Algebra.OctonionJordanGenerationCycleBornSplit

namespace Phys.Algebra.HJ

open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD

abbrev Arena := Matrix (Fin 3) (Fin 3) (O ℚ)

-- anti-hom composition
theorem pconj_comp (a b : Equiv.Perm (Fin 3)) (X : Arena) :
    pconj a (pconj b X) = pconj (b * a) X := by
  unfold pconj
  rw [Matrix.submatrix_submatrix]
  rfl

theorem pconjL_one : (pconjL (1 : Equiv.Perm (Fin 3))) = (1 : Module.End ℚ Arena) := by
  apply LinearMap.ext; intro X
  simp only [pconjL_apply, Module.End.one_apply]
  unfold pconj
  rw [Equiv.Perm.coe_one, Matrix.submatrix_id_id]

theorem pconjL_mul (a b : Equiv.Perm (Fin 3)) :
    pconjL a * pconjL b = pconjL (b * a) := by
  apply LinearMap.ext; intro X
  simp only [Module.End.mul_apply, pconjL_apply]
  exact pconj_comp a b X

-- the triality group homomorphism
noncomputable def trialityHom : Equiv.Perm (Fin 3) →* Module.End ℚ Arena where
  toFun σ := pconjL σ⁻¹
  map_one' := by rw [inv_one]; exact pconjL_one
  map_mul' σ τ := by
    show pconjL (σ * τ)⁻¹ = pconjL σ⁻¹ * pconjL τ⁻¹
    rw [pconjL_mul, ← _root_.mul_inv_rev]

theorem trialityHom_apply (σ : Equiv.Perm (Fin 3)) : trialityHom σ = pconjL σ⁻¹ := rfl

-- action on idempotents: clean left action
theorem trialityHom_Eidem (σ : Equiv.Perm (Fin 3)) (i : Fin 3) :
    trialityHom σ (Eidem i) = Eidem (σ i) := by
  rw [trialityHom_apply, pconjL_apply, pconj_Eidem, Equiv.Perm.inv_def, Equiv.symm_symm]

-- faithfulness
theorem trialityHom_injective : Function.Injective trialityHom := by
  intro σ τ h
  apply Equiv.Perm.ext
  intro i
  have hh := congrArg (fun (f : Module.End ℚ Arena) => f (Eidem i)) h
  simp only [trialityHom_Eidem] at hh
  exact Eidem_inj hh

end Phys.Algebra.HJ
