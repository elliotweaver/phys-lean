/-
  # N41d — THE CUT-SIDE COORDINATIZATION + THE UNCONDITIONAL SUMMABILITY of the `O Cut`
  #         vector exponential series (the AUTOMORPHISM GROUP, increment 11, part d) over
  #         the DERIVED ℝ `ContinuumQ.Cut`.

  N41c (`Phys/Algebra/DerivationOExp.lean`) banked the LITERAL `O Cut` vector exponential
  `expO D x := ∑' n, (1/n!)•(Dⁿ x)` and the product-preservation `expO D (x·y) = expO D x · expO D y`
  CONDITIONAL on three `Summable` premises (the two series + the product family). THIS file discharges
  the GATING dependency — the UNCONDITIONAL summability of the two vector-exponential series — by
  TRANSPORTING the banked N39 matrix operator-norm majorant (`expTerm_summable`) to `O Cut` through a
  Cut-side coordinatization.

  ★ THE ROUTE (trunk-native; NO ℝ-valued norm, NO `import Mathlib.Data.Real` as content).
    (1) `coordOCut : O Cut ≃ₗ[Cut] (Fin 8 → Cut)` — the Cut-side coordinate frame, the EXACT analogue
        of the banked ℚ-side `coordO`/`bO` (`![d0..d7]` of the nested `.re/.im` projections; the inverse
        the nested `Dbl`/`CD` constructor). MACHINERY on the DERIVED object (STANDARD §3). Both `coordOCut`
        and its inverse are CONTINUOUS over the N41b uniform topology (each component is a composition of
        the banked `CD.continuous_re/im` and `Dbl.continuous_re/im`).
    (2) `expO_matrix_rep` — for a `Cut`-linear endomorphism `D'` of `O Cut`, with `M` the coordinate
        matrix of `D'` (`toMatrix' (coordOCut.conjRingEquiv D')`), the endomorphism power transports to
        the matrix power: `coordOCut ((D'ⁿ) x) = Mⁿ *ᵥ (coordOCut x)` (via `map_pow` of the
        `toMatrixAlgEquiv'` AlgEquiv + `map_pow` of the `conjRingEquiv` ring-iso + `toMatrix'_mulVec`).
    (3) `expO_term_coord` — the `n`-th exponential term transports to the banked N39 matrix `expTerm`:
        `coordOCut ((1/n!)•((D'ⁿ) x)) = expTerm M n *ᵥ (coordOCut x)` (the `Cut`-scalar passes through the
        coordinate linear-equiv and the matrix `*ᵥ`).
    (4) `expO_summable` — THE UNCONDITIONAL summability: `Summable (fun n => (1/n!)•((D'ⁿ) x))`. The image
        under `coordOCut` is `fun n => expTerm M n *ᵥ (coordOCut x)`, summable because `expTerm M` is
        summable (banked N39 `expTerm_summable`, the operator-norm factorial majorant) and `(· *ᵥ v)` is a
        continuous additive map; transport back by the continuous `coordOCut.symm`. NO ℝ-valued norm — the
        majorant is the `Cut`-valued operator norm `opNorm`.

  ★ THE GENUINE HARD CORE, DISSOLVED THROUGH THE TRUNK (docs/STANDARD THE ONE LAW). The convergence of
  the octonion-valued exponential series is not bashed analytically over `O Cut` directly; it is reduced
  — by the Cut-side coordinate frame the same Born-positive structure provides — to the already-banked
  convergence of the matrix series, whose majorant is the `Cut`-valued operator norm `opNorm = ∑ᵢⱼ|Mᵢⱼ|`.
  The C6 eternal-approach (the factorial outruns `(opNorm M)ⁿ`) carries from the matrices to the vectors.

  ★ THE SETTING IS A `Cut`-LINEAR ENDOMORPHISM. The operator-norm majorant fundamentally requires the
  matrix representation, which requires `Cut`-linearity — exactly the Lie-algebra-of-the-Lie-group
  setting (the derivation algebra acts `Cut`-linearly on the `Cut`-vector-space `O Cut`). The `expO` of
  N41c is a `ℤ`-linear notion; a `Cut`-linear `D'` restricts to `D'.restrictScalars ℤ` with the same
  underlying powers, so the unconditional summability feeds N41c's `expO` verbatim.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2): delete "exp / derivation / automorphism / gauge / G₂ /
  colour": the file is a complete proof that the formal power series `∑ₙ (1/n!)•(Dⁿ x)` of a linear
  endomorphism `D` of the 8-dimensional complete-topological vector space over the completion of the
  gather of closures of the derived rationals is absolutely convergent — its convergence reduced through
  the coordinate frame to the convergence of the matrix series majorized by the coordinate operator norm.
  No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no posited exp/G₂/Aut/metric, NO
  Mathlib ℝ as content, NO ℝ-valued `Norm`, NO Mathlib `NormedSpace.exp`/`Matrix.exp`/`HasDerivAt`.
-/
import Phys.Algebra.DerivationOExp
import Phys.Algebra.DerivationAutExp
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.Topology.Algebra.InfiniteSum.Module
import Mathlib.Topology.Instances.Matrix

namespace Phys.Algebra

open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ Matrix
open scoped BigOperators

noncomputable section

attribute [local instance] CD.narCD CD.srCD

/-! ## The Cut-side coordinate frame `O Cut ≃ₗ[Cut] (Fin 8 → Cut)`. -/

/-- The 8 Cut-side coordinate functionals (the nested `.re/.im` projections), the analogue of the
    banked ℚ-side `c0..c7`. -/
def e0 (z : O Cut) : Cut := z.re.re.re
def e1 (z : O Cut) : Cut := z.re.re.im
def e2 (z : O Cut) : Cut := z.re.im.re
def e3 (z : O Cut) : Cut := z.re.im.im
def e4 (z : O Cut) : Cut := z.im.re.re
def e5 (z : O Cut) : Cut := z.im.re.im
def e6 (z : O Cut) : Cut := z.im.im.re
def e7 (z : O Cut) : Cut := z.im.im.im

/-- ★ THE CUT-SIDE COORDINATIZATION `O Cut ≃ₗ[Cut] (Fin 8 → Cut)` — the EXACT analogue of the banked
    ℚ-side `coordO`, now over the derived ℝ `Cut`. MACHINERY on the DERIVED object: the coordinate frame
    the vector exponential's summability is transported through. -/
def coordOCut : O Cut ≃ₗ[Cut] (Fin 8 → Cut) where
  toFun z := ![e0 z, e1 z, e2 z, e3 z, e4 z, e5 z, e6 z, e7 z]
  invFun v := ⟨⟨⟨v 0, v 1⟩, ⟨v 2, v 3⟩⟩, ⟨⟨v 4, v 5⟩, ⟨v 6, v 7⟩⟩⟩
  map_add' a b := by
    funext i; fin_cases i <;>
      simp [e0, e1, e2, e3, e4, e5, e6, e7, CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im]
  map_smul' q z := by
    funext i; fin_cases i <;>
      simp [e0, e1, e2, e3, e4, e5, e6, e7, CD.genSmul_re, CD.genSmul_im, Dbl.smul_re, Dbl.smul_im]
  left_inv z := by
    obtain ⟨⟨⟨a, b⟩, ⟨c, d⟩⟩, ⟨⟨f, g⟩, ⟨h, k⟩⟩⟩ := z; rfl
  right_inv v := by funext i; fin_cases i <;> simp [e0, e1, e2, e3, e4, e5, e6, e7]

/-- The Cut-side coordinatization is CONTINUOUS over the N41b uniform topology: each of the 8 coordinate
    components is a composition of the banked `CD.continuous_re/im` (`O Cut → H Cut → Dbl Cut`) and
    `Dbl.continuous_re/im` (`Dbl Cut → Cut`). -/
theorem coordOCut_continuous : Continuous (coordOCut : O Cut → (Fin 8 → Cut)) := by
  apply continuous_pi
  intro i
  have c_re : Continuous (CD.re : O Cut → H Cut) := CD.continuous_re
  have c_im : Continuous (CD.im : O Cut → H Cut) := CD.continuous_im
  have c_re2 : Continuous (CD.re : H Cut → Dbl Cut) := CD.continuous_re
  have c_im2 : Continuous (CD.im : H Cut → Dbl Cut) := CD.continuous_im
  have c_re3 : Continuous (Dbl.re : Dbl Cut → Cut) := Dbl.continuous_re
  have c_im3 : Continuous (Dbl.im : Dbl Cut → Cut) := Dbl.continuous_im
  fin_cases i <;>
    simp only [coordOCut, LinearEquiv.coe_mk, LinearMap.coe_mk, AddHom.coe_mk] <;>
    first
    | exact (c_re3.comp c_re2).comp c_re
    | exact (c_im3.comp c_re2).comp c_re
    | exact (c_re3.comp c_im2).comp c_re
    | exact (c_im3.comp c_im2).comp c_re
    | exact (c_re3.comp c_re2).comp c_im
    | exact (c_im3.comp c_re2).comp c_im
    | exact (c_re3.comp c_im2).comp c_im
    | exact (c_im3.comp c_im2).comp c_im

/-- The inverse coordinatization is CONTINUOUS: the nested `Dbl`/`CD` constructor of the 8 coordinate
    projections, each `continuous_apply`, assembled by the banked N41b `CD.continuous_mk`/`Dbl.continuous_mk`. -/
theorem coordOCut_symm_continuous : Continuous (coordOCut.symm : (Fin 8 → Cut) → O Cut) := by
  apply CD.continuous_mk
  · apply CD.continuous_mk
    · exact Dbl.continuous_mk _ _ (continuous_apply 0) (continuous_apply 1)
    · exact Dbl.continuous_mk _ _ (continuous_apply 2) (continuous_apply 3)
  · apply CD.continuous_mk
    · exact Dbl.continuous_mk _ _ (continuous_apply 4) (continuous_apply 5)
    · exact Dbl.continuous_mk _ _ (continuous_apply 6) (continuous_apply 7)

/-! ## The matrix representation of a `Cut`-linear endomorphism, and the power transport. -/

/-- The coordinate matrix of a `Cut`-linear endomorphism `D'` of `O Cut`: the `toMatrix'` of the
    conjugate `coordOCut.conjRingEquiv D' : Module.End Cut (Fin 8 → Cut)`. MACHINERY on the derived
    matrices. -/
def derivMatrix (D' : Module.End Cut (O Cut)) : Matrix (Fin 8) (Fin 8) Cut :=
  LinearMap.toMatrix' (LinearEquiv.conjRingEquiv coordOCut D')

/-- ★ THE POWER TRANSPORT: for a `Cut`-linear endomorphism `D'`, the `n`-th endomorphism power transports
    to the `n`-th coordinate-matrix power: `coordOCut ((D'ⁿ) x) = (derivMatrix D')ⁿ *ᵥ (coordOCut x)`.
    Via `map_pow` of the `LinearMap.toMatrixAlgEquiv'` algebra-iso (matrix power = matrix of endomorphism
    power), `LinearMap.toMatrix'_mulVec`, `map_pow` of the `conjRingEquiv` ring-iso, and
    `conjRingEquiv_apply_apply` (`conj e f y = e (f (e.symm y))`). -/
theorem expO_matrix_rep (D' : Module.End Cut (O Cut)) (n : ℕ) (x : O Cut) :
    coordOCut ((D' ^ n) x) = (derivMatrix D') ^ n *ᵥ (coordOCut x) := by
  unfold derivMatrix
  rw [show (LinearMap.toMatrix' (LinearEquiv.conjRingEquiv coordOCut D')) ^ n
        = LinearMap.toMatrix' ((LinearEquiv.conjRingEquiv coordOCut D') ^ n) by
      have h := map_pow (LinearMap.toMatrixAlgEquiv' (R := Cut) (n := Fin 8))
        (LinearEquiv.conjRingEquiv coordOCut D') n
      simpa [LinearMap.toMatrixAlgEquiv'] using h.symm]
  rw [LinearMap.toMatrix'_mulVec, (map_pow (LinearEquiv.conjRingEquiv coordOCut) D' n).symm,
    LinearEquiv.conjRingEquiv_apply_apply, LinearEquiv.symm_apply_apply]

/-- ★ THE EXPONENTIAL TERM TRANSPORT: the `n`-th vector-exponential term transports to the banked N39
    matrix exponential term: `coordOCut ((1/n!)•((D'ⁿ) x)) = expTerm (derivMatrix D') n *ᵥ (coordOCut x)`.
    The `Cut`-scalar `1/n!` passes through the coordinate linear-equiv (`map_smul`) and the matrix
    `*ᵥ` (`Matrix.smul_mulVec`); the power transports by `expO_matrix_rep`. -/
theorem expO_term_coord (D' : Module.End Cut (O Cut)) (n : ℕ) (x : O Cut) :
    coordOCut ((1 / (n.factorial : Cut)) • ((D' ^ n) x))
      = (expTerm (derivMatrix D') n) *ᵥ (coordOCut x) := by
  rw [map_smul, expO_matrix_rep]
  unfold expTerm
  rw [Matrix.smul_mulVec]

/-! ## The matrix-vector product as a continuous additive map (the summability transport vehicle). -/

/-- `(· *ᵥ v)` as an additive monoid homomorphism `Matrix (Fin 8) (Fin 8) Cut →+ (Fin 8 → Cut)` (matrix
    `*ᵥ` is additive in the matrix slot). -/
def mulVecHom (v : Fin 8 → Cut) : Matrix (Fin 8) (Fin 8) Cut →+ (Fin 8 → Cut) where
  toFun M := M *ᵥ v
  map_zero' := by simp
  map_add' A B := by ext i; simp [Matrix.add_mulVec]

theorem mulVecHom_continuous (v : Fin 8 → Cut) : Continuous (mulVecHom v) := by
  show Continuous (fun M : Matrix (Fin 8) (Fin 8) Cut => M *ᵥ v)
  exact continuous_id.matrix_mulVec continuous_const

/-! ## THE UNCONDITIONAL SUMMABILITY of the vector exponential series. -/

/-- ★★ THE UNCONDITIONAL SUMMABILITY: for a `Cut`-linear endomorphism `D'` of `O Cut`, the vector
    exponential series `n ↦ (1/n!)•((D'ⁿ) x)` is SUMMABLE — unconditionally, no convergence hypothesis.
    The image under the continuous coordinatization is `n ↦ expTerm (derivMatrix D') n *ᵥ (coordOCut x)`,
    summable because the matrix exponential series `expTerm (derivMatrix D')` is summable (banked N39
    `expTerm_summable`, the `Cut`-valued operator-norm factorial majorant) and `(· *ᵥ v)` is a continuous
    additive map; transport back by the continuous `coordOCut.symm`. THE genuine analytic hard core,
    dissolved through the trunk's coordinate frame — NO ℝ-valued norm. -/
theorem expO_summable (D' : Module.End Cut (O Cut)) (x : O Cut) :
    Summable (fun n => (1 / (n.factorial : Cut)) • ((D' ^ n) x)) := by
  -- The image under coordOCut is the matrix series applied to coordOCut x — summable.
  have himg : Summable (fun n => coordOCut ((1 / (n.factorial : Cut)) • ((D' ^ n) x))) := by
    have hmat : Summable (fun n => (mulVecHom (coordOCut x)) (expTerm (derivMatrix D') n)) :=
      (expTerm_summable (derivMatrix D')).map (mulVecHom (coordOCut x))
        (mulVecHom_continuous (coordOCut x))
    refine hmat.congr (fun n => ?_)
    rw [expO_term_coord]; rfl
  -- Transport back by the continuous inverse coordinatization.
  have hback : Summable (fun n =>
      coordOCut.symm (coordOCut ((1 / (n.factorial : Cut)) • ((D' ^ n) x)))) :=
    himg.map (coordOCut.symm.toLinearMap.toAddMonoidHom) coordOCut_symm_continuous
  simpa using hback

/-- The same series for the `ℤ`-linear restriction `D'.restrictScalars ℤ` (the form N41c's `expO`
    consumes): `(D'.restrictScalars ℤ ^ n) x = (D' ^ n) x` pointwise, so the unconditional summability
    transfers verbatim. -/
theorem expO_summable_restrict (D' : Module.End Cut (O Cut)) (x : O Cut) :
    Summable (fun n => (1 / (n.factorial : Cut)) • (((D'.restrictScalars ℤ) ^ n) x)) := by
  have hpow : ∀ (n : ℕ) (y : O Cut), ((D'.restrictScalars ℤ) ^ n) y = (D' ^ n) y := by
    intro n
    induction n with
    | zero => intro y; simp
    | succ k ih =>
        intro y
        rw [pow_succ, pow_succ]
        simp only [Module.End.mul_apply, LinearMap.restrictScalars_apply]
        rw [ih (D' y)]
  refine (expO_summable D' x).congr (fun n => ?_)
  rw [hpow n x]

/-! ## NON-VACUITY (W8): the summability is genuine on a nonzero endomorphism. -/

/-- NON-VACUITY: the vector exponential series of the IDENTITY endomorphism of `O Cut` converges — a
    concrete nonzero instance, witnessing that `expO_summable` is not vacuous on the zero endomorphism
    alone. -/
theorem expO_summable_one (x : O Cut) :
    Summable (fun n => (1 / (n.factorial : Cut)) • (((1 : Module.End Cut (O Cut)) ^ n) x)) :=
  expO_summable 1 x

end

end Phys.Algebra
