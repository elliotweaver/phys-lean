import Phys.Algebra.OctonionJordanHermTraceCommutator
import Mathlib.Tactic

/-! N300 PROBE L — the ENDGAME evaluation pieces (slot-vanishing + diagonal reduction). -/

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD

-- csign machinery (proven in ProbeN300g)
noncomputable def csign (s : Fin 3 → ℚ) (X : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    Matrix (Fin 3) (Fin 3) (O ℚ) := Matrix.of (fun i j => (s i * s j) • X i j)

-- for a matrix supported OFF a single pair, csign with a single sign-flip negates it.
-- Test: pairPart i0 j0 C with i0≠j0; s := fun i => if i = i0 then -1 else 1 gives csign s (pair) = -pair.
noncomputable def pairPart (i0 j0 : Fin 3) (C : Matrix (Fin 3) (Fin 3) (O ℚ)) : Matrix (Fin 3) (Fin 3) (O ℚ) :=
  Matrix.of (fun i j => if (i = i0 ∧ j = j0) ∨ (i = j0 ∧ j = i0) then C i j else 0)

noncomputable def flip (i0 : Fin 3) : Fin 3 → ℚ := fun i => if i = i0 then -1 else 1
theorem flip_sq (i0 : Fin 3) : ∀ i, flip i0 i * flip i0 i = 1 := by
  intro i; unfold flip; by_cases h : i = i0 <;> simp [h]

-- csign (flip i0) (pairPart i0 j0 C) = - pairPart i0 j0 C   (when i0 ≠ j0)
theorem csign_flip_pair (i0 j0 : Fin 3) (hij : i0 ≠ j0) (C : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    csign (flip i0) (pairPart i0 j0 C) = - pairPart i0 j0 C := by
  unfold csign pairPart flip
  apply Matrix.ext; intro i j
  simp only [Matrix.of_apply, Matrix.neg_apply]
  by_cases h : (i = i0 ∧ j = j0) ∨ (i = j0 ∧ j = i0)
  · rcases h with ⟨hi,hj⟩ | ⟨hi,hj⟩
    · subst hi; subst hj; simp only [if_pos rfl, if_neg hij, if_pos (Or.inl ⟨rfl,rfl⟩)]
      rw [show ((-1:ℚ) * 1) = -1 by ring, neg_one_smul]
    · subst hi; subst hj
      simp only [if_neg (Ne.symm hij), if_pos rfl, if_pos (Or.inr ⟨rfl,rfl⟩)]
      rw [show ((1:ℚ) * -1) = -1 by ring, neg_one_smul]
  · simp only [if_neg h, smul_zero, neg_zero]

end Phys.Algebra.HJ
