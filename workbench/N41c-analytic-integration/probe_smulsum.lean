import Mathlib
open Finset
example {R α β : Type*} [Monoid R] [AddCommMonoid β] [DistribMulAction R β] (s : Finset α) (f : α → β) (r : R) :
    r • ∑ i ∈ s, f i = ∑ i ∈ s, r • f i := by exact?
