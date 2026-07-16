import Mathlib.Tactic

namespace Probe

-- five components as transparent aliases (abbrev = reducible, decide unfolds)
abbrev fold    : Fin 5 := 0
abbrev miss    : Fin 5 := 1
abbrev closure : Fin 5 := 2
abbrev gather  : Fin 5 := 3
abbrev gluing  : Fin 5 := 4

-- base coherence: the four banked-theorem edges
def coh (S : Finset (Fin 5)) : Prop :=
  (miss ∈ S → fold ∈ S) ∧ (closure ∈ S → miss ∈ S) ∧
  (gather ∈ S → fold ∈ S) ∧ (gluing ∈ S → gather ∈ S)

instance : DecidablePred coh := fun S => by unfold coh; infer_instance

-- forced: add the miss-forcing edge (fold HAS a miss)
def cohF (S : Finset (Fin 5)) : Prop := coh S ∧ (fold ∈ S → miss ∈ S)
instance : DecidablePred cohF := fun S => by unfold cohF; infer_instance

theorem count10 : ((Finset.univ : Finset (Fin 5)).powerset.filter coh).card = 10 := by decide
theorem count7  : ((Finset.univ : Finset (Fin 5)).powerset.filter cohF).card = 7 := by decide

-- ★ (c) marquee iff: coherent cell contains {closure,gather,gluing} IFF it is the full engine
theorem triple_iff_full (S : Finset (Fin 5)) (hS : coh S) :
    (closure ∈ S ∧ gather ∈ S ∧ gluing ∈ S) ↔ S = Finset.univ := by
  obtain ⟨e_mf, e_cm, e_gf, e_gg⟩ := hS
  constructor
  · rintro ⟨hc, hg, hgl⟩
    have h1 : miss ∈ S := e_cm hc
    have h0 : fold ∈ S := e_mf h1
    apply Finset.eq_univ_of_forall
    intro x
    fin_cases x <;> simp_all
  · rintro rfl; exact ⟨Finset.mem_univ _, Finset.mem_univ _, Finset.mem_univ _⟩

-- unique maximal: full engine coherent + any maximal coherent cell = it
theorem full_unique_maximal :
    coh (Finset.univ : Finset (Fin 5)) ∧
    (∀ S : Finset (Fin 5), coh S →
      (∀ T : Finset (Fin 5), coh T → S ⊆ T → T ⊆ S) → S = Finset.univ) := by
  refine ⟨⟨?_, ?_, ?_, ?_⟩, ?_⟩
  · intro _; exact Finset.mem_univ _
  · intro _; exact Finset.mem_univ _
  · intro _; exact Finset.mem_univ _
  · intro _; exact Finset.mem_univ _
  · intro S hS hmax
    have hcohU : coh (Finset.univ : Finset (Fin 5)) :=
      ⟨fun _ => Finset.mem_univ _, fun _ => Finset.mem_univ _,
       fun _ => Finset.mem_univ _, fun _ => Finset.mem_univ _⟩
    exact Finset.Subset.antisymm (Finset.subset_univ S)
      (hmax Finset.univ hcohU (Finset.subset_univ S))

#print axioms count10
#print axioms count7
#print axioms triple_iff_full
#print axioms full_unique_maximal

end Probe
