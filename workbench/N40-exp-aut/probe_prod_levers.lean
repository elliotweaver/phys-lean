import Phys.Foundation.ContinuumSummable
open Phys.Foundation Phys.Foundation.ContinuumQ
open scoped Topology BigOperators
noncomputable section

axiom cut_summable_prod_of_nonneg {ι κ : Type*} {f : ι → Cut} {g : κ → Cut}
    (hf0 : ∀ i, 0 ≤ f i) (hg0 : ∀ j, 0 ≤ g j) (hf : Summable f) (hg : Summable g) :
    Summable (fun x : ι × κ => f x.1 * g x.2)

example {f g : ℕ → Cut}
    (hf : Summable (fun i => |f i|)) (hg : Summable (fun j => |g j|)) :
    Summable (fun x : ℕ × ℕ => |f x.1| * |g x.2|) :=
  cut_summable_prod_of_nonneg (f := fun i => |f i|) (g := fun j => |g j|)
    (fun _ => abs_nonneg _) (fun _ => abs_nonneg _) hf hg
