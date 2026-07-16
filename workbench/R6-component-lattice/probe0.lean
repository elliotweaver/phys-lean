import Mathlib.Tactic

-- Probe: can KERNEL `decide` count coherent subsets of Fin 5 via Finset powerset?
-- components: fold=0, miss=1, closure=2, gather=3, gluing=4

def coh (S : Finset (Fin 5)) : Prop :=
  ((1:Fin 5) ∈ S → (0:Fin 5) ∈ S) ∧
  ((2:Fin 5) ∈ S → (1:Fin 5) ∈ S) ∧
  ((3:Fin 5) ∈ S → (0:Fin 5) ∈ S) ∧
  ((4:Fin 5) ∈ S → (3:Fin 5) ∈ S)

instance : DecidablePred coh := fun S => by unfold coh; infer_instance

theorem count10 : ((Finset.univ : Finset (Fin 5)).powerset.filter coh).card = 10 := by decide

def cohF (S : Finset (Fin 5)) : Prop := coh S ∧ ((0:Fin 5) ∈ S → (1:Fin 5) ∈ S)
instance : DecidablePred cohF := fun S => by unfold cohF; infer_instance
theorem count7 : ((Finset.univ : Finset (Fin 5)).powerset.filter cohF).card = 7 := by decide

#print axioms count10
#print axioms count7
