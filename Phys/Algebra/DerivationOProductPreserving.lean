/-
  # N41e — THE LITERAL `O Cut` ALGEBRA-AUTOMORPHISM PRODUCT-PRESERVATION, UNCONDITIONAL

  This file completes the LITERAL product-preservation of the octonion vector exponential over the
  DERIVED ℝ `Phys.Foundation.ContinuumQ.Cut`, discharging the three summability premises of the
  banked N41c conditional `expO_mul_of_summable` to the UNCONDITIONAL

      `expO D (x · y) = expO D x · expO D y`     (with `D = D'.restrictScalars ℤ`)

  for a `Cut`-linear endomorphism `D'` whose `ℤ`-restriction is a Leibniz derivation.

  ## The genuine hard core: the `hxy` octonion-PRODUCT-family summability

  The third premise of `expO_mul_of_summable` is the summability of the product family
  `(k,l) ↦ ((1/k!)•Dᵏx) · ((1/l!)•Dˡy)` over the OCTONION product `·` in `O Cut`. The N41d
  coordinatization `coordOCut : O Cut ≃ₗ[Cut] (Fin 8 → Cut)` is `Cut`-LINEAR but NOT multiplicative,
  so the matrix-transport route that banked `expO_summable` (the single-variable series) does NOT
  apply verbatim. The dissolution (THE ONE LAW — reframe through the trunk, do not bash the
  non-associative product): each product coordinate `coordOCut (a·b) m` is a FINITE SIGNED SUM of
  `(coordOCut a) i · (coordOCut b) j` — the octonion multiplication, expanded once and for all via
  the banked `@[simp]` Cayley–Dickson / doubling `mul_re`/`mul_im`/`add_*`/`neg_*`/`star_*` (all
  `rfl`) followed by `ring`. Each leaf `(k,l) ↦ (coordOCut (a k)) i · (coordOCut (b l)) j` is summable
  over `ℕ × ℕ` by the banked `cut_summable_mul_of_abs` (the two coordinate sequences are absolutely
  summable: `oCut_term_abs_summable`, the entrywise factorial majorant `expTerm_entry_abs_summable`
  transported through `expO_term_coord`). The whole coordinate is a `Summable.add`/`.sub` of the
  eight leaves; `Pi.summable` assembles the eight coordinates and the continuous `coordOCut.symm`
  transports back to `O Cut`. NO ℝ-valued norm, NO structure-constant table, NO new analysis — the
  same coordinate frame N41d built.

  ## What is consumed (all banked, foundations-only)

  * N41d `coordOCut` / `coordOCut_symm_continuous` / `expO_term_coord` / `derivMatrix`;
  * N41d `expO_summable_restrict` (the two single-variable premises `hx`/`hy`, unconditional);
  * N41c `expO` / `expO_mul_of_summable` (the conditional Cauchy-product integration) / `IsDeriv`;
  * N40 `expTerm_entry_abs_summable` (the matrix-entry factorial majorant);
  * `ContinuumSummable` `cut_summable_mul_of_abs` / `cut_summable_of_nonneg_of_le` over the derived ℝ.

  No theorem STATEMENT needs a physics word. Physics-words-removable: delete
  "exp/derivation/automorphism" → `expO_mul` remains a complete proof that the convergent power
  series `∑(1/n!)•Dⁿ` of a Leibniz endomorphism of the 8-dim non-associative complete-topological
  *-algebra over the derived ℝ preserves the product unconditionally (an algebra endomorphism).

  Owed to the chain tail (childed): the BIJECTION (inverse `expO (-D)`, the Cut-side
  `≃ₗ[Cut]`/`IsAlgAut` automorphism) and the derivative `d/dt exp(tD)|₀ = D` (a trunk-native
  `Tendsto` over the N36 uniform structure). Both rest on this unconditional product law.

  Not a posited exp/G₂/Aut, not Mathlib ℝ as content, not an ℝ-valued Norm, not Mathlib
  `HasDerivAt`/`NormedField`, not a bridge.
-/
import Phys.Algebra.DerivationOExp
import Phys.Algebra.DerivationOExpSummable
import Phys.Algebra.DerivationAutExpHom

namespace Phys.Algebra
open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ Matrix
open scoped BigOperators
noncomputable section
attribute [local instance] CD.narCD CD.srCD

/-! ## Building block: each coordinate sequence of the vector-exp terms is absolutely summable. -/

/-- Each coordinate sequence `k ↦ (coordOCut ((1/k!)•(D'ᵏ x))) i` is ABSOLUTELY summable: its
    coordinate image is `(expTerm (derivMatrix D') k *ᵥ coordOCut x) i = ∑_p (expTerm M k) i p · (coordOCut x) p`
    (banked `expO_term_coord`), a finite `Cut`-combination of the banked N40 entrywise factorial
    majorants `expTerm_entry_abs_summable`; comparison (`cut_summable_of_nonneg_of_le`) over the
    abs-triangle bound closes it. NO ℝ-valued norm. -/
theorem oCut_term_abs_summable (D' : Module.End Cut (O Cut)) (x : O Cut) (i : Fin 8) :
    Summable (fun k => |(coordOCut ((1 / (k.factorial : Cut)) • ((D' ^ k) x))) i|) := by
  have hrw : (fun k => |(coordOCut ((1 / (k.factorial : Cut)) • ((D' ^ k) x))) i|)
      = (fun k => |∑ p, (expTerm (derivMatrix D') k) i p * (coordOCut x) p|) := by
    funext k; rw [expO_term_coord, Matrix.mulVec]; rfl
  rw [hrw]
  apply cut_summable_of_nonneg_of_le (fun k => abs_nonneg _)
    (g := fun k => ∑ p, |(expTerm (derivMatrix D') k) i p| * |(coordOCut x) p|)
  · intro k
    calc |∑ p, (expTerm (derivMatrix D') k) i p * (coordOCut x) p|
        ≤ ∑ p, |(expTerm (derivMatrix D') k) i p * (coordOCut x) p| := Finset.abs_sum_le_sum_abs _ _
      _ = ∑ p, |(expTerm (derivMatrix D') k) i p| * |(coordOCut x) p| := by
          apply Finset.sum_congr rfl; intro p _; rw [abs_mul]
  · apply summable_sum
    intro p _
    exact (expTerm_entry_abs_summable (derivMatrix D') i p).mul_right _

/-- The `ℤ`-restriction power equals the `Cut`-power pointwise: `(D'.restrictScalars ℤ ^ n) y = (D' ^ n) y`. -/
theorem restrictScalars_pow_apply (D' : Module.End Cut (O Cut)) (n : ℕ) (y : O Cut) :
    ((D'.restrictScalars ℤ) ^ n) y = (D' ^ n) y := by
  induction n generalizing y with
  | zero => simp
  | succ k ih =>
      rw [pow_succ, pow_succ]
      simp only [Module.End.mul_apply, LinearMap.restrictScalars_apply]
      rw [ih (D' y)]

/-! ## The genuine hard core: the octonion product family is summable. -/

/-- The leaf: a product of two coordinate-projection sequences is summable over `ℕ × ℕ`. -/
theorem oCut_prod_leaf (a b : ℕ → O Cut)
    (ha : ∀ i, Summable (fun k => |(coordOCut (a k)) i|))
    (hb : ∀ j, Summable (fun l => |(coordOCut (b l)) j|)) (i j : Fin 8) :
    Summable (fun kl : ℕ × ℕ => (coordOCut (a kl.1)) i * (coordOCut (b kl.2)) j) :=
  cut_summable_mul_of_abs (f := fun k => (coordOCut (a k)) i) (g := fun l => (coordOCut (b l)) j)
    (ha i) (hb j)

set_option linter.unusedSimpArgs false in
/-- THE OCTONION PRODUCT FAMILY IS SUMMABLE: if the coordinate sequences of `a` and `b` are
    absolutely summable, the family `(k,l) ↦ a k · b l` over the octonion product is summable.
    The genuine hard core, dissolved through the trunk's coordinate frame: each product coordinate
    `coordOCut (a·b) m` is a finite signed sum of `(coordOCut a) i · (coordOCut b) j`
    (the octonion multiplication, expanded via the banked CD/Dbl `mul_re`/`mul_im` + `ring`), so each
    is a `Summable.add`/`sub` of the `oCut_prod_leaf` leaves; `Pi.summable` + the continuous
    `coordOCut.symm` transports back to `O Cut`. NO ℝ-valued norm, NO structure-constant table. -/
theorem oCut_prod_summable (a b : ℕ → O Cut)
    (ha : ∀ i, Summable (fun k => |(coordOCut (a k)) i|))
    (hb : ∀ j, Summable (fun l => |(coordOCut (b l)) j|)) :
    Summable (fun kl : ℕ × ℕ => a kl.1 * b kl.2) := by
  have himg : Summable (fun kl : ℕ × ℕ => coordOCut (a kl.1 * b kl.2)) := by
    rw [Pi.summable]
    intro m
    fin_cases m
    · -- m = 0
      show Summable (fun kl : ℕ × ℕ => coordOCut (a kl.1 * b kl.2) 0)
      have hrw : (fun kl : ℕ × ℕ => coordOCut (a kl.1 * b kl.2) 0)
          = (fun kl : ℕ × ℕ => (coordOCut (a kl.1)) 0*(coordOCut (b kl.2)) 0 - (coordOCut (a kl.1)) 1*(coordOCut (b kl.2)) 1 - (coordOCut (a kl.1)) 2*(coordOCut (b kl.2)) 2 - (coordOCut (a kl.1)) 3*(coordOCut (b kl.2)) 3 - (coordOCut (a kl.1)) 4*(coordOCut (b kl.2)) 4 - (coordOCut (a kl.1)) 5*(coordOCut (b kl.2)) 5 - (coordOCut (a kl.1)) 6*(coordOCut (b kl.2)) 6 - (coordOCut (a kl.1)) 7*(coordOCut (b kl.2)) 7) := by
        funext kl
        simp only [coordOCut, LinearEquiv.coe_mk, LinearMap.coe_mk, AddHom.coe_mk,
          Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val,
          Matrix.cons_val_fin_one, e0, e1, e2, e3, e4, e5, e6, e7,
          CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
          CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im,
          Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im']; ring
      rw [hrw]
      exact (((((((oCut_prod_leaf a b ha hb 0 0).sub (oCut_prod_leaf a b ha hb 1 1)).sub (oCut_prod_leaf a b ha hb 2 2)).sub (oCut_prod_leaf a b ha hb 3 3)).sub (oCut_prod_leaf a b ha hb 4 4)).sub (oCut_prod_leaf a b ha hb 5 5)).sub (oCut_prod_leaf a b ha hb 6 6)).sub (oCut_prod_leaf a b ha hb 7 7)
    · -- m = 1
      show Summable (fun kl : ℕ × ℕ => coordOCut (a kl.1 * b kl.2) 1)
      have hrw : (fun kl : ℕ × ℕ => coordOCut (a kl.1 * b kl.2) 1)
          = (fun kl : ℕ × ℕ => (coordOCut (a kl.1)) 0*(coordOCut (b kl.2)) 1 + (coordOCut (a kl.1)) 1*(coordOCut (b kl.2)) 0 + (coordOCut (a kl.1)) 2*(coordOCut (b kl.2)) 3 - (coordOCut (a kl.1)) 3*(coordOCut (b kl.2)) 2 + (coordOCut (a kl.1)) 4*(coordOCut (b kl.2)) 5 - (coordOCut (a kl.1)) 5*(coordOCut (b kl.2)) 4 - (coordOCut (a kl.1)) 6*(coordOCut (b kl.2)) 7 + (coordOCut (a kl.1)) 7*(coordOCut (b kl.2)) 6) := by
        funext kl
        simp only [coordOCut, LinearEquiv.coe_mk, LinearMap.coe_mk, AddHom.coe_mk,
          Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val,
          Matrix.cons_val_fin_one, e0, e1, e2, e3, e4, e5, e6, e7,
          CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
          CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im,
          Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im']; ring
      rw [hrw]
      exact (((((((oCut_prod_leaf a b ha hb 0 1).add (oCut_prod_leaf a b ha hb 1 0)).add (oCut_prod_leaf a b ha hb 2 3)).sub (oCut_prod_leaf a b ha hb 3 2)).add (oCut_prod_leaf a b ha hb 4 5)).sub (oCut_prod_leaf a b ha hb 5 4)).sub (oCut_prod_leaf a b ha hb 6 7)).add (oCut_prod_leaf a b ha hb 7 6)
    · -- m = 2
      show Summable (fun kl : ℕ × ℕ => coordOCut (a kl.1 * b kl.2) 2)
      have hrw : (fun kl : ℕ × ℕ => coordOCut (a kl.1 * b kl.2) 2)
          = (fun kl : ℕ × ℕ => (coordOCut (a kl.1)) 0*(coordOCut (b kl.2)) 2 - (coordOCut (a kl.1)) 1*(coordOCut (b kl.2)) 3 + (coordOCut (a kl.1)) 2*(coordOCut (b kl.2)) 0 + (coordOCut (a kl.1)) 3*(coordOCut (b kl.2)) 1 + (coordOCut (a kl.1)) 4*(coordOCut (b kl.2)) 6 + (coordOCut (a kl.1)) 5*(coordOCut (b kl.2)) 7 - (coordOCut (a kl.1)) 6*(coordOCut (b kl.2)) 4 - (coordOCut (a kl.1)) 7*(coordOCut (b kl.2)) 5) := by
        funext kl
        simp only [coordOCut, LinearEquiv.coe_mk, LinearMap.coe_mk, AddHom.coe_mk,
          Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val,
          Matrix.cons_val_fin_one, e0, e1, e2, e3, e4, e5, e6, e7,
          CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
          CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im,
          Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im']; ring
      rw [hrw]
      exact (((((((oCut_prod_leaf a b ha hb 0 2).sub (oCut_prod_leaf a b ha hb 1 3)).add (oCut_prod_leaf a b ha hb 2 0)).add (oCut_prod_leaf a b ha hb 3 1)).add (oCut_prod_leaf a b ha hb 4 6)).add (oCut_prod_leaf a b ha hb 5 7)).sub (oCut_prod_leaf a b ha hb 6 4)).sub (oCut_prod_leaf a b ha hb 7 5)
    · -- m = 3
      show Summable (fun kl : ℕ × ℕ => coordOCut (a kl.1 * b kl.2) 3)
      have hrw : (fun kl : ℕ × ℕ => coordOCut (a kl.1 * b kl.2) 3)
          = (fun kl : ℕ × ℕ => (coordOCut (a kl.1)) 0*(coordOCut (b kl.2)) 3 + (coordOCut (a kl.1)) 1*(coordOCut (b kl.2)) 2 - (coordOCut (a kl.1)) 2*(coordOCut (b kl.2)) 1 + (coordOCut (a kl.1)) 3*(coordOCut (b kl.2)) 0 + (coordOCut (a kl.1)) 4*(coordOCut (b kl.2)) 7 - (coordOCut (a kl.1)) 5*(coordOCut (b kl.2)) 6 + (coordOCut (a kl.1)) 6*(coordOCut (b kl.2)) 5 - (coordOCut (a kl.1)) 7*(coordOCut (b kl.2)) 4) := by
        funext kl
        simp only [coordOCut, LinearEquiv.coe_mk, LinearMap.coe_mk, AddHom.coe_mk,
          Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val,
          Matrix.cons_val_fin_one, e0, e1, e2, e3, e4, e5, e6, e7,
          CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
          CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im,
          Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im']; ring
      rw [hrw]
      exact (((((((oCut_prod_leaf a b ha hb 0 3).add (oCut_prod_leaf a b ha hb 1 2)).sub (oCut_prod_leaf a b ha hb 2 1)).add (oCut_prod_leaf a b ha hb 3 0)).add (oCut_prod_leaf a b ha hb 4 7)).sub (oCut_prod_leaf a b ha hb 5 6)).add (oCut_prod_leaf a b ha hb 6 5)).sub (oCut_prod_leaf a b ha hb 7 4)
    · -- m = 4
      show Summable (fun kl : ℕ × ℕ => coordOCut (a kl.1 * b kl.2) 4)
      have hrw : (fun kl : ℕ × ℕ => coordOCut (a kl.1 * b kl.2) 4)
          = (fun kl : ℕ × ℕ => (coordOCut (a kl.1)) 0*(coordOCut (b kl.2)) 4 - (coordOCut (a kl.1)) 1*(coordOCut (b kl.2)) 5 - (coordOCut (a kl.1)) 2*(coordOCut (b kl.2)) 6 - (coordOCut (a kl.1)) 3*(coordOCut (b kl.2)) 7 + (coordOCut (a kl.1)) 4*(coordOCut (b kl.2)) 0 + (coordOCut (a kl.1)) 5*(coordOCut (b kl.2)) 1 + (coordOCut (a kl.1)) 6*(coordOCut (b kl.2)) 2 + (coordOCut (a kl.1)) 7*(coordOCut (b kl.2)) 3) := by
        funext kl
        simp only [coordOCut, LinearEquiv.coe_mk, LinearMap.coe_mk, AddHom.coe_mk,
          Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val,
          Matrix.cons_val_fin_one, e0, e1, e2, e3, e4, e5, e6, e7,
          CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
          CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im,
          Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im']; ring
      rw [hrw]
      exact (((((((oCut_prod_leaf a b ha hb 0 4).sub (oCut_prod_leaf a b ha hb 1 5)).sub (oCut_prod_leaf a b ha hb 2 6)).sub (oCut_prod_leaf a b ha hb 3 7)).add (oCut_prod_leaf a b ha hb 4 0)).add (oCut_prod_leaf a b ha hb 5 1)).add (oCut_prod_leaf a b ha hb 6 2)).add (oCut_prod_leaf a b ha hb 7 3)
    · -- m = 5
      show Summable (fun kl : ℕ × ℕ => coordOCut (a kl.1 * b kl.2) 5)
      have hrw : (fun kl : ℕ × ℕ => coordOCut (a kl.1 * b kl.2) 5)
          = (fun kl : ℕ × ℕ => (coordOCut (a kl.1)) 0*(coordOCut (b kl.2)) 5 + (coordOCut (a kl.1)) 1*(coordOCut (b kl.2)) 4 - (coordOCut (a kl.1)) 2*(coordOCut (b kl.2)) 7 + (coordOCut (a kl.1)) 3*(coordOCut (b kl.2)) 6 - (coordOCut (a kl.1)) 4*(coordOCut (b kl.2)) 1 + (coordOCut (a kl.1)) 5*(coordOCut (b kl.2)) 0 - (coordOCut (a kl.1)) 6*(coordOCut (b kl.2)) 3 + (coordOCut (a kl.1)) 7*(coordOCut (b kl.2)) 2) := by
        funext kl
        simp only [coordOCut, LinearEquiv.coe_mk, LinearMap.coe_mk, AddHom.coe_mk,
          Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val,
          Matrix.cons_val_fin_one, e0, e1, e2, e3, e4, e5, e6, e7,
          CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
          CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im,
          Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im']; ring
      rw [hrw]
      exact (((((((oCut_prod_leaf a b ha hb 0 5).add (oCut_prod_leaf a b ha hb 1 4)).sub (oCut_prod_leaf a b ha hb 2 7)).add (oCut_prod_leaf a b ha hb 3 6)).sub (oCut_prod_leaf a b ha hb 4 1)).add (oCut_prod_leaf a b ha hb 5 0)).sub (oCut_prod_leaf a b ha hb 6 3)).add (oCut_prod_leaf a b ha hb 7 2)
    · -- m = 6
      show Summable (fun kl : ℕ × ℕ => coordOCut (a kl.1 * b kl.2) 6)
      have hrw : (fun kl : ℕ × ℕ => coordOCut (a kl.1 * b kl.2) 6)
          = (fun kl : ℕ × ℕ => (coordOCut (a kl.1)) 0*(coordOCut (b kl.2)) 6 + (coordOCut (a kl.1)) 1*(coordOCut (b kl.2)) 7 + (coordOCut (a kl.1)) 2*(coordOCut (b kl.2)) 4 - (coordOCut (a kl.1)) 3*(coordOCut (b kl.2)) 5 - (coordOCut (a kl.1)) 4*(coordOCut (b kl.2)) 2 + (coordOCut (a kl.1)) 5*(coordOCut (b kl.2)) 3 + (coordOCut (a kl.1)) 6*(coordOCut (b kl.2)) 0 - (coordOCut (a kl.1)) 7*(coordOCut (b kl.2)) 1) := by
        funext kl
        simp only [coordOCut, LinearEquiv.coe_mk, LinearMap.coe_mk, AddHom.coe_mk,
          Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val,
          Matrix.cons_val_fin_one, e0, e1, e2, e3, e4, e5, e6, e7,
          CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
          CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im,
          Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im']; ring
      rw [hrw]
      exact (((((((oCut_prod_leaf a b ha hb 0 6).add (oCut_prod_leaf a b ha hb 1 7)).add (oCut_prod_leaf a b ha hb 2 4)).sub (oCut_prod_leaf a b ha hb 3 5)).sub (oCut_prod_leaf a b ha hb 4 2)).add (oCut_prod_leaf a b ha hb 5 3)).add (oCut_prod_leaf a b ha hb 6 0)).sub (oCut_prod_leaf a b ha hb 7 1)
    · -- m = 7
      show Summable (fun kl : ℕ × ℕ => coordOCut (a kl.1 * b kl.2) 7)
      have hrw : (fun kl : ℕ × ℕ => coordOCut (a kl.1 * b kl.2) 7)
          = (fun kl : ℕ × ℕ => (coordOCut (a kl.1)) 0*(coordOCut (b kl.2)) 7 - (coordOCut (a kl.1)) 1*(coordOCut (b kl.2)) 6 + (coordOCut (a kl.1)) 2*(coordOCut (b kl.2)) 5 + (coordOCut (a kl.1)) 3*(coordOCut (b kl.2)) 4 - (coordOCut (a kl.1)) 4*(coordOCut (b kl.2)) 3 - (coordOCut (a kl.1)) 5*(coordOCut (b kl.2)) 2 + (coordOCut (a kl.1)) 6*(coordOCut (b kl.2)) 1 + (coordOCut (a kl.1)) 7*(coordOCut (b kl.2)) 0) := by
        funext kl
        simp only [coordOCut, LinearEquiv.coe_mk, LinearMap.coe_mk, AddHom.coe_mk,
          Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val,
          Matrix.cons_val_fin_one, e0, e1, e2, e3, e4, e5, e6, e7,
          CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
          CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im,
          Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im']; ring
      rw [hrw]
      exact (((((((oCut_prod_leaf a b ha hb 0 7).sub (oCut_prod_leaf a b ha hb 1 6)).add (oCut_prod_leaf a b ha hb 2 5)).add (oCut_prod_leaf a b ha hb 3 4)).sub (oCut_prod_leaf a b ha hb 4 3)).sub (oCut_prod_leaf a b ha hb 5 2)).add (oCut_prod_leaf a b ha hb 6 1)).add (oCut_prod_leaf a b ha hb 7 0)

  have hback := himg.map (coordOCut.symm.toLinearMap.toAddMonoidHom) coordOCut_symm_continuous
  simpa using hback

/-! ## DISCHARGE: the UNCONDITIONAL literal product-preservation. -/

/-- THE LITERAL `O Cut` ALGEBRA-AUTOMORPHISM PRODUCT-PRESERVATION, UNCONDITIONAL: for a
    `Cut`-linear endomorphism `D'` of `O Cut` whose `ℤ`-restriction is a Leibniz derivation, the
    vector exponential `expO` PRESERVES the octonion product, `expO D (x·y) = expO D x · expO D y`
    with `D = D'.restrictScalars ℤ` — with NO summability hypotheses (the three premises of the
    banked conditional `expO_mul_of_summable` are discharged here: `hx`/`hy` by the banked
    unconditional `expO_summable_restrict`, and the product family `hxy` by `oCut_prod_summable`).
    The only remaining hypothesis is the Leibniz law itself, the defining property of the class of
    maps the theorem is about. Physics-words-removable: delete "exp/derivation/automorphism" → the
    convergent power series `∑(1/n!)•Dⁿ` of a Leibniz endomorphism of the 8-dim non-associative
    complete-topological *-algebra over the derived ℝ preserves the product. -/
theorem expO_mul (D' : Module.End Cut (O Cut)) (hD : IsDeriv (D'.restrictScalars ℤ)) (x y : O Cut) :
    expO (D'.restrictScalars ℤ) (x * y)
      = expO (D'.restrictScalars ℤ) x * expO (D'.restrictScalars ℤ) y := by
  apply expO_mul_of_summable (D'.restrictScalars ℤ) hD x y
    (expO_summable_restrict D' x) (expO_summable_restrict D' y)
  apply oCut_prod_summable
    (a := fun k => (1 / (k.factorial : Cut)) • (((D'.restrictScalars ℤ) ^ k) x))
    (b := fun l => (1 / (l.factorial : Cut)) • (((D'.restrictScalars ℤ) ^ l) y))
  · intro i
    refine (oCut_term_abs_summable D' x i).congr (fun k => ?_)
    rw [restrictScalars_pow_apply]
  · intro j
    refine (oCut_term_abs_summable D' y j).congr (fun l => ?_)
    rw [restrictScalars_pow_apply]

/-! ## NON-VACUITY (W8): the discharge is genuine on the zero derivation (a concrete instance). -/

/-- NON-VACUITY: the zero `Cut`-linear endomorphism's `ℤ`-restriction is a Leibniz derivation, so
    `expO_mul`'s hypothesis class is inhabited; `expO 0 (x·y) = x·y = (expO 0 x)·(expO 0 y)`. -/
theorem expO_mul_zero (x y : O Cut) :
    expO ((0 : Module.End Cut (O Cut)).restrictScalars ℤ) (x * y)
      = expO ((0 : Module.End Cut (O Cut)).restrictScalars ℤ) x
        * expO ((0 : Module.End Cut (O Cut)).restrictScalars ℤ) y := by
  apply expO_mul
  intro u v; simp

end

end Phys.Algebra
