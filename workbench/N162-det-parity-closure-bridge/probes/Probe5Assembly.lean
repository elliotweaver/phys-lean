import Phys.Algebra.LorentzContinuumOctBlockSO8ClosureWord
import Mathlib.LinearAlgebra.Matrix.SchurComplement
import Mathlib.LinearAlgebra.Determinant
import Mathlib.Algebra.Ring.Parity

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped Matrix

-- stand-ins for the banked Probe1/Probe4 lemmas
axiom det_houseHolder' (a : O Cut) (ha : gFormC a a ≠ 0) :
    LinearMap.det (houseHolder a) = -1
axiom evenReflWord' :
    ∀ (L : List (O Cut)), (∀ a ∈ L, gFormC a a ≠ 0) → Even L.length →
      JoinedIdQvC (octBlockEndC ((L.map houseHolder).prod))

theorem cut_neg_one_ne_one : (-1 : Cut) ≠ 1 := by
  intro h; nlinarith [(one_pos : (0:Cut) < 1)]

/-- A flat list of reflection-set elements re-expresses as an embedded product over a list of
    nonzero-Born-norm AXES (recursion on the element list, each element peeled to its axis). -/
theorem axesWord_of_reflList :
    ∀ (l : List (Module.End Cut (O Cut))), (∀ R ∈ l, R ∈ houseHolderSet) →
      ∃ L : List (O Cut), (∀ a ∈ L, gFormC a a ≠ 0) ∧ (L.map houseHolder).prod = l.prod
  | [], _ => ⟨[], by simp, by simp⟩
  | R :: t, h => by
      obtain ⟨a, ha, hRa⟩ := h R (List.mem_cons_self ..)
      obtain ⟨L, hLmem, hLprod⟩ := axesWord_of_reflList t (fun S hS => h S (List.mem_cons_of_mem R hS))
      refine ⟨a :: L, ?_, ?_⟩
      · intro x hx
        rcases List.mem_cons.mp hx with rfl | hx
        · exact ha
        · exact hLmem x hx
      · simp only [List.map_cons, List.prod_cons, hLprod, hRa]

/-- THE AXES-WORD form of N124's closure exhaustion. -/
theorem isom_eq_axesWord (S : O Cut →ₗ[Cut] O Cut) (hS : IsGFormCIsom S) :
    ∃ L : List (O Cut), (∀ a ∈ L, gFormC a a ≠ 0) ∧ (L.map houseHolder).prod = S := by
  obtain ⟨l, hl_mem, hl_prod⟩ :=
    Submonoid.exists_list_of_mem_closure (gFormC_isom_mem_closure S hS)
  obtain ⟨L, hLmem, hLprod⟩ := axesWord_of_reflList l hl_mem
  exact ⟨L, hLmem, hLprod.trans hl_prod⟩

/-- THE WORD DET — `det ((L.map houseHolder).prod) = (-1)^L.length`. -/
theorem det_axesWord (L : List (O Cut)) (hL : ∀ a ∈ L, gFormC a a ≠ 0) :
    LinearMap.det ((L.map houseHolder).prod) = (-1 : Cut) ^ L.length := by
  rw [MonoidHom.map_list_prod (LinearMap.det : (O Cut →ₗ[Cut] O Cut) →* Cut) (L.map houseHolder)]
  rw [List.map_map]
  have : (L.map ((fun a => LinearMap.det a) ∘ houseHolder)) = L.map (fun _ => (-1 : Cut)) := by
    apply List.map_congr_left
    intro a ha
    exact det_houseHolder' a (hL a ha)
  rw [this]
  rw [List.prod_eq_pow_card _ (-1 : Cut) (by intro x hx; rw [List.mem_map] at hx; obtain ⟨_, _, rfl⟩ := hx; rfl)]
  rw [List.length_map]

/-- ★ THE DET-PARITY CLOSURE BRIDGE — every det +1 (SO(8)) gFormC-isometry S of O Cut lifts to
    the NON-VACUOUS JoinedIdQvC. -/
theorem joinedIdQvC_octBlockEndC_of_det_one (S : O Cut →ₗ[Cut] O Cut)
    (hS : IsGFormCIsom S) (hdet : LinearMap.det S = 1) :
    JoinedIdQvC (octBlockEndC S) := by
  obtain ⟨L, hLmem, hLprod⟩ := isom_eq_axesWord S hS
  have heven : Even L.length := by
    have hd : (-1 : Cut) ^ L.length = 1 := by
      rw [← det_axesWord L hLmem, hLprod, hdet]
    exact (neg_one_pow_eq_one_iff_even cut_neg_one_ne_one).mp hd
  rw [← hLprod]
  exact evenReflWord' L hLmem heven

end
