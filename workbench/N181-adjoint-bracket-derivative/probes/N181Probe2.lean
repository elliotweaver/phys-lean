import Phys.Algebra.DerivationOTangent
import Phys.Algebra.DerivationOCommutingFlow

/-!  N181 probe2 — THE ADJOINT-FLOW DERIVATIVE assembly (the non-abelian first-order bracket). -/

namespace Phys.Algebra

open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ Matrix
open Filter
open scoped BigOperators Topology

noncomputable section

attribute [local instance] CD.narCD CD.srCD

/-- matrix-mul-of-tendsto entrywise. -/
theorem matrix_mul_tendsto {l : Filter Cut}
    (F G : Cut → Matrix (Fin 8) (Fin 8) Cut) (A B : Matrix (Fin 8) (Fin 8) Cut)
    (hF : Tendsto F l (𝓝 A)) (hG : Tendsto G l (𝓝 B)) :
    Tendsto (fun t => F t * G t) l (𝓝 (A * B)) := by
  refine tendsto_pi_nhds.mpr (fun i => tendsto_pi_nhds.mpr (fun j => ?_))
  have hentry : (fun t => (F t * G t) i j) = (fun t => ∑ k, F t i k * G t k j) := by
    funext t; rw [Matrix.mul_apply]
  rw [hentry]
  have htgt : (A * B) i j = ∑ k, A i k * B k j := Matrix.mul_apply
  rw [htgt]
  apply tendsto_finset_sum
  intro k _
  exact ((tendsto_pi_nhds.mp ((tendsto_pi_nhds.mp hF) i)) k).mul
        ((tendsto_pi_nhds.mp ((tendsto_pi_nhds.mp hG) k)) j)

/-- expMap continuity at 0 (entrywise), from the banked first-order tangent. -/
theorem expMap_tendsto_one (M : Matrix (Fin 8) (Fin 8) Cut) :
    Tendsto (fun t : Cut => expMap (t • M)) (𝓝[≠] (0 : Cut)) (𝓝 (1 : Matrix (Fin 8) (Fin 8) Cut)) := by
  refine tendsto_pi_nhds.mpr (fun i => tendsto_pi_nhds.mpr (fun j => ?_))
  have htan := expMap_entry_tangent M i j
  have htto0 : Tendsto (fun t : Cut => t) (𝓝[≠] (0:Cut)) (𝓝 0) :=
    tendsto_id.mono_left nhdsWithin_le_nhds
  have hprod := htto0.mul htan
  have hcong : Tendsto (fun t : Cut => expMap (t • M) i j - (1 : Matrix (Fin 8) (Fin 8) Cut) i j)
      (𝓝[≠] (0:Cut)) (𝓝 (0 * M i j)) := by
    refine hprod.congr' ?_
    filter_upwards [eventually_mem_nhdsWithin] with t ht
    have htne : t ≠ 0 := ht
    field_simp
  simp only [zero_mul] at hcong
  simpa using hcong.add_const ((1 : Matrix (Fin 8) (Fin 8) Cut) i j)

/-- THE MATRIX TANGENT (matrix form of the banked entry tangent): `t⁻¹ • (expMap (t•M) - 1) → M`. -/
theorem expMap_smul_tangent (M : Matrix (Fin 8) (Fin 8) Cut) :
    Tendsto (fun t : Cut => t⁻¹ • (expMap (t • M) - 1)) (𝓝[≠] (0 : Cut)) (𝓝 M) := by
  refine tendsto_pi_nhds.mpr (fun i => tendsto_pi_nhds.mpr (fun j => ?_))
  refine (expMap_entry_tangent M i j).congr' ?_
  filter_upwards with t
  simp only [Matrix.smul_apply, Matrix.sub_apply, smul_eq_mul]

/-- ★★ THE ADJOINT-FLOW DERIVATIVE (the non-abelian first-order bracket) over the derived ℝ.
    `d/dt ( expMap(t•M) · A · expMap(t•(−M)) )|₀ = M·A − A·M = ⁅M,A⁆`. The genuine first-order
    content: the derivative of the conjugation (adjoint) flow IS the Lie bracket. NEEDS ONLY the
    first-order tangent — the conjugation flow makes the non-abelian bracket first-order. -/
theorem adjMap_tangent (M A : Matrix (Fin 8) (Fin 8) Cut) :
    Tendsto (fun t : Cut => t⁻¹ • (expMap (t • M) * A * expMap (t • (-M)) - A))
      (𝓝[≠] (0 : Cut)) (𝓝 (M * A - A * M)) := by
  -- the algebraic identity (all t): t⁻¹•(P·A·Q − A) = (T·A − A·T)·Q,  T t := t⁻¹•(P−1)
  have hid : (fun t : Cut => t⁻¹ • (expMap (t • M) * A * expMap (t • (-M)) - A))
      = (fun t => (t⁻¹ • (expMap (t • M) - 1) * A - A * (t⁻¹ • (expMap (t • M) - 1)))
          * expMap (t • (-M))) := by
    funext t
    have hPQ : expMap (t • M) * expMap (t • (-M)) = 1 := by
      have h := expMap_mul_neg (t • M); rw [smul_neg]; exact h
    -- step 1: P*A*Q − A = (P*A − A*P)*Q   (since (A*P)*Q = A*(P*Q) = A)
    have hfac : expMap (t • M) * A * expMap (t • (-M)) - A
        = (expMap (t • M) * A - A * expMap (t • M)) * expMap (t • (-M)) := by
      rw [sub_mul, mul_assoc A (expMap (t • M)) (expMap (t • (-M))), hPQ, mul_one]
    -- step 2: t⁻¹ • (P*A − A*P) = (t⁻¹•(P−1))*A − A*(t⁻¹•(P−1))
    have hTeq : t⁻¹ • (expMap (t • M) * A - A * expMap (t • M))
        = t⁻¹ • (expMap (t • M) - 1) * A - A * (t⁻¹ • (expMap (t • M) - 1)) := by
      rw [smul_mul_assoc, mul_smul_comm, ← smul_sub]
      congr 1
      rw [sub_mul, mul_sub, one_mul, mul_one]; abel
    rw [hfac, ← smul_mul_assoc, hTeq]
  rw [hid]
  set T : Cut → Matrix (Fin 8) (Fin 8) Cut := fun t => t⁻¹ • (expMap (t • M) - 1) with hT
  -- limits: T → M, A const, Q → 1
  have hTM : Tendsto T (𝓝[≠] (0:Cut)) (𝓝 M) := expMap_smul_tangent M
  have hTA : Tendsto (fun t => T t * A) (𝓝[≠] (0:Cut)) (𝓝 (M * A)) :=
    matrix_mul_tendsto T (fun _ => A) M A hTM tendsto_const_nhds
  have hAT : Tendsto (fun t => A * T t) (𝓝[≠] (0:Cut)) (𝓝 (A * M)) :=
    matrix_mul_tendsto (fun _ => A) T A M tendsto_const_nhds hTM
  have hdiff : Tendsto (fun t => T t * A - A * T t) (𝓝[≠] (0:Cut)) (𝓝 (M * A - A * M)) :=
    hTA.sub hAT
  have hQ1 : Tendsto (fun t : Cut => expMap (t • (-M))) (𝓝[≠] (0:Cut)) (𝓝 1) :=
    expMap_tendsto_one (-M)
  have hfin := matrix_mul_tendsto (fun t => T t * A - A * T t)
    (fun t => expMap (t • (-M))) (M * A - A * M) 1 hdiff hQ1
  simpa [hT] using hfin

/-! ## Operator-level transport: derivMatrix carries the bracket. -/

/-- `derivMatrix` PRESERVES SUBTRACTION (both factors additive). -/
theorem derivMatrix_sub (D' E' : Module.End Cut (O Cut)) :
    derivMatrix (D' - E') = derivMatrix D' - derivMatrix E' := by
  unfold derivMatrix
  rw [map_sub (LinearEquiv.conjRingEquiv coordOCut), map_sub]

/-- ★ `derivMatrix` CARRIES THE LIE BRACKET to the matrix commutator:
    `derivMatrix ⁅D',E'⁆ = derivMatrix D' * derivMatrix E' − derivMatrix E' * derivMatrix D'`. -/
theorem derivMatrix_bracket (D' E' : Module.End Cut (O Cut)) :
    derivMatrix (⁅D', E'⁆ : Module.End Cut (O Cut))
      = derivMatrix D' * derivMatrix E' - derivMatrix E' * derivMatrix D' := by
  show derivMatrix (D' * E' - E' * D') = _
  rw [derivMatrix_sub, derivMatrix_mul, derivMatrix_mul]

/-- ★★ THE OPERATOR ADJOINT-FLOW DERIVATIVE: the adjoint flow of `derivMatrix D'` acting on
    `derivMatrix E'` has derivative `derivMatrix ⁅D',E'⁆` — the integrated group conjugation flow's
    tangent IS the algebra Lie bracket, transported through the coordinate ring hom. -/
theorem adjMap_tangent_deriv (D' E' : Module.End Cut (O Cut)) :
    Tendsto (fun t : Cut => t⁻¹ • (expMap (t • derivMatrix D') * derivMatrix E'
        * expMap (t • (- derivMatrix D')) - derivMatrix E'))
      (𝓝[≠] (0 : Cut)) (𝓝 (derivMatrix (⁅D', E'⁆ : Module.End Cut (O Cut)))) := by
  rw [derivMatrix_bracket]
  exact adjMap_tangent (derivMatrix D') (derivMatrix E')

/-! ## W8 non-vacuity: a NON-commuting witness with nonzero bracket. -/

/-- A concrete non-commuting pair of 8×8 matrices over `Cut`: the bracket `⁅M,A⁆` is NONZERO,
    so the adjoint-flow derivative is genuinely the non-abelian bracket (NOT the N180 abelian case). -/
def witM : Matrix (Fin 8) (Fin 8) Cut := Matrix.single 0 1 1
def witA : Matrix (Fin 8) (Fin 8) Cut := Matrix.single 1 0 1

/-- ★ W8: the witness bracket is NONZERO at entry `(0,0)` — `(M*A − A*M) 0 0 = 1 ≠ 0`. The
    adjoint-flow derivative genuinely recovers a non-vanishing Lie bracket. -/
theorem wit_bracket_ne : (witM * witA - witA * witM) ≠ 0 := by
  intro h
  have h00 := congrFun (congrFun h 0) 0
  simp only [witM, witA, Matrix.sub_apply, Matrix.zero_apply, Matrix.mul_apply,
    Matrix.single, Matrix.of_apply] at h00
  norm_num [Finset.sum_ite_eq, Finset.sum_ite_eq'] at h00

end

end Phys.Algebra

-- axiom audit
#print axioms Phys.Algebra.matrix_mul_tendsto
#print axioms Phys.Algebra.expMap_tendsto_one
#print axioms Phys.Algebra.expMap_smul_tangent
#print axioms Phys.Algebra.adjMap_tangent
#print axioms Phys.Algebra.derivMatrix_sub
#print axioms Phys.Algebra.derivMatrix_bracket
#print axioms Phys.Algebra.adjMap_tangent_deriv
#print axioms Phys.Algebra.wit_bracket_ne
