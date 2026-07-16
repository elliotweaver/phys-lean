import Phys.Algebra.OctonionJordanGenerationCycleBornSplit
import Phys.Algebra.OctonionJordanThreeMatterSlots

namespace Phys.Algebra.HJ

open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD

abbrev Arena := Matrix (Fin 3) (Fin 3) (O ℚ)

theorem pconj_comp (a b : Equiv.Perm (Fin 3)) (X : Arena) :
    pconj a (pconj b X) = pconj (b * a) X := by
  unfold pconj; rw [Matrix.submatrix_submatrix]; rfl

theorem pconjL_one : (pconjL (1 : Equiv.Perm (Fin 3))) = (1 : Module.End ℚ Arena) := by
  apply LinearMap.ext; intro X
  simp only [pconjL_apply, Module.End.one_apply]
  unfold pconj; rw [Equiv.Perm.coe_one, Matrix.submatrix_id_id]

theorem pconjL_mul (a b : Equiv.Perm (Fin 3)) :
    pconjL a * pconjL b = pconjL (b * a) := by
  apply LinearMap.ext; intro X
  simp only [Module.End.mul_apply, pconjL_apply]; exact pconj_comp a b X

noncomputable def trialityHom : Equiv.Perm (Fin 3) →* Module.End ℚ Arena where
  toFun σ := pconjL σ⁻¹
  map_one' := by rw [inv_one]; exact pconjL_one
  map_mul' σ τ := by
    show pconjL (σ * τ)⁻¹ = pconjL σ⁻¹ * pconjL τ⁻¹
    rw [pconjL_mul, ← _root_.mul_inv_rev]

theorem trialityHom_apply (σ : Equiv.Perm (Fin 3)) : trialityHom σ = pconjL σ⁻¹ := rfl

theorem trialityHom_Eidem (σ : Equiv.Perm (Fin 3)) (i : Fin 3) :
    trialityHom σ (Eidem i) = Eidem (σ i) := by
  rw [trialityHom_apply, pconjL_apply, pconj_Eidem, Equiv.Perm.inv_def, Equiv.symm_symm]

theorem trialityHom_injective : Function.Injective trialityHom := by
  intro σ τ h
  apply Equiv.Perm.ext; intro i
  have hh := congrArg (fun (f : Module.End ℚ Arena) => f (Eidem i)) h
  simp only [trialityHom_Eidem] at hh
  exact Eidem_inj hh

/-- ★ Each triality element is a JORDAN AUTOMORPHISM: it distributes over the Jordan product. -/
theorem trialityHom_jordan (σ : Equiv.Perm (Fin 3)) (C X : Arena) :
    trialityHom σ (jb C X) = jb (trialityHom σ C) (trialityHom σ X) := by
  rw [trialityHom_apply, pconjL_apply, pconjL_apply, pconjL_apply, pconj_jb]

/-- ★ It fixes the unit (identity) of the Jordan algebra. -/
theorem trialityHom_one : trialityHom σ (1 : Arena) = 1 := by
  rw [trialityHom_apply, pconjL_apply]; unfold pconj; rw [Matrix.submatrix_one_equiv]

/-- ★★ THE TRIALITY GROUP IS NONABELIAN (genuine S₃, not just the ℤ₃ cycle): a transposition and
    the 3-cycle do not commute. -/
theorem trialityHom_nonabelian :
    trialityHom (Equiv.swap 0 1) * trialityHom gcyc
      ≠ trialityHom gcyc * trialityHom (Equiv.swap 0 1) := by
  rw [← trialityHom.map_mul, ← trialityHom.map_mul]
  intro h
  have := trialityHom_injective h
  revert this; decide

/-- ★★ THE C6-FORCED GENERATION CYCLE IS THE ℤ₃ SUBGROUP of the triality group: `trialityHom gcyc`
    has order 3 and is nontrivial. -/
theorem trialityHom_gcyc_order3 : trialityHom gcyc ^ 3 = 1 := by
  rw [← trialityHom.map_pow]
  have : gcyc ^ 3 = 1 := by decide
  rw [this, trialityHom.map_one]

theorem trialityHom_gcyc_ne_one : trialityHom gcyc ≠ 1 := by
  rw [← trialityHom.map_one]
  intro h
  exact gcyc_ne_one (trialityHom_injective h)

end Phys.Algebra.HJ
