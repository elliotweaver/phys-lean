import Phys.Algebra.DerivationSimpleCollapse
import Mathlib.RingTheory.SimpleModule.Isotypic

open LinearMap (BilinForm)
noncomputable section
variable {V : Type*} [AddCommGroup V] [Module ℚ V]

-- IsFullyInvariant N := ∀ f : End A V, N ≤ N.comap f.  So full-inv gives stability.
example (A : Subalgebra ℚ (Module.End ℚ V)) (N : Submodule A V)
    (hN : N.IsFullyInvariant) (f : V →ₗ[A] V) (x : V) (hx : x ∈ N) : f x ∈ N := by
  have := hN f hx
  rwa [Submodule.mem_comap] at this

end
