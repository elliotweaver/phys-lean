import Phys.Algebra.DerivationSemisimpleModule
import Mathlib.RingTheory.SimpleModule.Isotypic
import Mathlib.RingTheory.SimpleModule.Rank

open LinearMap (BilinForm)

noncomputable section

variable {V : Type*} [AddCommGroup V] [Module ℚ V] [FiniteDimensional ℚ V]

-- An A-submodule N: its restrictScalars ℚ is a ℚ-subspace, stable under every a ∈ A acting on V.
-- Probe: for N : Submodule A V, n ∈ N (as A-submodule), a : A, does (a:End ℚ V) (n) ∈ N?
example (A : Subalgebra ℚ (Module.End ℚ V)) (N : Submodule A V) (a : A) (x : V) (hx : x ∈ N) :
    ((a : Module.End ℚ V)) x ∈ N := by
  -- a • x for the A-action; need to relate to (a : End) x.
  have : a • x ∈ N := N.smul_mem a hx
  -- is a • x = (a : End ℚ V) x ?  The A-module structure on V: a • x = (a : End) x
  convert this using 1

-- FULLY INVARIANT: N.IsFullyInvariant means ∀ f : End A V, N ≤ N.comap f, i.e. f preserves N.
-- An A-linear endomorphism f of V preserves a fully-invariant N.
example (A : Subalgebra ℚ (Module.End ℚ V)) (N : Submodule A V) (hN : N.IsFullyInvariant)
    (f : Module.End A V) (x : V) (hx : x ∈ N) : f x ∈ N := by
  have := hN f
  exact this hx

end
