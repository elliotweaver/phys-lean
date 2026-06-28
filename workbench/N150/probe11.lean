import Phys.Algebra.LorentzContinuumCliffordPinNondegenerate
import Mathlib.LinearAlgebra.CliffordAlgebra.Contraction
import Mathlib.LinearAlgebra.Dual.Basis
import Mathlib.LinearAlgebra.ExteriorAlgebra.Grading

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators DirectSum

abbrev EXT := ExteriorAlgebra Cut STVC
abbrev IdxN := Module.Free.ChooseBasisIndex Cut STVC
noncomputable abbrev bST : Module.Basis IdxN Cut STVC := Module.Free.chooseBasis Cut STVC

local notation "ιe" => ExteriorAlgebra.ι (R := Cut)

noncomputable def numOp : EXT →ₗ[Cut] EXT :=
  ∑ i : IdxN, (LinearMap.mulLeft Cut (ιe (bST i))).comp
    (CliffordAlgebra.contractLeft (Q := (0 : QuadraticForm Cut STVC)) (bST.dualBasis i))

abbrev Gr : ℕ → Submodule Cut EXT := fun i => (⋀[Cut]^i STVC : Submodule Cut EXT)

axiom numOp_eigen (n : ℕ) (x : EXT) (hx : x ∈ Gr n) : numOp x = (n : Cut) • x

-- the graded decomposition components
example (x : EXT) (h : numOp x = 0) : x ∈ Gr 0 := by
  classical
  -- the component map
  let comp : ℕ → EXT := fun i => (DirectSum.decompose Gr x i : EXT)
  have hmem : ∀ i, comp i ∈ Gr i := fun i => (DirectSum.decompose Gr x i).2
  -- numOp on each component
  have heig : ∀ i, numOp (comp i) = (i : Cut) • comp i := fun i => numOp_eigen i (comp i) (hmem i)
  -- decompose x as a finite sum over support
  have hsum : (∑ i ∈ (DirectSum.decompose Gr x).support, comp i) = x :=
    DirectSum.sum_support_decompose Gr x
  -- apply numOp: 0 = numOp x = Σ_i i • comp i
  have hz : (∑ i ∈ (DirectSum.decompose Gr x).support, (i : Cut) • comp i) = 0 := by
    rw [← h, ← hsum, map_sum]
    exact Finset.sum_congr rfl (fun i _ => heig i)
  -- extract: for each j ≥ 1, comp j = 0. Then support ⊆ {0}, so x = comp 0 ∈ Gr 0.
  have hcompzero : ∀ j : ℕ, 1 ≤ j → comp j = 0 := by
    intro j hj
    -- (j:Cut) • comp j ∈ Gr j ; apply decompose component j to hz
    have hsmem : ∀ i ∈ (DirectSum.decompose Gr x).support, (i : Cut) • comp i ∈ Gr i :=
      fun i _ => Submodule.smul_mem _ _ (hmem i)
    -- the j-component of the sum equals (j:Cut) • comp j
    have key : (DirectSum.decompose Gr
        (∑ i ∈ (DirectSum.decompose Gr x).support, (i : Cut) • comp i) j : EXT)
        = (j : Cut) • comp j := by
      rw [DirectSum.decompose_sum]
      rw [DirectSum.coe_apply, ← Finset.sum_apply]  -- placeholder
      sorry
    rw [hz] at key
    simp only [DirectSum.decompose_zero] at key
    -- key : 0 = (j:Cut) • comp j   (in EXT)
    have : (j : Cut) • comp j = 0 := by
      simpa using key.symm
    have hjne : (j : Cut) ≠ 0 := by
      exact_mod_cast Nat.one_le_iff_ne_zero.mp hj
    exact (smul_eq_zero.mp this).resolve_left hjne
  sorry

end

end Phys.Algebra
