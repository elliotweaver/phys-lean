-- containment probe: build on probe10 structure conceptually.
-- Test the adjoin_le mechanism in isolation with a sorry'd V_mul_mem.
import Phys.Algebra.Alternative
import Phys.Algebra.DerivationFinrank
import Mathlib.Algebra.Algebra.NonUnitalSubalgebra
import Mathlib.Tactic

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable local instance oIsScalarTower : IsScalarTower ℚ (O ℚ) (O ℚ) :=
  ⟨fun c x y => by rw [smul_eq_mul, smul_eq_mul, qsmul_mul_left]⟩
noncomputable local instance oSMulCommClass : SMulCommClass ℚ (O ℚ) (O ℚ) :=
  ⟨fun c x y => by rw [smul_eq_mul, smul_eq_mul, qsmul_mul_right]⟩

set_option maxHeartbeats 4000000

noncomputable def V (a b : O ℚ) : Submodule ℚ (O ℚ) :=
  Submodule.span ℚ ({1, a, b, a * b} : Set (O ℚ))

axiom V_mul_mem (a b : O ℚ) {x y : O ℚ} (hx : x ∈ V a b) (hy : y ∈ V a b) : x * y ∈ V a b

/-- The subalgebra carried by V. -/
noncomputable def Vsub (a b : O ℚ) : NonUnitalSubalgebra ℚ (O ℚ) :=
  (V a b).toNonUnitalSubalgebra (fun _ _ hx hy => V_mul_mem a b hx hy)

/-- ★ THE CONTAINMENT. -/
theorem adjoin_subset_span (a b : O ℚ) :
    (NonUnitalAlgebra.adjoin ℚ ({a, b} : Set (O ℚ)) : Set (O ℚ)) ⊆
      (Submodule.span ℚ ({1, a, b, a * b} : Set (O ℚ)) : Set (O ℚ)) := by
  have hle : NonUnitalAlgebra.adjoin ℚ ({a, b} : Set (O ℚ)) ≤ Vsub a b := by
    apply NonUnitalAlgebra.adjoin_le
    intro x hx
    simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at hx
    show x ∈ V a b
    rcases hx with hx | hx <;> rw [hx] <;> exact Submodule.subset_span (by simp)
  intro x hx
  exact hle hx

#print axioms adjoin_subset_span

end Phys.Algebra
