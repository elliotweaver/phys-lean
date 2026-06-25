import Phys.Algebra.DerivationSimpleStructure
import Phys.Algebra.DerivationCompact
import Mathlib.Tactic

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD LieAlgebra
open LinearMap (BilinForm)
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
attribute [local instance] derivationLieQ_semisimple
noncomputable section

-- LEVER: a simple Lie algebra is perfect (⁅⊤,⊤⁆ = ⊤). For atom I: I is simple.
-- Try generic: IsSimple L' ⟹ ⁅⊤,⊤⁆ = ⊤.
example (L' : Type*) [LieRing L'] [LieAlgebra ℚ L'] [hs : LieAlgebra.IsSimple ℚ L'] :
    (⁅(⊤ : LieIdeal ℚ L'), (⊤ : LieIdeal ℚ L')⁆ : LieIdeal ℚ L') = ⊤ := by
  rcases hs.eq_bot_or_eq_top ⁅(⊤ : LieIdeal ℚ L'), ⊤⁆ with h | h
  · exfalso
    -- ⁅⊤,⊤⁆ = ⊥ means L' is abelian, contradicting non_abelian
    have habel : IsLieAbelian L' := by
      constructor; intro x y
      have : (⁅x, y⁆ : L') ∈ (⁅(⊤ : LieIdeal ℚ L'), (⊤ : LieIdeal ℚ L')⁆ : LieIdeal ℚ L') :=
        LieSubmodule.lie_mem_lie (LieSubmodule.mem_top x) (LieSubmodule.mem_top y)
      rw [h, LieSubmodule.mem_bot] at this; exact this
    exact hs.non_abelian habel
  · exact h

-- LEVER: atom center = ⊥. IsSimple I ⟹ HasTrivialRadical ⟹ center = ⊥.
example (L' : Type*) [LieRing L'] [LieAlgebra ℚ L'] [LieAlgebra.IsSimple ℚ L'] :
    LieAlgebra.center ℚ L' = ⊥ := by exact?

end
end Phys.Algebra
