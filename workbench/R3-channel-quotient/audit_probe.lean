import Phys.Algebra.StandpointResidual

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra Phys.Algebra.StandpointResidual

attribute [local instance] CD.narCD CD.srCD

noncomputable section

theorem oCut_one_ne_zero : (1 : O Cut) ≠ 0 := by
  intro h
  have hp := gFormC_one_pos
  rw [h, gFormC_zero_left] at hp
  exact lt_irrefl 0 hp

theorem factors_through_proj_const_on_fibre {β : Type*} (g : O Cut → β)
    (p q : O Cut × O Cut) (hbase : p.1 = q.1) :
    (g ∘ Prod.fst) p = (g ∘ Prod.fst) q := by
  simp only [Function.comp_apply, hbase]

theorem no_section_detector :
    ¬ ∃ d : O Cut → O Cut, ∀ p : O Cut × O Cut, d p.1 = p.2 := by
  rintro ⟨d, hd⟩
  have h0 : d 0 = 0 := hd (0, 0)
  have h1 : d 0 = 1 := hd (0, 1)
  exact oCut_one_ne_zero (h0.symm.trans h1).symm

theorem prod_two_torsion_free : ∀ y : O Cut × O Cut, y + y = 0 → y = 0 := by
  intro y hy
  have h1 : y.1 + y.1 = 0 := by have := congrArg Prod.fst hy; simpa using this
  have h2 : y.2 + y.2 = 0 := by have := congrArg Prod.snd hy; simpa using this
  exact Prod.ext (oCut_two_torsion_free y.1 h1) (oCut_two_torsion_free y.2 h2)

theorem prod_fold_self_blind {look : O Cut × O Cut → O Cut × O Cut} (h : IsFold look)
    (x : O Cut × O Cut) (hx : look x = x) : x = 0 :=
  fold_self_blind h prod_two_torsion_free x hx

theorem watcher_invisible_yet_blind {look : O Cut × O Cut → O Cut × O Cut} (h : IsFold look) :
    ∃ w : O Cut × O Cut, w.1 = (0 : O Cut × O Cut).1 ∧ w ≠ 0 ∧ look w ≠ w := by
  refine ⟨(0, 1), rfl, ?_, ?_⟩
  · intro hc
    have : (1 : O Cut) = 0 := congrArg Prod.snd hc
    exact oCut_one_ne_zero this
  · intro hc
    have hw0 : ((0 : O Cut), (1 : O Cut)) = 0 := prod_fold_self_blind h _ hc
    have : (1 : O Cut) = 0 := congrArg Prod.snd hw0
    exact oCut_one_ne_zero this

theorem prod_neg_isFold : IsFold (fun x : O Cut × O Cut => -x) := neg_isFold

theorem watcher_invisible_yet_blind_bites :
    ∃ w : O Cut × O Cut, w.1 = (0 : O Cut × O Cut).1 ∧ w ≠ 0 ∧ (fun x : O Cut × O Cut => -x) w ≠ w :=
  watcher_invisible_yet_blind prod_neg_isFold

end

#print axioms oCut_one_ne_zero
#print axioms factors_through_proj_const_on_fibre
#print axioms no_section_detector
#print axioms prod_two_torsion_free
#print axioms prod_fold_self_blind
#print axioms watcher_invisible_yet_blind
#print axioms prod_neg_isFold
#print axioms watcher_invisible_yet_blind_bites
