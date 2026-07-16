import Phys.Algebra.Alternative
import Phys.Algebra.ConfinementColourSinglet
import Phys.Algebra.TowerGatherObstructionRep7
import Phys.Algebra.DerivationFinrank
import Phys.Algebra.HermitianJordan.PieceBfinal
import Mathlib.Algebra.Algebra.NonUnitalSubalgebra
import Mathlib.Tactic

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

set_option maxHeartbeats 4000000

-- CHECK: does adjoin typecheck with banked IsScalarTower/SMulCommClass?
noncomputable def twoGen (a b : O ℚ) : NonUnitalSubalgebra ℚ (O ℚ) :=
  NonUnitalAlgebra.adjoin ℚ {a, b}

-- Key question: is adjoin ℚ {a,b}  ⊆  span ℚ {1,a,b,ab} ?
-- That would need: a*a ∈ span (quadratic), a*b ∈ span (obvious), b*a ∈ span, b*b ∈ span,
-- and closure under further products. This is the quadratic-closure machinery.
-- We want to AVOID it. Instead, prove Artin directly by adjoin_induction, but the mul-case
-- needs alternativity of PRODUCTS.

-- Probe the mul-closure obligation directly:
-- If [p,q,r]=0 for r a generator, is [p,q,(r*s)]=0 given [p,q,s]=0? NO in general.
-- So adjoin_induction on slot 3 alone fails. Need the containment route.

-- Let me test containment: adjoin ⊆ span{1,a,b,ab} — check whether adjoin_induction closes it
example (a b : O ℚ) :
    (twoGen a b : Set (O ℚ)) ⊆ (Submodule.span ℚ ({1, a, b, a*b} : Set (O ℚ)) : Set (O ℚ)) := by
  intro x hx
  induction hx using NonUnitalAlgebra.adjoin_induction with
  | mem g hg =>
      simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at hg
      rcases hg with rfl|rfl <;> apply Submodule.subset_span <;>
        simp [Set.mem_insert_iff]
  | add p q _ _ hp hq => exact Submodule.add_mem _ hp hq
  | zero => exact Submodule.zero_mem _
  | mul p q _ _ hp hq => sorry  -- THE HARD CASE: product closes in span{1,a,b,ab}
  | smul c p _ hp => exact Submodule.smul_mem _ c hp

end Phys.Algebra
