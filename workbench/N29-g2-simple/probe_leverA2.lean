import Phys.Algebra.DerivationIrreducibleFull

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD LieAlgebra
open LinearMap (BilinForm)
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section

-- LEVER A: K ≠ ⊥ → ⁅K, ImLie⁆ = ⊤  (every nonzero ideal acts as the whole on the
-- irreducible faithful 7-rep). Reduction: irreducibility of ImLie + faithfulness.

-- ⁅K, ImLie⁆ is a LieSubmodule of (O ℚ), ≤ ImLie.
example (K : LieIdeal ℚ derivationLieQ) :
    (⁅K, ImLie⁆ : LieSubmodule ℚ derivationLieQ (O ℚ)) ≤ ImLie :=
  LieSubmodule.lie_le_right ImLie K

-- the comap into ↥ImLie via the inclusion, to use ImLie_isIrreducible.
-- Try: comap ImLie.incl ⁅K, ImLie⁆ : LieSubmodule ℚ derivationLieQ ↥ImLie
example (K : LieIdeal ℚ derivationLieQ) :
    LieSubmodule ℚ derivationLieQ ↥ImLie :=
  (⁅K, ImLie⁆ : LieSubmodule ℚ derivationLieQ (O ℚ)).comap ImLie.incl

-- Probe: if ⁅K, ImLie⁆ = ⊥ then K acts as 0 on ImO, then K = ⊥ (faithfulness).
example (K : LieIdeal ℚ derivationLieQ) (h : (⁅K, ImLie⁆ : LieSubmodule ℚ derivationLieQ (O ℚ)) = ⊥) :
    K = ⊥ := by
  rw [eq_bot_iff]
  intro x hx
  rw [LieSubmodule.mem_bot]
  -- x acts as 0 on ImO: for m ∈ ImO, ⁅x, m⁆ ∈ ⁅K, ImLie⁆ = ⊥
  have hact : ∀ m : O ℚ, m ∈ ImO → (x : Module.End ℚ (O ℚ)) m = 0 := by
    intro m hm
    have hmem : ⁅(x : derivationLieQ), m⁆ ∈ (⁅K, ImLie⁆ : LieSubmodule ℚ derivationLieQ (O ℚ)) :=
      LieSubmodule.lie_mem_lie hx hm
    rw [h, LieSubmodule.mem_bot] at hmem
    rw [← hmem]; rfl
  -- so imRep x = 0
  have hzero : imRep x = 0 := by
    apply LinearMap.ext; intro y; apply Subtype.ext
    rw [imRep_coe]; exact hact y.1 y.2
  exact (injective_iff_map_eq_zero imRep).mp imRep_injective x hzero

end
end Phys.Algebra
