import Phys.Algebra.LorentzContinuumGenerationWordMembershipObstruction

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ### G1 — the FULL two-sided generator is a QvC-isometry (general u,u'). -/

theorem biMulLin_isQvIsomC (u u' : O Cut) (hu : gFormC u u = 1) (hu' : gFormC u' u' = 1) :
    IsQvIsomC (biMulLin u u') :=
  fun p => biMulFun_isom hu hu' p

/-! ### G2 — the enlarged generating set + the enlarged submonoid. -/

def ninthGenSetLin : Set (Module.End Cut STVC) :=
  {K | ∃ c s : Cut, c ^ 2 + s ^ 2 = 1 ∧ K = planeRotLin c s}

def genIsomMonoidLinPlus : Submonoid (Module.End Cut STVC) :=
  Submonoid.closure (biMulGenSetLin ∪ ninthGenSetLin)

/-! ### G3 — SOUNDNESS: every enlarged word is a QvC-isometry. -/

theorem genIsomMonoidLinPlus_isQvIsomC {K : Module.End Cut STVC}
    (hK : K ∈ genIsomMonoidLinPlus) : IsQvIsomC (K : STVC → STVC) := by
  induction hK using Submonoid.closure_induction with
  | mem K hK =>
      rcases hK with ⟨u, u', hu, hu', rfl⟩ | ⟨c, s, h, rfl⟩
      · exact biMulLin_isQvIsomC u u' hu hu'
      · exact planeRotLin_isQvIsomC c s h
  | one => intro p; rfl
  | mul A B _ _ ihA ihB => intro p; show QvC (A (B p)) = QvC p; rw [ihA (B p), ihB p]

/-! ### G4 — STRICT enlargement. -/

theorem genIsomMonoidLin_le_genIsomMonoidLinPlus :
    genIsomMonoidLin ≤ genIsomMonoidLinPlus :=
  Submonoid.closure_mono (Set.subset_union_left)

theorem planeRotLin_mem_genIsomMonoidLinPlus (c s : Cut) (h : c ^ 2 + s ^ 2 = 1) :
    planeRotLin c s ∈ genIsomMonoidLinPlus :=
  Submonoid.subset_closure (Or.inr ⟨c, s, h, rfl⟩)

theorem three_fifths_sq_add : ((3:Cut)/5) ^ 2 + ((4:Cut)/5) ^ 2 = 1 := by
  norm_num

theorem three_fifths_ne_one : ((3:Cut)/5) ≠ 1 := by
  norm_num

theorem genIsomMonoidLin_lt_genIsomMonoidLinPlus :
    genIsomMonoidLin < genIsomMonoidLinPlus := by
  rw [SetLike.lt_iff_le_and_exists]
  refine ⟨genIsomMonoidLin_le_genIsomMonoidLinPlus, planeRotLin ((3:Cut)/5) ((4:Cut)/5), ?_, ?_⟩
  · exact planeRotLin_mem_genIsomMonoidLinPlus ((3:Cut)/5) ((4:Cut)/5) three_fifths_sq_add
  · exact planeRotLin_not_mem_genIsomMonoidLin ((3:Cut)/5) ((4:Cut)/5) three_fifths_ne_one

/-! ### G5 — the concrete SO(8)·ninth higher-rank compact rotation, an enlarged word
       no biMulLin word realises. -/

def enlargedTwoPlaneNinth (u w : O Cut) (c s : Cut) : Module.End Cut STVC :=
  planeRotLin c s * genTwoPlaneLin u w

theorem enlargedTwoPlaneNinth_mem (u w : O Cut) (c s : Cut)
    (hu : gFormC u u = 1) (hw : gFormC w w = 1) (h : c ^ 2 + s ^ 2 = 1) :
    enlargedTwoPlaneNinth u w c s ∈ genIsomMonoidLinPlus :=
  mul_mem (planeRotLin_mem_genIsomMonoidLinPlus c s h)
    (genIsomMonoidLin_le_genIsomMonoidLinPlus (genTwoPlaneLin_mem_genLin u w hu hw))

theorem enlargedTwoPlaneNinth_isQvIsomC (u w : O Cut) (c s : Cut)
    (hu : gFormC u u = 1) (hw : gFormC w w = 1) (h : c ^ 2 + s ^ 2 = 1) :
    IsQvIsomC (enlargedTwoPlaneNinth u w c s) :=
  genIsomMonoidLinPlus_isQvIsomC (enlargedTwoPlaneNinth_mem u w c s hu hw h)

theorem biMulLin_fixes_zero_v (u u' : O Cut) (t x : Cut) :
    biMulLin u u' (t, x, (0 : O Cut)) = (t, x, (0 : O Cut)) := by
  refine Prod.ext rfl (Prod.ext rfl ?_)
  show u * ((0 : O Cut) * u') = (0 : O Cut)
  rw [zero_mul, mul_zero]

theorem genTwoPlaneLin_fixes_zero_v (u w : O Cut) (t x : Cut) :
    genTwoPlaneLin u w (t, x, (0 : O Cut)) = (t, x, (0 : O Cut)) := by
  show biMulLin w w (biMulLin u u (t, x, (0 : O Cut))) = (t, x, (0 : O Cut))
  rw [biMulLin_fixes_zero_v u u t x, biMulLin_fixes_zero_v w w t x]

theorem enlargedTwoPlaneNinth_moves_x (u w : O Cut) (c s : Cut) :
    (enlargedTwoPlaneNinth u w c s ((0:Cut), (1:Cut), (0:O Cut))).2.1 = c := by
  show (planeRotLin c s (genTwoPlaneLin u w ((0:Cut), (1:Cut), (0:O Cut)))).2.1 = c
  rw [genTwoPlaneLin_fixes_zero_v u w (0:Cut) (1:Cut), planeRotLin_moves_x]

theorem enlargedTwoPlaneNinth_not_mem_genIsomMonoidLin (u w : O Cut) (c s : Cut) (hc : c ≠ 1) :
    enlargedTwoPlaneNinth u w c s ∉ genIsomMonoidLin := by
  intro hmem
  have hfix := genIsomMonoidLin_fixes_snd hmem ((0:Cut), (1:Cut), (0:O Cut))
  rw [enlargedTwoPlaneNinth_moves_x u w c s] at hfix
  exact hc hfix

end

end Phys.Algebra
