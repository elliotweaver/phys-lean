import Phys.Algebra.DerivationSimpleCollapse
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD LieAlgebra
open LinearMap (BilinForm)
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
attribute [local instance] derivationLieQ_semisimple
noncomputable section

-- M1: does prime_split_dichotomy apply at the CONCRETE A_I? (the W9 risk)
set_option synthInstance.maxHeartbeats 400000 in
set_option maxHeartbeats 800000 in
example (I : LieIdeal ℚ derivationLieQ) :
    (∀ a : (Algebra.adjoin ℚ (Set.range (fun x : I => imRep (I.incl x)))),
        ∃ c : ℚ, (a : Module.End ℚ ImO) = c • LinearMap.id)
      ∨ IsSimpleModule (Algebra.adjoin ℚ (Set.range (fun x : I => imRep (I.incl x)))) ImO := by
  apply Phys.Algebra.Collapse.prime_split_dichotomy
    (Algebra.adjoin ℚ (Set.range (fun x : I => imRep (I.incl x)))) 7 (by norm_num)
    finrank_ImO (semisimpleModule_imRep_adjoin I)
  intro N hN
  exact collapse_dich I N hN

-- M2: IsSimpleModule submodule dichotomy
example (A : Type*) [Ring A] (M : Type*) [AddCommGroup M] [Module A M]
    (h : IsSimpleModule A M) (N : Submodule A M) : N = ⊥ ∨ N = ⊤ :=
  h.eq_bot_or_eq_top N

-- M3: det = 0 + injective ⟹ False (finite-dim field endo)
example {K V : Type*} [Field K] [AddCommGroup V] [Module K V] [FiniteDimensional K V]
    (f : Module.End K V) (hdet : LinearMap.det f = 0) (hinj : Function.Injective f) : False := by
  have hker : LinearMap.ker f = ⊥ := LinearMap.ker_eq_bot.mpr hinj
  have hunit : IsUnit f := (LinearMap.isUnit_iff_ker_eq_bot f).mpr hker
  have : IsUnit (LinearMap.det f) := (LinearMap.isUnit_iff_isUnit_det f).mp hunit
  rw [hdet] at this
  exact not_isUnit_zero this

-- M4: nondegeneracy of gBil.restrict ImO on the whole space + odd 7 + 2≠0
example : (2 : ℚ) ≠ 0 := by norm_num
example : Odd (7 : ℕ) := by decide

end
end Phys.Algebra
