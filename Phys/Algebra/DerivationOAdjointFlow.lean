/-
# The adjoint-flow derivative — the non-abelian first-order bracket (N181)

  N180 (`DerivationOCommutingFlow.lean`) banked the ABELIAN first-order bracket: for COMMUTING
  generators `⁅D',E'⁆ = 0`, the two exponential flows commute. It explicitly DEFERRED the FULL
  non-abelian first order `[exp(sD), exp(tE)] ≈ id + st·⁅D,E⁆`, because the 2-parameter group
  commutator needs the SECOND-order Taylor of `exp` over `Cut` (unbanked — `expO_tangent` N41g
  gives only the FIRST derivative).

  ## THE ONE LAW / W1 REFRAME — the trunk makes the hard thing first-order

  The SAME first-order bracket content is captured by the ONE-PARAMETER ADJOINT (conjugation) flow
  derivative
      d/dt ( exp(tD) · A · exp(−tD) )|₀  =  D·A − A·D  =  ⁅D, A⁆,
  which needs ONLY the FIRST-order tangent (the banked scalar power-series derivative
  `cut_powerseries_deriv` → the entry tangent `expMap_entry_tangent` N41g) plus matrix-multiplication
  continuity. The conjugation flow makes the NON-ABELIAN bracket FIRST-order: where the raw group
  commutator `[exp(sD),exp(tE)]` is second-order (its first-order part vanishes), the adjoint flow
  `Ad(exp(tD)) = exp(tD)·(−)·exp(−tD)` has a non-trivial FIRST derivative, and that derivative IS the
  Lie bracket. This is the adjoint-representation tangent `ad = d/dt Ad(exp(tD))|₀`.

  ## What this node banks (the matrix level + the operator transport)

    * `matrix_mul_tendsto`   — matrix multiplication is continuous (entrywise): `F t → A`, `G t → B`
                               ⟹ `F t · G t → A · B` (each product entry a finite sum of products).
    * `expMap_tendsto_one`   — `expMap (t • M) → 1` as `t → 0` (continuity at `0`), DERIVED from the
                               banked first-order tangent (`expMap (t•M) − 1 = t · (diff quotient)`).
    * `expMap_smul_tangent`  — the matrix form of the banked entry tangent: `t⁻¹ • (expMap(t•M) − 1) → M`.
    * `adjMap_tangent`       — ★★ THE HEADLINE (matrix form): the adjoint-flow difference quotient
                               `t⁻¹ • (expMap(t•M) · A · expMap(t•(−M)) − A)` tends to `M·A − A·M = ⁅M,A⁆`.
    * `derivMatrix_sub` / `derivMatrix_bracket` — `derivMatrix` (the coordinate ring hom N180) carries
                               the operator Lie bracket to the matrix commutator.
    * `adjMap_tangent_deriv` — ★★ THE OPERATOR TRANSPORT: the adjoint flow of `derivMatrix D'` acting on
                               `derivMatrix E'` has derivative `derivMatrix ⁅D',E'⁆` — the integrated
                               group conjugation flow's tangent IS the algebra Lie bracket.

  NON-VACUITY (W8). `witM := single 0 1 1`, `witA := single 1 0 1` is a NON-commuting pair whose
  bracket `witM·witA − witA·witM` is NONZERO at entry `(0,0)` (`wit_bracket_ne`). So the adjoint-flow
  derivative genuinely recovers a NON-VANISHING Lie bracket — the genuine non-abelian content, NOT the
  N180 abelian (commuting) case where the analogous flow commutator is trivial.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2): delete "exp / derivation / automorphism / flow /
  adjoint / Lie bracket / G₂ / gauge". The file is a complete proof that, over the `Cut`-valued
  `8 × 8` matrices, matrix multiplication is continuous, the matrix exponential is continuous at `0`
  with first-order tangent `M`, and the conjugation difference quotient
  `t⁻¹ • (expMap(t•M)·A·expMap(−t•M) − A)` tends to the commutator `M·A − A·M`; and that the coordinate
  ring homomorphism carries the operator commutator to this matrix commutator. No theorem STATEMENT
  needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no posited
  exp/G₂/Aut/flow/Lie-group/BCH/metric, NO Mathlib ℝ as content, NO ℝ-valued `Norm`, NO Mathlib
  `NormedSpace.exp`/`Matrix.exp`/`HasDerivAt`, a fully proved implication throughout.
-/
import Phys.Algebra.DerivationOTangent
import Phys.Algebra.DerivationOCommutingFlow

namespace Phys.Algebra

open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ Matrix
open Filter
open scoped BigOperators Topology

noncomputable section

attribute [local instance] CD.narCD CD.srCD

/-! ## Matrix multiplication is continuous (entrywise). -/

/-- MATRIX-MUL-OF-TENDSTO (entrywise). If `F t → A` and `G t → B` entrywise (the product topology on
    `Matrix (Fin 8) (Fin 8) Cut`), then `F t * G t → A * B` entrywise — each product entry is the
    finite sum `∑ k, F t i k * G t k j`, continuous in the entries. -/
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

/-! ## The matrix exponential is continuous at `0`, and its first-order tangent. -/

/-- `expMap (t • M) → 1` as `t → 0` in `𝓝[≠] 0` (continuity at `0`), entrywise, over the derived ℝ.
    DERIVED from the banked first-order tangent: `expMap(t•M) i j − 1 i j = t · (t⁻¹·(…))`, and `t → 0`
    times the convergent difference quotient → `0`. -/
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

/-- THE MATRIX FIRST-ORDER TANGENT (matrix form of the banked entry tangent N41g):
    `t⁻¹ • (expMap (t • M) − 1) → M` as `t → 0`. -/
theorem expMap_smul_tangent (M : Matrix (Fin 8) (Fin 8) Cut) :
    Tendsto (fun t : Cut => t⁻¹ • (expMap (t • M) - 1)) (𝓝[≠] (0 : Cut)) (𝓝 M) := by
  refine tendsto_pi_nhds.mpr (fun i => tendsto_pi_nhds.mpr (fun j => ?_))
  refine (expMap_entry_tangent M i j).congr' ?_
  filter_upwards with t
  simp only [Matrix.smul_apply, Matrix.sub_apply, smul_eq_mul]

/-! ## THE ADJOINT-FLOW DERIVATIVE (the non-abelian first-order bracket). -/

/-- ★★ THE ADJOINT-FLOW DERIVATIVE over the derived ℝ. `d/dt ( expMap(t•M) · A · expMap(t•(−M)) )|₀
    = M·A − A·M = ⁅M,A⁆`. The genuine first-order content: the derivative of the conjugation (adjoint)
    flow IS the Lie bracket. NEEDS ONLY the first-order tangent — the conjugation flow makes the
    non-abelian bracket first-order.

    PROOF (THE ONE LAW): write `P t := expMap(t•M)`, `Q t := expMap(t•(−M))`, `T t := t⁻¹•(P t − 1)`.
    Since `P·Q = 1` (banked `expMap_mul_neg` N40), the algebraic identity
    `t⁻¹•(P·A·Q − A) = (T·A − A·T)·Q` holds for all `t`. Then `T → M` (the matrix tangent
    `expMap_smul_tangent`), so `T·A − A·T → M·A − A·M` (matrix-mul continuity), and `Q → 1` (continuity
    at 0 `expMap_tendsto_one`), so the product `→ (M·A − A·M)·1 = ⁅M,A⁆`. -/
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

/-! ## Operator-level transport: `derivMatrix` carries the Lie bracket. -/

/-- `derivMatrix` PRESERVES SUBTRACTION (both `conjRingEquiv coordOCut` and `toMatrix'` additive). -/
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

/-- ★★ THE OPERATOR ADJOINT-FLOW DERIVATIVE: the adjoint (conjugation) flow of `derivMatrix D'` acting
    on `derivMatrix E'` has derivative `derivMatrix ⁅D',E'⁆` — the integrated group conjugation flow's
    tangent IS the algebra Lie bracket, transported through the coordinate ring homomorphism. -/
theorem adjMap_tangent_deriv (D' E' : Module.End Cut (O Cut)) :
    Tendsto (fun t : Cut => t⁻¹ • (expMap (t • derivMatrix D') * derivMatrix E'
        * expMap (t • (- derivMatrix D')) - derivMatrix E'))
      (𝓝[≠] (0 : Cut)) (𝓝 (derivMatrix (⁅D', E'⁆ : Module.End Cut (O Cut)))) := by
  rw [derivMatrix_bracket]
  exact adjMap_tangent (derivMatrix D') (derivMatrix E')

/-! ## W8 non-vacuity: a NON-commuting witness with nonzero bracket. -/

/-- A concrete NON-commuting pair of `8 × 8` matrices over `Cut`. -/
def witM : Matrix (Fin 8) (Fin 8) Cut := Matrix.single 0 1 1
def witA : Matrix (Fin 8) (Fin 8) Cut := Matrix.single 1 0 1

/-- ★ W8 NON-VACUITY: the witness bracket is NONZERO (at entry `(0,0)` it reads `1 ≠ 0`). So the
    adjoint-flow derivative genuinely recovers a NON-vanishing Lie bracket — the genuine non-abelian
    content, NOT the N180 abelian (commuting, trivial-commutator) case. -/
theorem wit_bracket_ne : (witM * witA - witA * witM) ≠ 0 := by
  intro h
  have h00 := congrFun (congrFun h 0) 0
  simp only [witM, witA, Matrix.sub_apply, Matrix.zero_apply, Matrix.mul_apply,
    Matrix.single, Matrix.of_apply] at h00
  norm_num [Finset.sum_ite_eq, Finset.sum_ite_eq'] at h00

end

end Phys.Algebra
