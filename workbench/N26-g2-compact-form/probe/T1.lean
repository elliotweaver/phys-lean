import Phys.Algebra.DerivationCompact
import Phys.Algebra.DerivationRep7
import Mathlib.Algebra.Lie.Semisimple.Basic
import Mathlib.Algebra.Lie.Semisimple.Lemmas

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD LieAlgebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

-- T1a: the invariant Lie submodule
def ImLie : LieSubmodule ℚ derivationLieQ (O ℚ) where
  toSubmodule := ImO
  lie_mem := by
    intro D x hx
    show (D : Module.End ℚ (O ℚ)) x ∈ ImO
    exact derivLieQ_mapsTo D x hx

@[simp] theorem ImLie_toSubmodule : ImLie.toSubmodule = ImO := rfl

theorem mem_ImLie {x : O ℚ} : x ∈ ImLie ↔ x ∈ ImO := Iff.rfl

-- T1b: nontrivial (u1 ≠ 0 and u1 ∈ ImO)
theorem u1_ne_zero : (u1 : O ℚ) ≠ 0 := by
  intro h
  have : c1 (u1) = c1 (0 : O ℚ) := by rw [h]
  simp [c1, u1] at this

instance : Nontrivial ImLie := by
  rw [nontrivial_iff]
  refine ⟨⟨u1, u1_mem_ImO⟩, 0, ?_⟩
  intro h
  exact u1_ne_zero (congrArg Subtype.val h)

-- T1c: finrank ImLie = 7 (transport banked finrank_ImO)
theorem finrank_ImLie : Module.finrank ℚ ImLie = 7 := finrank_ImO

-- T1d: simplicity skeleton
theorem isSimple_of_isSimpleOrder (h : IsSimpleOrder (LieIdeal ℚ derivationLieQ)) :
    LieAlgebra.IsSimple ℚ derivationLieQ :=
  (isSimple_iff_of_not_isLieAbelian ℚ derivationLieQ derivationLieQ_not_lieAbelian).mp h

end

end Phys.Algebra
