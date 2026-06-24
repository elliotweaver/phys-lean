/-
  Phys.Algebra.DerivationCompact — N24: THE COMPACT-FORM / TYPE-G₂ PINNING of the
  derivation Lie algebra `derivationLieQ`, increment 2 — the NEGATIVE-DEFINITE
  (compact-signature) TRACE FORM, its NONDEGENERACY, and SEMISIMPLICITY.
  ===========================================================================
  N20 closed `finrank_derivationQ_eq_14`; N21 exhibited `derivationLieQ` with its full
  91-pair bracket table; N22 banked the FAITHFUL 7-rep; N23 banked PERFECTNESS /
  non-solvability. The remaining compact-form / type-G₂ pinning needs the Killing /
  trace-form signature (the compact real form is the DEFINITE one) and semisimplicity.

  ★ THE W1/W9 ROUTE — THE TRUNK DISSOLUTION (docs/STANDARD.md THE ONE LAW). The ticket
  flagged the Killing-form negative-definiteness as the hardest W9 beast (a 14×14 nested
  rational determinant). It DISSOLVES through the trunk. Every derivation is SKEW-ADJOINT
  for the positive-definite Born self-overlap form (banked N17 `deriv_skew_polar` +
  N18 `deriv_maps_im`): `g(D x, y) + g(x, D y) = 0` where `g v w := reQ (v · star w)`.
  Hence the DEFINING (cheap, 8-dimensional) trace form `B(D,E) := tr_{O ℚ}(D ∘ E)` of the
  derivation algebra satisfies
        `B(D,D) = − Σ_j g(D bO_j, D bO_j) = − Σ_j Σ_k (coord_k (D bO_j))² ≤ 0`,
  with equality IFF every coordinate of every `D bO_j` vanishes IFF `D = 0`. So the trace
  form is NEGATIVE-DEFINITE — the compact signature — and therefore NONDEGENERATE, with NO
  nested determinant and using the CHEAP 8-dim defining trace form, NOT the 14×14 adjoint
  Killing form. Definiteness = skew-adjointness + sum-of-squares positivity (the trunk's
  Born = self-overlap = positivity, one level up on the derivation algebra).

  SEMISIMPLICITY IS NOT FREE HERE (childed N25). The Mathlib bridge
  `LieAlgebra.InvariantForm.isSemisimple_of_nondegenerate` takes a nondegenerate, reflexive,
  Lie-invariant form (all of which we have) PLUS the input clause "no abelian atoms"
  (`∀ I, IsAtom I → ¬IsLieAbelian I`) — it does NOT derive it. For the ADJOINT (Killing)
  form an abelian ideal lies in the radical (Dieudonné), but for THIS DEFINING (module)
  trace form the opposite is true: `B(D,D) < 0` for every `D ≠ 0` (negative-DEFINITE), so a
  nonzero abelian ideal is NEVER in the radical of `B`. Hence the no-abelian-atoms clause
  must be derived separately (the clean trunk route: skew-adjointness ⟹ the algebra is a Lie
  algebra of operators skew for a definite form ⟹ reductive; with perfectness, N23, ⟹
  semisimple; or via irreducibility of the faithful 7-rep, invariant A). This is a genuine W1
  next step beyond the currently banked structure → childed N25, fully proved forward there.

  WHAT IS BANKED HERE (forward, foundations-only):
    coordO / bO          — the 8 banked coordinate functionals as a linear equiv
                           `O ℚ ≃ₗ[ℚ] (Fin 8 → ℚ)` and its basis (the orthonormal frame).
    gForm                — the Born self-overlap bilinear form `g v w := reQ (v · star w)`.
    gForm_self_nonneg / gForm_self_eq_zero — ★ `g x x ≥ 0`, `= 0 ↔ x = 0` (sum of 8
                           coordinate squares — the trunk's positivity).
    gFormQ_skew          — ★ ABSTRACT SKEW-ADJOINTNESS: for an `IsDerivQ` derivation,
                           `g (D x) y + g x (D y) = 0` (the banked N17/N18 reduction).
    traceForm_apply_neg  — ★ `B(D,D) = − Σ_j g (D bO_j) (D bO_j)`.
    traceForm_self_nonpos / traceForm_self_eq_zero — ★★ `B(D,D) ≤ 0`, `= 0 → D = 0`.
    traceForm_nondegenerate — ★★ the defining trace form of `derivationLieQ` is NONDEGENERATE
                           (the compact-signature pin, dissolving the feared 14×14 Killing
                           determinant through the trunk's skew-adjointness — NO posited G₂).
    traceForm_witness_neg  — ★ ANTI-VACUITY: the banked nonzero witness has `B(w,w) < 0`.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0; N3–N6/N16–N23 held it). NO
  `LieAlgebra.g₂` / `G₂` is imported to ASSERT anything. The trace form and its definiteness
  are STRUCTURAL FACTS about the banked `derivationLieQ`, proved from its own banked
  skew-adjointness; `LieModule.traceForm` is MACHINERY on the DERIVED object (docs/STANDARD.md §3).

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "g₂ / gauge / compact / Killing /
  exceptional": what remains is the pure statement that the defining trace form of the
  14-dimensional Lie algebra of Leibniz-derivations of the Cayley–Dickson double of a
  double of a double of ℚ is negative-definite hence nondegenerate. No theorem STATEMENT
  needs a physics word.

  WHAT REMAINS (childed N25, never asserted here, never a bridge): SEMISIMPLICITY (the
  no-abelian-atoms clause via the reductive/skew-adjoint or irreducibility route),
  irreducibility of the faithful 7-rep (A), simplicity (D — no nonzero proper ideal), and
  then the automorphism Lie GROUP (exponentiating over the derived continuum). Correctly
  scoped to a child.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.DerivationPerfect
import Phys.Algebra.DerivationRep7
import Mathlib.Algebra.Lie.TraceForm
import Mathlib.Algebra.Lie.InvariantForm
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open scoped BigOperators

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-! ## The orthonormal coordinate frame on `O ℚ`. -/

/-- The 8 banked coordinate functionals packaged as a ℚ-linear equivalence
    `O ℚ ≃ₗ[ℚ] (Fin 8 → ℚ)`. Machinery on the derived object (the coordinate frame the
    trace form is computed in). -/
def coordO : O ℚ ≃ₗ[ℚ] (Fin 8 → ℚ) where
  toFun z := ![c0 z, c1 z, c2 z, c3 z, c4 z, c5 z, c6 z, c7 z]
  invFun v := ⟨⟨⟨v 0, v 1⟩, ⟨v 2, v 3⟩⟩, ⟨⟨v 4, v 5⟩, ⟨v 6, v 7⟩⟩⟩
  map_add' a b := by
    funext i; fin_cases i <;>
      simp [c0, c1, c2, c3, c4, c5, c6, c7, CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im]
  map_smul' q z := by
    funext i; fin_cases i <;>
      simp [c0, c1, c2, c3, c4, c5, c6, c7, cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im]
  left_inv z := by
    obtain ⟨⟨⟨a, b⟩, ⟨c, d⟩⟩, ⟨⟨e, f⟩, ⟨g, h⟩⟩⟩ := z; rfl
  right_inv v := by funext i; fin_cases i <;> simp [c0, c1, c2, c3, c4, c5, c6, c7]

/-- The coordinate basis of `O ℚ` (the orthonormal frame). -/
def bO : Module.Basis (Fin 8) ℚ (O ℚ) := Module.Basis.ofEquivFun coordO

/-! ## The Born self-overlap bilinear form and its positivity. -/

/-- THE BORN SELF-OVERLAP BILINEAR FORM `g v w := reQ (v · star w)` (the trunk's
    self-overlap form one level up). -/
def gForm (v w : O ℚ) : ℚ := reQ (v * star w)

theorem reQ_star (z : O ℚ) : reQ (star z) = reQ z := by
  simp [reQ, CD.star_re, Dbl.star_re']

theorem reQ_add (a b : O ℚ) : reQ (a + b) = reQ a + reQ b := by
  simp [reQ, CD.add_re, Dbl.add_re]

theorem reQ_neg (a : O ℚ) : reQ (-a) = - reQ a := by
  simp [reQ, CD.neg_re, Dbl.neg_re]

/-- `gForm` is symmetric (the self-overlap form is symmetric). -/
theorem gForm_symm (v w : O ℚ) : gForm v w = gForm w v := by
  unfold gForm; rw [← reQ_star (v * star w), star_mul, star_star]

/-- ★ THE SELF-FORM IS THE SUM OF THE 8 COORDINATE SQUARES (the trunk's positivity:
    `g x x = Σ coord²`). -/
theorem gForm_self_sum_sq (w : O ℚ) :
    gForm w w = (c0 w)^2 + (c1 w)^2 + (c2 w)^2 + (c3 w)^2
      + (c4 w)^2 + (c5 w)^2 + (c6 w)^2 + (c7 w)^2 := by
  obtain ⟨⟨⟨a, b⟩, ⟨c, d⟩⟩, ⟨⟨e, f⟩, ⟨g, h⟩⟩⟩ := w
  simp only [gForm, reQ, c0, c1, c2, c3, c4, c5, c6, c7, sub_eq_add_neg,
    CD.mul_re, CD.star_re, CD.star_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im, Dbl.star_re', Dbl.star_im',
    Dbl.neg_re, Dbl.neg_im]
  ring

/-- ★ `g x x ≥ 0`: the Born self-overlap is nonnegative (a sum of rational squares). -/
theorem gForm_self_nonneg (w : O ℚ) : 0 ≤ gForm w w := by
  rw [gForm_self_sum_sq]; positivity

/-- ★ `g x x = 0 ↔ x = 0`: the Born self-overlap is anisotropic — its zero set is just
    the origin (a sum of 8 squares vanishes iff each coordinate does). -/
theorem gForm_self_eq_zero {w : O ℚ} : gForm w w = 0 ↔ w = 0 := by
  rw [gForm_self_sum_sq]
  constructor
  · intro h
    have h0 : c0 w = 0 ∧ c1 w = 0 ∧ c2 w = 0 ∧ c3 w = 0 ∧ c4 w = 0 ∧ c5 w = 0
        ∧ c6 w = 0 ∧ c7 w = 0 := by
      refine ⟨?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_⟩ <;> nlinarith [sq_nonneg (c0 w), sq_nonneg (c1 w),
        sq_nonneg (c2 w), sq_nonneg (c3 w), sq_nonneg (c4 w), sq_nonneg (c5 w),
        sq_nonneg (c6 w), sq_nonneg (c7 w)]
    obtain ⟨e0, e1, e2, e3, e4, e5, e6, e7⟩ := h0
    apply coordO.injective
    funext i; fin_cases i <;>
      simp only [coordO, LinearEquiv.coe_mk, LinearMap.coe_mk, AddHom.coe_mk,
        Matrix.cons_val, map_zero, Pi.zero_apply]
    · exact e0
    · exact e1
    · exact e2
    · exact e3
    · exact e4
    · exact e5
    · exact e6
    · exact e7
  · intro h; subst h; simp [c0, c1, c2, c3, c4, c5, c6, c7]

/-! ## ORTHONORMALITY of the coordinate frame for `gForm`. -/

/-- ★ ORTHONORMALITY BRIDGE: `coordO z j = gForm z (bO j)`. The `j`-th coordinate of `z`
    is its Born overlap with the `j`-th coordinate basis vector — the coordinate frame is
    `gForm`-orthonormal. -/
theorem coord_eq_gForm (z : O ℚ) (j : Fin 8) : coordO z j = gForm z (bO j) := by
  fin_cases j <;>
  · simp only [bO, Module.Basis.coe_ofEquivFun, gForm, coordO, LinearEquiv.coe_symm_mk]
    simp [reQ, c0, c1, c2, c3, c4, c5, c6, c7, CD.mul_re, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.star_re', Dbl.star_im']

/-! ## Abstract skew-adjointness of derivations for `gForm` (banked N17/N18). -/

/-- ★ ABSTRACT SKEW-ADJOINTNESS (ℚ): every `IsDerivQ` derivation is skew-adjoint for the
    Born form — `g (D x) y + g x (D y) = 0`. Lifts the banked N17 `deriv_skew_polar` +
    N18 `deriv_maps_im` (over ℤ) through `restrictScalars`. THE TRUNK REFRAME: a derivation
    kills the self-conjugate `x · star y + y · star x`, which IS skew-adjointness. -/
theorem gFormQ_skew (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D) (x y : O ℚ) :
    gForm (D x) y + gForm x (D y) = 0 := by
  have hDz : IsDeriv (D.restrictScalars ℤ) := fun a b => hD a b
  have hmx : star (D x) = - D x := deriv_maps_im (D.restrictScalars ℤ) hDz x
  have hmy : star (D y) = - D y := deriv_maps_im (D.restrictScalars ℤ) hDz y
  unfold gForm
  rw [hmy, mul_neg, reQ_neg]
  have hpolar := deriv_skew_polar (D.restrictScalars ℤ) hDz x y
  simp only [LinearMap.restrictScalars_apply] at hpolar hmx hmy
  have hr : reQ (D x * star y) + reQ (D y * star x) = reQ (x * D y) + reQ (y * D x) := by
    have := congrArg reQ hpolar
    rwa [reQ_add, reQ_add] at this
  have hP1 : reQ (D x * star y) = - reQ (y * D x) := by
    rw [← reQ_star (D x * star y), star_mul, star_star, hmx, mul_neg, reQ_neg]
  have hP2 : reQ (D y * star x) = - reQ (x * D y) := by
    rw [← reQ_star (D y * star x), star_mul, star_star, hmy, mul_neg, reQ_neg]
  linarith [hr, hP1, hP2]

/-! ## The defining trace form of `derivationLieQ` and its compact (negative-definite)
    signature. -/

/-- The trace of an endomorphism over the coordinate basis = the sum of the diagonal
    coordinate read-offs. -/
theorem trace_eq_sum_coord (f : Module.End ℚ (O ℚ)) :
    LinearMap.trace ℚ (O ℚ) f = ∑ j, coordO (f (bO j)) j := by
  rw [LinearMap.trace_eq_matrix_trace ℚ bO, Matrix.trace]
  congr 1; funext j
  simp only [Matrix.diag_apply, LinearMap.toMatrix_apply, bO,
    Module.Basis.ofEquivFun_repr_apply]

/-- The action of `D ∈ derivationLieQ` on `O ℚ` (via the canonical `LieModule` action) is
    the underlying endomorphism applied. -/
@[simp] theorem toEnd_derivationLieQ_apply (D : derivationLieQ) (m : O ℚ) :
    (LieModule.toEnd ℚ derivationLieQ (O ℚ) D) m = (D : Module.End ℚ (O ℚ)) m := rfl

/-- ★ THE TRACE FORM AS A NEGATIVE SUM OF SELF-OVERLAPS. For a derivation `D`, the defining
    trace form `B(D,D) = tr (D ∘ D)` equals `− Σ_j g (D bO_j) (D bO_j)`. PROOF: expand the
    trace over the coordinate basis (`trace_eq_sum_coord`), rewrite each diagonal coordinate
    as a Born overlap (`coord_eq_gForm`), and skew-adjointness (`gFormQ_skew`) flips
    `g (D (D bO_j)) (bO_j) = − g (D bO_j) (D bO_j)`. -/
theorem traceForm_apply_neg (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D) :
    LieModule.traceForm ℚ derivationLieQ (O ℚ) ⟨D, hD⟩ ⟨D, hD⟩
      = - ∑ j, gForm (D (bO j)) (D (bO j)) := by
  rw [LieModule.traceForm_apply_apply]
  have hcomp : (LieModule.toEnd ℚ derivationLieQ (O ℚ) ⟨D, hD⟩
      ∘ₗ LieModule.toEnd ℚ derivationLieQ (O ℚ) ⟨D, hD⟩)
      = (D ∘ₗ D : Module.End ℚ (O ℚ)) :=
    LinearMap.ext fun m => rfl
  rw [hcomp, trace_eq_sum_coord, ← Finset.sum_neg_distrib]
  apply Finset.sum_congr rfl
  intro j _
  rw [coord_eq_gForm]
  -- (D ∘ₗ D) (bO j) = D (D (bO j))
  show gForm ((D ∘ₗ D) (bO j)) (bO j) = - gForm (D (bO j)) (D (bO j))
  rw [LinearMap.comp_apply]
  have := gFormQ_skew D hD (D (bO j)) (bO j)
  -- this : g (D (D bO_j)) (bO_j) + g (D bO_j) (D bO_j) = 0
  linarith [this]

/-- ★★ THE TRACE FORM IS NEGATIVE-SEMIDEFINITE: `B(D,D) ≤ 0` for every derivation. The sum
    of nonnegative self-overlaps, negated (the compact signature, sum-of-squares positivity
    of the trunk's Born form one level up). -/
theorem traceForm_self_nonpos (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D) :
    LieModule.traceForm ℚ derivationLieQ (O ℚ) ⟨D, hD⟩ ⟨D, hD⟩ ≤ 0 := by
  rw [traceForm_apply_neg D hD, neg_nonpos]
  apply Finset.sum_nonneg
  intro j _; exact gForm_self_nonneg _

/-- ★★ THE TRACE FORM IS NEGATIVE-DEFINITE: `B(D,D) = 0 → D = 0`. If the negated sum of
    self-overlaps vanishes, each `g (D bO_j) (D bO_j) = 0`, so each `D bO_j = 0` (the Born
    form is anisotropic, `gForm_self_eq_zero`); a linear map killing a basis is `0`. -/
theorem traceForm_self_eq_zero {D : Module.End ℚ (O ℚ)} (hD : IsDerivQ D)
    (h : LieModule.traceForm ℚ derivationLieQ (O ℚ) ⟨D, hD⟩ ⟨D, hD⟩ = 0) : D = 0 := by
  rw [traceForm_apply_neg D hD, neg_eq_zero] at h
  have hzero : ∀ j ∈ Finset.univ, gForm (D (bO j)) (D (bO j)) = 0 := by
    apply (Finset.sum_eq_zero_iff_of_nonneg (fun j _ => gForm_self_nonneg _)).mp h
  have hbasis : ∀ j, D (bO j) = 0 := by
    intro j; exact gForm_self_eq_zero.mp (hzero j (Finset.mem_univ j))
  apply bO.ext
  intro j; rw [hbasis j]; rfl

/-! ## NONDEGENERACY and SEMISIMPLICITY. -/

/-- ★★ THE DEFINING TRACE FORM OF `derivationLieQ` IS NONDEGENERATE. Negative-definiteness
    (`traceForm_self_eq_zero`) gives it directly: if `B(D, ·) = 0` then `B(D,D) = 0`, so
    `D = 0`. The Cartan-criterion input for semisimplicity, derived from the compact
    signature — NO 14×14 determinant, NO posited G₂. -/
theorem traceForm_nondegenerate :
    (LieModule.traceForm ℚ derivationLieQ (O ℚ)).Nondegenerate := by
  have hsep : (LieModule.traceForm ℚ derivationLieQ (O ℚ)).SeparatingLeft := by
    intro D hD
    -- hD D' : B D D' = 0 for all D'; in particular B D D = 0.
    have hself : LieModule.traceForm ℚ derivationLieQ (O ℚ) D D = 0 := hD D
    obtain ⟨Dv, hDv⟩ := D
    have : Dv = 0 := traceForm_self_eq_zero hDv hself
    exact Subtype.ext this
  refine ⟨hsep, ?_⟩
  -- right separation follows by symmetry of the trace form.
  intro D hD
  apply hsep D
  intro y
  rw [LieModule.traceForm_comm]
  exact hD y

/-! ## ANTI-VACUITY: the trace form is strictly negative on a nonzero witness. -/

/-- ★ ANTI-VACUITY (W8): the banked NONZERO witness derivation `witnessLieQ` has STRICTLY
    NEGATIVE self trace-form, `B(w, w) < 0`. This rules out the vacuous reading of
    nondegeneracy — the nonzero witness is NOT in the radical (it pairs nontrivially with
    itself). Purely structural: negative-semidefiniteness (`traceForm_self_nonpos`) plus
    anisotropy (`traceForm_self_eq_zero`, contrapositive) on the banked `witnessLieQ_ne_zero`.
    No coordinate value is computed. -/
theorem traceForm_witness_neg :
    LieModule.traceForm ℚ derivationLieQ (O ℚ) witnessLieQ witnessLieQ < 0 := by
  -- B(w,w) ≤ 0, and B(w,w) = 0 would force the witness to vanish — but it is nonzero.
  rcases lt_or_eq_of_le (traceForm_self_nonpos witnessDerivQ witnessDerivQ_isDerivQ) with h | h
  · -- strict: rewrite the bundled witness to the unbundled `⟨witnessDerivQ, _⟩`.
    have hw : (witnessLieQ : derivationLieQ) = ⟨witnessDerivQ, witnessDerivQ_isDerivQ⟩ := rfl
    rw [hw]; exact h
  · -- the equality case is impossible: it would give witnessDerivQ = 0.
    exfalso
    have hzero : witnessDerivQ = 0 := traceForm_self_eq_zero witnessDerivQ_isDerivQ h
    exact witnessDerivQ_ne_zero hzero

/-! ## SEMISIMPLICITY (the no-abelian-atoms clause, the trivial centre, and the assembly).

  N24 banked the NEGATIVE-DEFINITE nondegenerate defining trace form. The Mathlib entry
  `LieAlgebra.InvariantForm.isSemisimple_of_nondegenerate` discharges semisimplicity from a
  nondegenerate (`traceForm_nondegenerate`), reflexive (`traceForm_isSymm.isRefl`, free),
  Lie-invariant (`traceForm_lieInvariant`, free) form PLUS the clause `∀ I, IsAtom I →
  ¬IsLieAbelian I` ("no abelian atoms"). That clause is NOT free from nondegeneracy of the
  DEFINING (module) trace form — for the negative-DEFINITE form `B(D,D) < 0` for every `D ≠ 0`,
  so the false "abelian ideal ⊆ radical" Killing-form argument does NOT apply (its premise,
  that abelian ideals are radical, is the OPPOSITE of the truth here). The clean route is
  theory-native: the trace-form INVARIANCE + negative-DEFINITENESS + N23 PERFECTNESS force
  the centre to vanish and every abelian atom to be `⊥`. NO posited G₂. -/

/-- BUNDLED NEGATIVE-DEFINITENESS on the subalgebra: for `D : derivationLieQ`,
    `B(D,D) = 0 → D = 0`. (Unbundles to the banked `traceForm_self_eq_zero`.) -/
theorem traceForm_self_eq_zero' (D : derivationLieQ)
    (h : LieModule.traceForm ℚ derivationLieQ (O ℚ) D D = 0) : D = 0 := by
  obtain ⟨Dv, hDv⟩ := D
  exact Subtype.ext (traceForm_self_eq_zero hDv h)

/-- ★★ THE CENTRE OF `derivationLieQ` IS TRIVIAL: `center = ⊥`. PERFECTNESS (N23,
    `derivationLieQ_perfect`: `⁅⊤,⊤⁆ = ⊤`) puts every element into the first lower-central
    term `lcs 1 = ⁅⊤, ⊤⁆`; the trace form vanishes between `lcs 1` and the centre
    (`traceForm_apply_eq_zero_of_mem_lcs_of_mem_center`), so a central element `z` has
    `B(z,z) = 0`, and negative-definiteness (`traceForm_self_eq_zero'`) forces `z = 0`. The
    structural heart of semisimplicity, derived FORWARD from the banked perfectness + compact
    (negative-definite) signature — NO posited G₂. -/
theorem derivationLieQ_center_eq_bot :
    LieAlgebra.center ℚ derivationLieQ = ⊥ := by
  rw [eq_bot_iff]
  intro z hz
  rw [LieSubmodule.mem_bot]
  have hlcs : z ∈ LieModule.lowerCentralSeries ℚ derivationLieQ derivationLieQ 1 := by
    rw [LieModule.lowerCentralSeries_succ, LieModule.lowerCentralSeries_zero,
        derivationLieQ_perfect]
    exact LieSubmodule.mem_top z
  have hBzz : LieModule.traceForm ℚ derivationLieQ (O ℚ) z z = 0 :=
    LieModule.traceForm_apply_eq_zero_of_mem_lcs_of_mem_center ℚ derivationLieQ (O ℚ) hlcs hz
  exact traceForm_self_eq_zero' z hBzz

/-- ★★ NO ABELIAN ATOMS: every atomic Lie ideal of `derivationLieQ` is non-abelian. This is
    the lone remaining input to `isSemisimple_of_nondegenerate` (the three other Cartan
    inputs are banked/free). Suppose an atom `I` is abelian, so `⁅I,I⁆ = ⊥`. Since `⁅⊤,I⁆ ≤ I`
    and `I` is an atom, either `⁅⊤,I⁆ = ⊥` or `⁅⊤,I⁆ = I`.
    • `⁅⊤,I⁆ = ⊥`: then `I ≤ center = ⊥` (`derivationLieQ_center_eq_bot`) — but an atom is
      not `⊥`, contradiction.
    • `⁅⊤,I⁆ = I`: then `↑I` is the linear span of brackets `⁅x,n⁆` (`x ∈ ⊤`, `n ∈ I`); for
      any `w ∈ I`, invariance gives `B(⁅x,n⁆, w) = B(x, ⁅n,w⁆) = 0` because `⁅n,w⁆ ∈ ⁅I,I⁆ = ⊥`.
      Span-induction propagates `B(·, w) = 0` over all of `I`, so `B(z,z) = 0` for every
      `z ∈ I`, and negative-definiteness forces `z = 0`, i.e. `I = ⊥` — contradiction.
    Theory-native: only the trace-form INVARIANCE, negative-DEFINITENESS, and N23 PERFECTNESS
    (through the centre). NO false radical argument, NO posited G₂. -/
theorem derivationLieQ_no_abelian_atom :
    ∀ I : LieIdeal ℚ derivationLieQ, IsAtom I → ¬ IsLieAbelian I := by
  intro I hI habel
  have hII : (⁅I, I⁆ : LieIdeal ℚ derivationLieQ) = ⊥ :=
    (LieSubmodule.lie_abelian_iff_lie_self_eq_bot I).mp habel
  have hle : (⁅(⊤ : LieIdeal ℚ derivationLieQ), I⁆ : LieIdeal ℚ derivationLieQ) ≤ I :=
    LieSubmodule.lie_le_right I ⊤
  rcases hI.le_iff.mp hle with hbot | htopI
  · -- ⁅⊤,I⁆ = ⊥ ⟹ I ≤ center = ⊥
    have hIcent : I ≤ LieAlgebra.center ℚ derivationLieQ := by
      intro z hz
      rw [LieModule.mem_maxTrivSubmodule]
      intro a
      have hmem : ⁅a, z⁆ ∈ (⁅(⊤ : LieIdeal ℚ derivationLieQ), I⁆ : LieIdeal ℚ derivationLieQ) :=
        LieSubmodule.lie_mem_lie (LieSubmodule.mem_top a) hz
      rw [hbot, LieSubmodule.mem_bot] at hmem
      exact hmem
    rw [derivationLieQ_center_eq_bot] at hIcent
    exact hI.1 (le_bot_iff.mp hIcent)
  · -- ⁅⊤,I⁆ = I ⟹ B vanishes on I ⟹ I = ⊥
    apply hI.1
    rw [eq_bot_iff]
    intro z hz
    rw [LieSubmodule.mem_bot]
    have hzI : z ∈ (⁅(⊤ : LieIdeal ℚ derivationLieQ), I⁆ : LieIdeal ℚ derivationLieQ) := by
      rw [htopI]; exact hz
    rw [← LieSubmodule.mem_toSubmodule,
        LieSubmodule.lieIdeal_oper_eq_linear_span'] at hzI
    have key : ∀ w, w ∈ I → LieModule.traceForm ℚ derivationLieQ (O ℚ) w z = 0 := by
      refine Submodule.span_induction
        (p := fun z _ => ∀ w, w ∈ I → LieModule.traceForm ℚ derivationLieQ (O ℚ) w z = 0)
        ?_ ?_ ?_ ?_ hzI
      · rintro m ⟨x, -, n, hn, rfl⟩ w hw
        rw [LieModule.traceForm_comm, LieModule.traceForm_apply_lie_apply]
        have hnw : ⁅n, w⁆ = 0 := by
          have hmem : ⁅n, w⁆ ∈ (⁅I, I⁆ : LieIdeal ℚ derivationLieQ) :=
            LieSubmodule.lie_mem_lie hn hw
          rw [hII, LieSubmodule.mem_bot] at hmem
          exact hmem
        rw [hnw, map_zero]
      · intro w _; rw [map_zero]
      · intro a b _ _ ha hb w hw
        rw [map_add, ha w hw, hb w hw, add_zero]
      · intro c a _ ha w hw
        rw [map_smul, ha w hw, smul_zero]
    exact traceForm_self_eq_zero' z (key z hz)

/-- ★★★ `derivationLieQ` IS SEMISIMPLE. Assembled from the banked NEGATIVE-DEFINITE
    nondegenerate defining trace form (`traceForm_nondegenerate`, N24), its free reflexivity
    and Lie-invariance, and the theory-native no-abelian-atoms clause
    (`derivationLieQ_no_abelian_atom`). The 14-dimensional Lie algebra of Leibniz-derivations
    of the Cayley–Dickson double of a double of a double of ℚ is semisimple — a structural
    fact about the DERIVED object, NO posited G₂, NO bridge. (A defining property of the
    compact real form of type G₂; the physics name is a removable label.) -/
theorem derivationLieQ_semisimple :
    LieAlgebra.IsSemisimple ℚ derivationLieQ :=
  LieAlgebra.InvariantForm.isSemisimple_of_nondegenerate
    (LieModule.traceForm ℚ derivationLieQ (O ℚ))
    traceForm_nondegenerate
    (LieModule.traceForm_lieInvariant ℚ derivationLieQ (O ℚ))
    (LieModule.traceForm_isSymm ℚ derivationLieQ (O ℚ)).isRefl
    derivationLieQ_no_abelian_atom

end

end Phys.Algebra
