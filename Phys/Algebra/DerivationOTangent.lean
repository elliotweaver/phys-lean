/-
  # N41g — THE TANGENT HALF `d/dt exp(tD)|₀ = D` over the DERIVED ℝ `ContinuumQ.Cut`
  #         (the `Der → Aut` derivative recovering the derivation; completes the Lie-algebra ↔
  #          Lie-group correspondence over the derived continuum).

  N41f (`Phys/Algebra/DerivationOAutomorphism.lean`) closed the GROUP end of `Der(𝕆) → Aut(𝕆)`:
  the exponential `expO (D'.restrictScalars ℤ)` of a `Cut`-linear Leibniz derivation is a genuine
  `Cut`-side algebra automorphism of the non-associative `O Cut`. THIS file closes the TANGENT (Lie
  algebra) end: the derivative at `0` of the one-parameter flow `t ↦ expO ((t • D').restrictScalars ℤ) x`
  recovers the derivation itself — `d/dt exp(tD)|₀ = D` — as a TRUNK-NATIVE `Tendsto` of the
  difference quotient over the N34 order topology / N36 uniform structure on the derived ℝ, NOT
  Mathlib's `HasDerivAt`/`deriv`/`fderiv` (each of which needs an ℝ/`NormedField`-valued derivative
  = a CONTENT trap, STANDARD §3).

  ## The route (THE ONE LAW — reframe through the trunk, the reduction is clean)

  The derivative is NOT bashed on the non-associative product. It transports, through the SAME N41d
  coordinate frame `coordOCut` (the homeomorphism `O Cut ≃ₗ[Cut] (Fin 8 → Cut)`), to the MATRIX
  exponential derivative, which reduces ENTRYWISE to the SCALAR power-series derivative banked in
  `Phys/Foundation/ContinuumScalarDeriv.lean` (`cut_powerseries_deriv`):

    1. `derivMatrix_smul` — the coordinate matrix is HOMOGENEOUS: `derivMatrix (t • D') = t • derivMatrix D'`
       (additivity/homogeneity of `conjRingEquiv` + `toMatrix'`, the analogue of the banked
       `derivMatrix_neg`).
    2. `expMap_smul_entry` — each matrix-exponential entry is the SCALAR power series in `t`:
       `expMap (t • M) i j = ∑' n, tⁿ · expTerm M n i j` (the entry-projection AddMonoidHom commutes
       with the banked-summable `tsum` via `HasSum.map`; `(t•M)ⁿ = tⁿ • Mⁿ` via `smul_pow`).
    3. `expMap_entry_tangent` — THE HEART: `d/dt expMap(t•M)_{ij}|₀ = M_{ij}` — the entrywise
       matrix-exponential derivative, EXACTLY `cut_powerseries_deriv` applied to `a n := expTerm M n i j`
       (entire, `expTerm_entry_abs_summable`), whose `a₀ = (1)_{ij}` and `a₁ = M_{ij}`.
    4. `expMap_vec_tangent` — the VECTOR statement: per-coordinate (`tendsto_pi_nhds`) the finite sum
       `(expMap(t•M) *ᵥ v)_m = ∑ j, expMap(t•M) m j · v j` is `tendsto_finset_sum` of the entry limits.
    5. `expO_tangent` (★ THE THEOREM): transport the vector statement back through the homeomorphism
       `coordOCut` (continuous both ways, banked N41d), using the N41f intertwining `coordOCut_expO`
       and the `n=1` power transport `expO_matrix_rep` (`coordOCut (D' x) = derivMatrix D' *ᵥ coordOCut x`).

  ## The one cause (THE ONE LAW)

  The SAME C6 eternal-approach that built the derived ℝ, made its operator-norm-majorized matrix
  series converge (N38/N39), gave the matrix one-parameter subgroup (N40), the unconditional vector
  exponential (N41d), the product law (N41e) and the automorphism (N41f) now closes the LIE-ALGEBRA
  end: the convergent flow is DIFFERENTIABLE at `0`, and its derivative is the generating derivation.
  One engine, several terminations — the Lie group `Aut(𝕆)` and its Lie algebra `Der(𝕆)` are the two
  ends of one exponential, both now derived over the derived continuum.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2): delete "exp/derivation/automorphism/gauge/G₂/colour"
  → the pure statement that the derivative at `0` of the one-parameter flow `t ↦ ∑(tⁿ/n!)•(Dⁿ x)` of a
  linear endomorphism `D` of the 8-dim complete-topological vector space over the derived ℝ is `D x`
  (the first-order coefficient), a trunk-native difference-quotient `Tendsto`.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge, NO Mathlib
  number-system content import, NO ℝ-valued `Norm`, NO Mathlib `HasDerivAt`/`deriv`/`fderiv`/
  `NormedField`/`NormedSpace`/`Matrix.exp`/`NormedSpace.exp`.
-/
import Phys.Algebra.DerivationOAutomorphism
import Phys.Foundation.ContinuumScalarDeriv

namespace Phys.Algebra

open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ Matrix Filter
open scoped BigOperators Topology

noncomputable section

attribute [local instance] CD.narCD CD.srCD

/-! ## The coordinate matrix is homogeneous. -/

/-- The coordinate matrix of a scaled endomorphism is the scaled matrix: `derivMatrix (t • D') =
    t • derivMatrix D'`. Entrywise, through `conjRingEquiv_apply_apply` and `map_smul` of the
    `Cut`-linear `coordOCut`. The homogeneity analogue of the banked `derivMatrix_neg`. -/
theorem derivMatrix_smul (t : Cut) (D' : Module.End Cut (O Cut)) :
    derivMatrix (t • D') = t • derivMatrix D' := by
  unfold derivMatrix
  ext i j
  simp only [Matrix.smul_apply, smul_eq_mul, LinearMap.toMatrix'_apply]
  rw [LinearEquiv.conjRingEquiv_apply_apply, LinearEquiv.conjRingEquiv_apply_apply]
  simp [LinearMap.smul_apply, map_smul]

/-! ## Entry-level facts of the matrix exponential. -/

/-- The `n = 0` exponential term is the identity matrix entrywise: `expTerm M 0 i j = (1)_{ij}`. -/
theorem expTerm_zero_entry (M : Matrix (Fin 8) (Fin 8) Cut) (i j : Fin 8) :
    expTerm M 0 i j = (1 : Matrix (Fin 8) (Fin 8) Cut) i j := by
  unfold expTerm
  simp [Nat.factorial]

/-- The `n = 1` exponential term is `M` entrywise: `expTerm M 1 i j = M i j`. The first-order
    coefficient — the one the derivative recovers. -/
theorem expTerm_one_entry (M : Matrix (Fin 8) (Fin 8) Cut) (i j : Fin 8) :
    expTerm M 1 i j = M i j := by
  unfold expTerm
  simp [Nat.factorial]

/-- The entry-projection `Matrix (Fin 8) (Fin 8) Cut →+ Cut`, `A ↦ A i j`, as an `AddMonoidHom`
    (composition of two `Pi.evalAddMonoidHom`s — the matrix instances ARE the `Pi` instances). The
    `HasSum.map` vehicle that pushes the entry projection through the exponential `tsum`. -/
def entryHom (i j : Fin 8) : Matrix (Fin 8) (Fin 8) Cut →+ Cut :=
  (Pi.evalAddMonoidHom (fun _ : Fin 8 => Cut) j).comp
    (Pi.evalAddMonoidHom (fun _ : Fin 8 => (Fin 8 → Cut)) i)

/-- The entry projection is continuous (composition of coordinate evaluations). -/
theorem entryHom_continuous (i j : Fin 8) : Continuous (entryHom i j) :=
  (continuous_apply j).comp (continuous_apply i)

/-- Each matrix-exponential entry of `t • M` is the SCALAR power series in `t`: `expMap (t • M) i j =
    ∑' n, tⁿ · expTerm M n i j`. The continuous entry-projection commutes with the banked-summable
    exponential `tsum` (`HasSum.map`); each term `expTerm (t • M) n i j = tⁿ · expTerm M n i j` by
    `(t • M)ⁿ = tⁿ • Mⁿ` (`smul_pow`). -/
theorem expMap_smul_entry (t : Cut) (M : Matrix (Fin 8) (Fin 8) Cut) (i j : Fin 8) :
    expMap (t • M) i j = ∑' n, t ^ n * expTerm M n i j := by
  have hmap := (expMap_hasSum (t • M)).map (entryHom i j) (entryHom_continuous i j)
  have hterm : (⇑(entryHom i j) ∘ expTerm (t • M)) = (fun n => t ^ n * expTerm M n i j) := by
    funext n
    show expTerm (t • M) n i j = t ^ n * expTerm M n i j
    unfold expTerm
    rw [smul_pow]
    simp only [Matrix.smul_apply, smul_eq_mul]
    ring
  rw [hterm] at hmap
  show entryHom i j (expMap (t • M)) = ∑' n, t ^ n * expTerm M n i j
  exact hmap.tsum_eq.symm

/-! ## THE ENTRYWISE MATRIX-EXPONENTIAL DERIVATIVE (the heart, = the scalar power-series derivative). -/

/-- ★ THE HEART: `d/dt expMap(t • M)_{ij}|₀ = M_{ij}` — the entrywise matrix-exponential derivative
    over the derived ℝ, a trunk-native `Tendsto` of the difference quotient. EXACTLY the banked scalar
    power-series derivative `cut_powerseries_deriv` applied to the entire coefficient sequence
    `a n := expTerm M n i j` (`expTerm_entry_abs_summable`), whose `a₀ = (1)_{ij}` (cancels in the
    difference) and `a₁ = M_{ij}` (the limit). -/
theorem expMap_entry_tangent (M : Matrix (Fin 8) (Fin 8) Cut) (i j : Fin 8) :
    Tendsto (fun t : Cut => t⁻¹ * (expMap (t • M) i j - (1 : Matrix (Fin 8) (Fin 8) Cut) i j))
      (𝓝[≠] (0 : Cut)) (𝓝 (M i j)) := by
  have hps := cut_powerseries_deriv (fun n => expTerm M n i j)
    (expTerm_entry_abs_summable M i j)
  simp only [expTerm_one_entry] at hps
  refine hps.congr' ?_
  filter_upwards with t
  rw [expMap_smul_entry, expTerm_zero_entry]

/-! ## The vector statement (per-coordinate, finite sum of entry limits). -/

/-- The VECTOR matrix-exponential derivative: `d/dt (expMap(t • M) *ᵥ v)|₀ = M *ᵥ v` over the derived
    ℝ. Per-coordinate (`tendsto_pi_nhds`) the `m`-th coordinate `(expMap(t • M) *ᵥ v)_m = ∑ j,
    expMap(t • M) m j · v j` is the `tendsto_finset_sum` of the entry derivatives
    `expMap_entry_tangent` scaled by `v j`. -/
theorem expMap_vec_tangent (M : Matrix (Fin 8) (Fin 8) Cut) (v : Fin 8 → Cut) :
    Tendsto (fun t : Cut => t⁻¹ • (expMap (t • M) *ᵥ v - v))
      (𝓝[≠] (0 : Cut)) (𝓝 (M *ᵥ v)) := by
  rw [tendsto_pi_nhds]
  intro m
  have hlim : Tendsto
      (fun t : Cut => ∑ j, (t⁻¹ * (expMap (t • M) m j
          - (1 : Matrix (Fin 8) (Fin 8) Cut) m j)) * v j)
      (𝓝[≠] (0 : Cut)) (𝓝 (∑ j, M m j * v j)) := by
    apply tendsto_finset_sum
    intro j _
    exact (expMap_entry_tangent M m j).mul_const (v j)
  have htgt : (M *ᵥ v) m = ∑ j, M m j * v j := rfl
  rw [htgt]
  refine hlim.congr' ?_
  filter_upwards with t
  simp only [Pi.smul_apply, Pi.sub_apply, smul_eq_mul]
  rw [Matrix.mulVec, dotProduct]
  have hone : v m = ∑ j, (1 : Matrix (Fin 8) (Fin 8) Cut) m j * v j := by
    have h2 : ((1 : Matrix (Fin 8) (Fin 8) Cut) *ᵥ v) m = v m := by rw [Matrix.one_mulVec]
    rw [← h2, Matrix.mulVec, dotProduct]
  rw [hone, ← Finset.sum_sub_distrib, Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro j _
  ring

/-! ## THE TANGENT HALF over the non-associative `O Cut`. -/

/-- ★★ THE TANGENT HALF — `d/dt exp(tD)|₀ = D` over the DERIVED ℝ `ContinuumQ.Cut`. For a `Cut`-linear
    endomorphism `D'` of the non-associative 8-dim `*`-algebra `O Cut` and any `x`, the difference
    quotient of the one-parameter exponential flow `t ↦ expO ((t • D').restrictScalars ℤ) x` tends to
    `D' x` as `t → 0` in the punctured neighbourhood `𝓝[≠] 0` — the trunk-native `Tendsto` over the
    N34 order topology / N36 uniform structure, NOT Mathlib `HasDerivAt`/`NormedField`.

    PROOF (THE ONE LAW — reframe through the trunk): transport the whole statement through the N41d
    coordinate homeomorphism `coordOCut`. The intertwining `coordOCut_expO` + the homogeneity
    `derivMatrix_smul` rewrite `coordOCut (expO ((t • D')…) x) = expMap (t • derivMatrix D') *ᵥ
    coordOCut x`, reducing the difference quotient to the VECTOR matrix-exponential derivative
    `expMap_vec_tangent` (whose target is `derivMatrix D' *ᵥ coordOCut x = coordOCut (D' x)` by the
    `n = 1` power transport `expO_matrix_rep`); pulling back by the continuous `coordOCut.symm` returns
    `D' x`. The non-associativity NEVER enters — the derivative lives in the coordinate frame. -/
theorem expO_tangent (D' : Module.End Cut (O Cut)) (x : O Cut) :
    Tendsto (fun t : Cut => t⁻¹ • (expO ((t • D').restrictScalars ℤ) x - x))
      (𝓝[≠] (0 : Cut)) (𝓝 (D' x)) := by
  have himg : Tendsto (fun t : Cut => coordOCut (t⁻¹ • (expO ((t • D').restrictScalars ℤ) x - x)))
      (𝓝[≠] (0 : Cut)) (𝓝 (coordOCut (D' x))) := by
    have hrw : (fun t : Cut => coordOCut (t⁻¹ • (expO ((t • D').restrictScalars ℤ) x - x)))
        = (fun t : Cut => t⁻¹ • (expMap (t • derivMatrix D') *ᵥ coordOCut x - coordOCut x)) := by
      funext t
      rw [map_smul, map_sub, coordOCut_expO, derivMatrix_smul]
    rw [hrw]
    have htgt : coordOCut (D' x) = derivMatrix D' *ᵥ coordOCut x := by
      have h := expO_matrix_rep D' 1 x; simpa using h
    rw [htgt]
    exact expMap_vec_tangent (derivMatrix D') (coordOCut x)
  have hpull := (coordOCut_symm_continuous.tendsto (coordOCut (D' x))).comp himg
  simp only [Function.comp_def, LinearEquiv.symm_apply_apply] at hpull
  exact hpull

/-- NON-VACUITY (W8): the tangent map of the ZERO derivation's flow is the zero map — `d/dt exp(t·0)|₀
    = 0` — so the hypothesis class is inhabited and the statement is not vacuous. (The flow is constant
    `x`, its difference quotient identically `0`, tending to `(0 : Module.End Cut (O Cut)) x = 0`.) -/
theorem expO_tangent_zero (x : O Cut) :
    Tendsto (fun t : Cut => t⁻¹ • (expO ((t • (0 : Module.End Cut (O Cut))).restrictScalars ℤ) x - x))
      (𝓝[≠] (0 : Cut)) (𝓝 ((0 : Module.End Cut (O Cut)) x)) :=
  expO_tangent 0 x

end

end Phys.Algebra
