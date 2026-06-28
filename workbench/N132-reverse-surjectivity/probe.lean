import Phys.Algebra.LorentzContinuumGenerationCompactFactorOrthogonal

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-- The submonoid of ALL linear `BvC`-isometries of `STVC`. -/
def bvIsomLinMonoid : Submonoid (Module.End Cut STVC) where
  carrier := {S | IsBvIsomLin S}
  one_mem' := by
    intro p q
    simp only [Module.End.one_apply]
  mul_mem' := fun hR hT => IsBvIsomLin.comp hR hT

theorem mem_bvIsomLinMonoid {S : Module.End Cut STVC} :
    S ∈ bvIsomLinMonoid ↔ IsBvIsomLin S := Iff.rfl

/-- ★★ THE HEADLINE — every linear `QvC`-isometry is a finite reflection word. -/
theorem linQvIsom_mem_reflection_closure {g : Module.End Cut STVC} (hg : IsQvIsomC g) :
    g ∈ Submonoid.closure houseHolderMSet :=
  lorentz_exhaustion_M g (fun p q => linIsom_BvC_preserved hg p q)

/-- ★★ THE EQUALITY — the generated reflection submonoid IS the full linear isometry group. -/
theorem reflection_closure_eq_bvIsomLinMonoid :
    Submonoid.closure houseHolderMSet = bvIsomLinMonoid := by
  apply le_antisymm
  · apply Submonoid.closure_le.mpr
    rintro R ⟨a, ha, rfl⟩
    show IsBvIsomLin (houseHolderM a)
    exact houseHolderM_isom ha
  · intro S hS
    exact lorentz_exhaustion_M S hS

/-- W8 — the concrete boost `(5/3,4/3)` is a finite reflection word (non-vacuity). -/
theorem boost_mem_reflection_closure :
    boostEndC ((5:Cut)/3) ((4:Cut)/3) ∈ Submonoid.closure houseHolderMSet := by
  have hab : ((5:Cut)/3) ^ 2 - ((4:Cut)/3) ^ 2 = 1 := by ring
  exact lorentz_exhaustion_M _ (boostEndC_isBvIsomLin hab)

/-- W8 TEETH — the boost's moved timelike axis reads Minkowski self-overlap `1`. -/
theorem boost_reflection_word_witness_self_overlap :
    BvC (boostEndC ((5:Cut)/3) ((4:Cut)/3) (mTimeUnit : STVC))
        (boostEndC ((5:Cut)/3) ((4:Cut)/3) (mTimeUnit : STVC)) = 1 := by
  have hab : ((5:Cut)/3) ^ 2 - ((4:Cut)/3) ^ 2 = 1 := by ring
  rw [(boostEndC_isBvIsomLin hab) mTimeUnit mTimeUnit, BvC_mTimeUnit_self]

end

end Phys.Algebra
