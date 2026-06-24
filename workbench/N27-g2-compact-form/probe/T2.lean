import Phys.Algebra.DerivationIrreducible
import Mathlib.LinearAlgebra.BilinearForm.Orthogonal

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD LieAlgebra
open LinearMap (BilinForm)
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section

-- Probe T2: the gBil-orthogonal complement of a Lie submodule is invariant under
-- the derivation action (skew-adjointness). Core of complete reducibility.
-- Goal: for N : LieSubmodule, and any D : derivationLieQ, x ∈ orthogonal N → D • x ∈ orthogonal N.
-- The action of D on O ℚ is the underlying endomorphism. We need: D maps orthogonal N into itself.

-- First understand how the Lie module action ⁅D, x⁆ relates to D.val x on O ℚ.
example (D : derivationLieQ) (x : O ℚ) : ⁅D, x⁆ = (D : Module.End ℚ (O ℚ)) x := rfl

-- Now the invariance: if x is gBil-orthogonal to all of N (a submodule invariant under D),
-- then D x is too. Using skew-adjointness: gForm (D x) n = - gForm x (D n), and D n ∈ N.
example (N : Submodule ℚ (O ℚ)) (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D)
    (hN : ∀ n ∈ N, D n ∈ N) (x : O ℚ) (hx : x ∈ gBil.orthogonal N) :
    D x ∈ gBil.orthogonal N := by
  rw [BilinForm.mem_orthogonal_iff]
  intro n hn
  -- IsOrtho gBil n (D x) means gBil n (D x) = 0
  show gBil n (D x) = 0
  -- skew-adjoint: gForm (D y) z + gForm y (D z) = 0 (gFormQ_skew)
  -- want gForm n (D x) = 0. Use symmetry: gForm n (D x) = gForm (D x) n.
  rw [gBil_apply, gForm_symm n (D x)]
  -- gForm (D x) n = - gForm x (D n) by skew
  have hsk := gFormQ_skew D hD x n
  -- hsk : gForm (D x) n + gForm x (D n) = 0
  have hDn : D n ∈ N := hN n hn
  -- x ∈ orthogonal N ⟹ gBil n' x = 0 for all n' ∈ N; in particular for D n
  have hxorth : gBil (D n) x = 0 := (BilinForm.mem_orthogonal_iff.mp hx) (D n) hDn
  rw [gBil_apply] at hxorth
  -- gForm (D n) x = gForm x (D n) by symmetry
  rw [gForm_symm] at hxorth
  -- so gForm x (D n) = 0, and hsk gives gForm (D x) n = 0
  linarith [hsk, hxorth]

end
end Phys.Algebra
