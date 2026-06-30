/-
  # N183 — THE 2ND-ORDER MATRIX/ENTRY/OPERATOR TANGENT of `exp` over the DERIVED ℝ `ContinuumQ.Cut`
  #         (lifting the scalar 2nd-order power-series derivative `cut_powerseries_deriv2` N182 to the
  #          matrix exponential, EXACTLY mirroring how N41g lifted the first-order `cut_powerseries_deriv`).

  N41g (`Phys/Algebra/DerivationOTangent.lean`) lifted the FIRST-order scalar power-series derivative
  `cut_powerseries_deriv` to the matrix exponential: `expMap_entry_tangent` (entrywise) →
  `expMap_vec_tangent` (vector) → `expO_tangent` (the operator form `d/dt exp(tD)|₀ = D` over the
  non-associative `O Cut`). All recover the FIRST-order coefficient `M` (resp. the derivation `D`).
  N182 (`Phys/Foundation/ContinuumScalarDeriv2.lean`) then banked the genuinely-unbanked analytic
  primitive — the SCALAR 2nd-order power-series derivative `cut_powerseries_deriv2`: for an entire
  `Cut`-valued series, the SECOND-order difference quotient `(t²)⁻¹·((∑' tⁿaₙ) − a₀ − t·a₁)` tends
  to the QUADRATIC coefficient `a₂`.

  ## The genuine W1 lift (the trunk makes it the SAME shape, one peel deeper)

  THIS file lifts `cut_powerseries_deriv2` to the matrix exponential, recovering the QUADRATIC
  coefficient `½•M² = expTerm M 2`, the genuine 2nd-order data the first-order tangent (coefficient `M`)
  cannot express:

      `(t²)⁻¹ • (expMap(t•M) − 1 − t•M)`   tends to   `½•M²`   as `t → 0` in `𝓝[≠] 0`,

  and transports it through the SAME N41d coordinate frame `coordOCut` to the operator form over the
  non-associative `O Cut`:

      `(t²)⁻¹ • (expO((t•D')…)x − x − t•(D' x))`   tends to   `½•(D'² x)`.

  ## The route (mirror the first-order proof N41g, one peel deeper)

    1. `expTerm_two_entry`        — the `n = 2` exponential term is `½•M²` entrywise (`2! = 2`).
    2. `expMap_entry_tangent2`    — THE HEART: `(t²)⁻¹·(expMap(t•M)_{ij} − 1_{ij} − t·M_{ij}) → expTerm M 2 i j`,
                                    EXACTLY `cut_powerseries_deriv2` applied to `a n := expTerm M n i j`
                                    (entire, `expTerm_entry_abs_summable`), whose `a₀ = 1_{ij}`, `a₁ = M_{ij}`,
                                    `a₂ = expTerm M 2 i j` (the `expMap_smul_entry` series identity, N41g).
    3. `expMap_smul_tangent2`     — the MATRIX form: `(t²)⁻¹ • (expMap(t•M) − 1 − t•M) → ½•M²`.
    4. `expMap_vec_tangent2`      — the VECTOR form, pushed through the continuous `mulVecHom v`
                                    (`(expMap(t•M) − 1 − t•M) *ᵥ v` by `sub_mulVec`/`one_mulVec`/`smul_mulVec`).
    5. `expO_tangent2` (★ THE THEOREM) — transport the vector statement back through the homeomorphism
                                    `coordOCut` (N41d), using `coordOCut_expO` + `derivMatrix_smul`
                                    (N41g) and the `n = 1` / `n = 2` power transport `expO_matrix_rep`
                                    (the target `½•(D'² x)` reads as `½•(derivMatrix D'² *ᵥ coordOCut x)`).

  ## The one cause (THE ONE LAW)

  The SAME C6 eternal-approach that built the derived ℝ, made its matrix-exponential series converge
  (N38/N39), gave the one-parameter subgroup (N40), the vector exponential and the FIRST-order tangent
  (N41d/N41g) now recovers the SECOND-order coefficient `½•D'²` — one engine, one more termination.
  The second-order tangent is not a new analytic posit; it is the same difference-quotient `Tendsto`,
  peeled one term deeper, transported through the same coordinate frame. The full 2-parameter group
  commutator `[exp(sD),exp(tE)] ≈ id + st·⁅D,E⁆` (deferred at N180/N181 as W9-HEAVY because its
  first-order part vanishes) now has its missing primitive — the quadratic coefficient — built.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2): delete "exp/derivation/automorphism/gauge/G₂/colour"
  → the pure statement that the SECOND-order difference quotient at `0` of the one-parameter flow
  `t ↦ ∑(tⁿ/n!)•(Dⁿ x)` of a linear endomorphism `D` of the 8-dim complete-topological vector space
  over the derived ℝ is `½•(D² x)` (the quadratic coefficient), a trunk-native `Tendsto`.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge, NO Mathlib
  number-system content import, NO ℝ-valued `Norm`, NO Mathlib `HasDerivAt`/`deriv`/`fderiv`/
  `NormedField`/`NormedSpace`/`Matrix.exp`/`NormedSpace.exp`.
-/
import Phys.Algebra.DerivationOTangent
import Phys.Foundation.ContinuumScalarDeriv2

namespace Phys.Algebra

open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ Matrix Filter
open scoped BigOperators Topology

noncomputable section

attribute [local instance] CD.narCD CD.srCD

/-! ## The quadratic exponential term. -/

/-- The `n = 2` exponential term is `½•M²` entrywise: `expTerm M 2 i j = (1/2)·(M²)_{ij}` (`2! = 2`).
    The quadratic (second-order) coefficient — the one the 2nd-order derivative recovers. -/
theorem expTerm_two_entry (M : Matrix (Fin 8) (Fin 8) Cut) (i j : Fin 8) :
    expTerm M 2 i j = (1 / 2 : Cut) * (M ^ 2) i j := by
  unfold expTerm
  simp [Nat.factorial, Matrix.smul_apply, smul_eq_mul]

/-! ## THE ENTRYWISE 2ND-ORDER MATRIX-EXPONENTIAL DERIVATIVE (the heart, = the scalar 2nd-order derivative). -/

/-- ★ THE HEART: `(t²)⁻¹·(expMap(t•M)_{ij} − 1_{ij} − t·M_{ij}) → expTerm M 2 i j` — the entrywise
    SECOND-order matrix-exponential derivative over the derived ℝ, a trunk-native `Tendsto`. EXACTLY
    the banked scalar 2nd-order power-series derivative `cut_powerseries_deriv2` (N182) applied to the
    entire coefficient sequence `a n := expTerm M n i j` (`expTerm_entry_abs_summable` N40), whose
    `a₀ = 1_{ij}` and `a₁ = M_{ij}` (cancel in the 2nd-order difference) and `a₂ = expTerm M 2 i j`
    (the limit). The series identity `expMap (t • M) i j = ∑' n, tⁿ · expTerm M n i j` is the banked
    `expMap_smul_entry` (N41g). -/
theorem expMap_entry_tangent2 (M : Matrix (Fin 8) (Fin 8) Cut) (i j : Fin 8) :
    Tendsto (fun t : Cut => (t ^ 2)⁻¹ *
        (expMap (t • M) i j - (1 : Matrix (Fin 8) (Fin 8) Cut) i j - t * M i j))
      (𝓝[≠] (0 : Cut)) (𝓝 (expTerm M 2 i j)) := by
  have hps := cut_powerseries_deriv2 (fun n => expTerm M n i j)
    (expTerm_entry_abs_summable M i j)
  refine hps.congr' ?_
  filter_upwards with t
  rw [expMap_smul_entry, expTerm_zero_entry, expTerm_one_entry]

/-! ## The matrix and vector 2nd-order tangents. -/

/-- THE MATRIX 2ND-ORDER TANGENT (the headline, matrix form): `(t²)⁻¹ • (expMap(t•M) − 1 − t•M) → ½•M²`
    as `t → 0`. Per-entry (`tendsto_pi_nhds`) it is `expMap_entry_tangent2`, whose limit `expTerm M 2 i j`
    equals the entry `(½•M²)_{ij}` by `expTerm_two_entry`. -/
theorem expMap_smul_tangent2 (M : Matrix (Fin 8) (Fin 8) Cut) :
    Tendsto (fun t : Cut => (t ^ 2)⁻¹ • (expMap (t • M) - 1 - t • M))
      (𝓝[≠] (0 : Cut)) (𝓝 ((1 / 2 : Cut) • M ^ 2)) := by
  refine tendsto_pi_nhds.mpr (fun i => tendsto_pi_nhds.mpr (fun j => ?_))
  have htgt : ((1 / 2 : Cut) • M ^ 2) i j = expTerm M 2 i j := by
    rw [expTerm_two_entry]; simp [Matrix.smul_apply, smul_eq_mul]
  rw [htgt]
  refine (expMap_entry_tangent2 M i j).congr' ?_
  filter_upwards with t
  simp only [Matrix.smul_apply, Matrix.sub_apply, smul_eq_mul]

/-- THE VECTOR 2ND-ORDER TANGENT: `(t²)⁻¹ • (expMap(t•M) *ᵥ v − v − t•(M *ᵥ v)) → ½•(M² *ᵥ v)`. Push
    the matrix form `expMap_smul_tangent2` through the continuous additive map `(· *ᵥ v)` (`mulVecHom`,
    N41d); the difference quotient distributes by `sub_mulVec`/`one_mulVec`/`smul_mulVec`. -/
theorem expMap_vec_tangent2 (M : Matrix (Fin 8) (Fin 8) Cut) (v : Fin 8 → Cut) :
    Tendsto (fun t : Cut => (t ^ 2)⁻¹ • (expMap (t • M) *ᵥ v - v - t • (M *ᵥ v)))
      (𝓝[≠] (0 : Cut)) (𝓝 ((1 / 2 : Cut) • (M ^ 2 *ᵥ v))) := by
  have h := ((mulVecHom_continuous v).tendsto ((1 / 2 : Cut) • M ^ 2)).comp
    (expMap_smul_tangent2 M)
  have htgt : mulVecHom v ((1 / 2 : Cut) • M ^ 2) = (1 / 2 : Cut) • (M ^ 2 *ᵥ v) := by
    show ((1 / 2 : Cut) • M ^ 2) *ᵥ v = (1 / 2 : Cut) • (M ^ 2 *ᵥ v)
    rw [Matrix.smul_mulVec]
  rw [htgt] at h
  refine h.congr' ?_
  filter_upwards with t
  show ((t ^ 2)⁻¹ • (expMap (t • M) - 1 - t • M)) *ᵥ v
      = (t ^ 2)⁻¹ • (expMap (t • M) *ᵥ v - v - t • (M *ᵥ v))
  rw [Matrix.smul_mulVec, Matrix.sub_mulVec, Matrix.sub_mulVec, Matrix.one_mulVec,
    Matrix.smul_mulVec]

/-! ## THE 2ND-ORDER TANGENT over the non-associative `O Cut`. -/

/-- ★★ THE 2ND-ORDER TANGENT — `d²/dt²-coefficient: (t²)⁻¹•(expO((t•D')…)x − x − t•(D' x)) → ½•(D'² x)`
    over the DERIVED ℝ `ContinuumQ.Cut`. For a `Cut`-linear endomorphism `D'` of the non-associative
    8-dim `*`-algebra `O Cut` and any `x`, the SECOND-order difference quotient of the one-parameter
    exponential flow `t ↦ expO ((t • D').restrictScalars ℤ) x` tends to `½•(D'² x)` as `t → 0` in the
    punctured neighbourhood `𝓝[≠] 0` — the trunk-native `Tendsto`, NOT Mathlib `HasDerivAt`/`NormedField`.
    The QUADRATIC coefficient, the genuine 2nd-order data the first-order tangent `expO_tangent` (N41g)
    cannot express.

    PROOF (THE ONE LAW — reframe through the trunk, the SAME transport as N41g): transport the whole
    statement through the N41d coordinate homeomorphism `coordOCut`. The intertwining `coordOCut_expO`
    + the homogeneity `derivMatrix_smul` (N41g) + the `n = 1` power transport `expO_matrix_rep D' 1 x`
    (`coordOCut (D' x) = derivMatrix D' *ᵥ coordOCut x`) rewrite the 2nd-order difference quotient to
    the VECTOR 2nd-order matrix-exponential derivative `expMap_vec_tangent2`, whose target
    `½•(derivMatrix D'² *ᵥ coordOCut x)` equals `coordOCut (½•(D'² x))` by `expO_matrix_rep D' 2 x`;
    pulling back by the continuous `coordOCut.symm` returns `½•(D'² x)`. Non-associativity NEVER enters. -/
theorem expO_tangent2 (D' : Module.End Cut (O Cut)) (x : O Cut) :
    Tendsto (fun t : Cut => (t ^ 2)⁻¹ • (expO ((t • D').restrictScalars ℤ) x - x - t • (D' x)))
      (𝓝[≠] (0 : Cut)) (𝓝 ((1 / 2 : Cut) • ((D' ^ 2) x))) := by
  have hDx : coordOCut (D' x) = derivMatrix D' *ᵥ coordOCut x := by
    have h := expO_matrix_rep D' 1 x; simpa using h
  have himg : Tendsto
      (fun t : Cut => coordOCut ((t ^ 2)⁻¹ • (expO ((t • D').restrictScalars ℤ) x - x - t • (D' x))))
      (𝓝[≠] (0 : Cut)) (𝓝 (coordOCut ((1 / 2 : Cut) • ((D' ^ 2) x)))) := by
    have hrw : (fun t : Cut => coordOCut ((t ^ 2)⁻¹ •
            (expO ((t • D').restrictScalars ℤ) x - x - t • (D' x))))
        = (fun t : Cut => (t ^ 2)⁻¹ • (expMap (t • derivMatrix D') *ᵥ coordOCut x
            - coordOCut x - t • (derivMatrix D' *ᵥ coordOCut x))) := by
      funext t
      rw [map_smul, map_sub, map_sub, map_smul, coordOCut_expO, derivMatrix_smul, hDx]
    rw [hrw]
    have htgt : coordOCut ((1 / 2 : Cut) • ((D' ^ 2) x))
        = (1 / 2 : Cut) • (derivMatrix D' ^ 2 *ᵥ coordOCut x) := by
      rw [map_smul, expO_matrix_rep D' 2 x]
    rw [htgt]
    exact expMap_vec_tangent2 (derivMatrix D') (coordOCut x)
  have hpull := (coordOCut_symm_continuous.tendsto
    (coordOCut ((1 / 2 : Cut) • ((D' ^ 2) x)))).comp himg
  simp only [Function.comp_def, LinearEquiv.symm_apply_apply] at hpull
  exact hpull

/-- NON-VACUITY (W8, hypothesis-class inhabited): the 2nd-order tangent of the ZERO derivation's flow
    is the zero map — `½•(0² x) = 0` — so the statement is not vacuously quantified. -/
theorem expO_tangent2_zero (x : O Cut) :
    Tendsto (fun t : Cut => (t ^ 2)⁻¹ • (expO ((t • (0 : Module.End Cut (O Cut))).restrictScalars ℤ) x
        - x - t • ((0 : Module.End Cut (O Cut)) x)))
      (𝓝[≠] (0 : Cut)) (𝓝 ((1 / 2 : Cut) • (((0 : Module.End Cut (O Cut)) ^ 2) x))) :=
  expO_tangent2 0 x

/-! ## W8 non-vacuity: a witness whose 2ND-ORDER coefficient is GENUINELY non-trivial. -/

/-- A concrete `8 × 8` matrix over `Cut` whose SQUARE has a nonzero `(0,0)` entry: `cwM := single 0 1 1
    + single 1 0 2`, so `(cwM²)_{00} = cwM_{01}·cwM_{10} = 1·2 = 2`. -/
def cwM : Matrix (Fin 8) (Fin 8) Cut := Matrix.single 0 1 1 + Matrix.single 1 0 2

/-- ★ W8 NON-VACUITY: the witness 2ND-order coefficient `expTerm cwM 2 0 0 = ½·(cwM²)_{00} = 1` is
    GENUINELY non-trivial 2nd-order data — DISTINCT from the witness FIRST-order coefficient
    `cwM 0 0 = 0` (`cwM_first_coeff`). So `expO_tangent2`/`expMap_smul_tangent2` recover genuine
    quadratic data the first-order tangent CANNOT express (it would see `cwM 0 0 = 0`), NOT a vacuous
    `0 = 0` restatement of the first-order content. -/
theorem cwM_second_coeff : expTerm cwM 2 0 0 = (1 : Cut) := by
  unfold expTerm cwM
  simp only [Nat.factorial, Matrix.smul_apply, smul_eq_mul, pow_two, Matrix.mul_apply,
    Matrix.add_apply, Matrix.single, Matrix.of_apply]
  norm_num [Finset.sum_add_distrib, Finset.sum_ite_eq, Finset.sum_ite_eq', Fin.sum_univ_succ]

/-- The witness FIRST-order coefficient `cwM 0 0 = 0`, distinct from the 2nd-order coefficient `1`
    (`cwM_second_coeff`) — confirming `expO_tangent2` recovers genuine 2nd-order data. -/
theorem cwM_first_coeff : cwM 0 0 = (0 : Cut) := by
  unfold cwM
  simp [Matrix.single, Matrix.add_apply, Matrix.of_apply]

end

end Phys.Algebra
