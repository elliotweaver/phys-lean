/-
  Phys.Algebra.LorentzContinuumRealClosed — N77: THE DERIVED ℝ `Cut` IS A REAL CLOSED FIELD —
  the GENERAL odd-degree root engine + `IsRealClosed Cut` + the general odd-dimensional eigen-seed,
  over the DERIVED ℝ `Cut` and the terminal algebra `O Cut := CD (H Cut)`.
  ===========================================================================
  THE NEXT FORCED NODE after the EIGENVECTOR-HALF-OF-THE-3-DIM-SEED node (N76). N49–N76 banked, over
  the derived ℝ `Cut`:
    • the continuum Born form `QvC`, the isometry monoid `qvIsomMonoidC` (N49), `gFormC_comp` (N50);
    • the tangent Lie algebra `infIsomLieAlg` + `BvC` + `boostGenC`/`rotGenC a` (N51);
    • the FORWARD soundness `genIsomMonoidC2 ≤ qvIsomMonoidC` with `biMulFun u u'` (N52–N55);
    • the BORN POSITIVITY `gFormC_nonneg` + the (1,9) signature split (N56);
    • ★ the POSITIVE-DEFINITE SCALAR (degree-2) square root `cutSqrt` — `cutSqrt_exists`/`cutSqrt_sq`
      via the intermediate value theorem riding the banked order-completeness (N33–N37) (N57);
    • the INFINITESIMAL CARTAN reference form `EvC` (N58), the OPERATOR FORM-ADJOINT `IsEvCAdjoint`
      (N59), the operator square roots (N60–N65), the concrete polar factorization (N66);
    • the rank-3 / GENERAL rank-`n` spectral operator `specOpN` (N67–N68), the witness `txMix` (N69),
      the DEFLATION engine `deflateC` (N70), the seed eigenpair extraction `specOpN_eigen` (N71), the
      constructed octonion-coupling seed (N72), the FIRST CLOSED descent (N73), the GENERAL ITERATED
      DEFLATION DESCENT `deflateList`/`specOpN_full_descent` (N74);
    • ★ the ODD-DEGREE ROOT ENGINE — the cube root `cutCbrt` + the monic-CUBIC root lever
      `cut_cubic_has_root` (the SEED-EIGENVALUE half at dimension = 3, a root of the characteristic
      cubic, via the same IVT engine that built `cutSqrt` escalated degree-2→3) (N75);
    • ★ the EIGENVECTOR half of the 3-dim seed — `Module.Finite Cut STVC` (cascade rungs `2→4→8`),
      `dim3_has_eigenvector` (every endo of a 3-dim `Cut`-space has a nonzero eigenvector), and
      `stvc_eigenvector_of_charpoly_root` (the eigenvalue→eigenvector closure over the 10-dim `STVC`)
      (N76).

  ── THE TARGET (N77) AND THE W3 DECOMPOSITION (ROADMAP §N77 FORWARD FRONTIER) ──
  The ticket TARGET is the HEAVY group-manifold core: the FULL n-dim spectral EXISTENCE
  `∀ g, ∃ c u, g = specOpN c u`, the GLOBAL polar/KAK assembly for an arbitrary `g`, CONNECTEDNESS,
  the GLOBAL reverse KAK surjectivity, and the full `Spin(9)→SO(9)` exhaustion. MEASURE-FIRST (W1/W9)
  re-specifies the IMMEDIATELY-BANKABLE forced advance and confirms the global assembly /
  connectedness / surjectivity / exhaustion are the genuine HEAVY group-manifold sub-nodes (childed
  N78).

  ── THE GAP THIS NODE CLOSES ──
  N75 banked the root engine ONLY at degree 3 (`cut_cubic_has_root`, the monic CUBIC); N76 banked the
  eigen-seed ONLY at dimension 3 (`dim3_has_eigenvector`). The genuine obstruction to the FULL `STVC`
  existence is that `STVC` is 10-dim (EVEN), so an endomorphism's characteristic polynomial has EVEN
  degree 10 — neither N75's cubic engine nor N76's dim-3 seed can root/seed it. Under deflation the
  effective dimension descends `10 → 9 → 8 → …`; the ODD rungs each get a guaranteed eigenpair from a
  GENERAL odd-degree root engine. That general odd-degree root is exactly the lever that generalizes
  BOTH N75 (cubic only) AND N76 (dim 3 only) — and it lands the DEEP forced identification that the
  DERIVED ℝ `Cut` is a REAL CLOSED FIELD (`IsRealClosed Cut`, Mathlib's algebraic characterization of
  the real continuum).

  ── THE TRUNK REFRAME (THE ONE LAW): the general odd-degree root IS `cutSqrt`/`cut_cubic`'s IVT, at
  arbitrary odd degree ──
  `cutSqrt` (N57) rode `intermediate_value_Icc` on `x ↦ x·x` at degree 2; `cut_cubic_has_root` (N75)
  rode the SAME IVT on a monic cubic at degree 3. The SAME `intermediate_value_Icc`, on a monic
  polynomial of ARBITRARY odd `natDegree = n` over the Cauchy-bound symmetric interval `[−s, s]` with
  `s = (∑_{i<n} |coeff i|) + 1`, gives a root: the dominance bound makes `f(s) ≥ 0`
  (`cutPoly_eval_upper_nonneg`), the ODD reflection `(−s)^n = −(s^n)` (`Odd.neg_pow`) makes
  `f(−s) ≤ 0` (`cutPoly_eval_lower_nonpos`), the bracketed sign change at `0` is crossed by IVT
  (`cut_odd_degree_has_root`). The odd degree is exactly why a root exists for EVERY coefficient
  family. `IsRealClosed Cut` then follows from Mathlib's `IsRealClosed.of_linearOrderedField` with
  the two facts (1) every nonneg is a square (`cut_isSquare_of_nonneg`, from N57 `cutSqrt`) and
  (2) every odd-degree polynomial has a root (`cut_exists_root_of_odd`). NO Cardano radicals, NO
  Sturm chains, NO Mathlib `Real` as content, NO posited field — the trunk's own order-completeness
  (N33–N37), the same engine the continuum was BUILT with, at arbitrary odd degree.

  WHAT IS PROVED (each a theorem, foundations-only, forward from the banked objects):
    cutPoly_eval_upper_nonneg — the Cauchy dominance: a monic poly of `natDegree = n ≥ 1` evaluated at
                          `s ≥ (∑ |coeff|) + 1` is `≥ 0` (the top term `s^n` dominates the rest).
    cutPoly_eval_lower_nonpos — the ODD reflection: a monic poly of ODD `natDegree = n` evaluated at
                          `−s` (same `s`) is `≤ 0` (`(−s)^n = −(s^n)` dominates with a sign flip).
    cut_odd_degree_has_root — ★★ THE GENERAL ODD-DEGREE ROOT: EVERY monic polynomial over `Cut` of ODD
                          `natDegree` HAS a root, via the IVT bracketing the sign change. The
                          degree-3→arbitrary-odd escalation of N75 `cut_cubic_has_root`.
    cut_isSquare_of_nonneg — every nonnegative element of `Cut` is a square (from N57 `cutSqrt`).
    cut_exists_root_of_odd — every (not-necessarily-monic) odd-`natDegree` polynomial over `Cut` has a
                          root (normalize by the leading coefficient, apply the monic lever).
    cut_isRealClosed — ★★★ THE HEADLINE: the DERIVED ℝ `Cut` IS A REAL CLOSED FIELD (`IsRealClosed
                          Cut`), via `of_linearOrderedField` with squares-of-nonnegatives + odd-degree
                          roots. The algebraic characterization of the real continuum, DERIVED.
    cut_odd_real_root — ★ NON-VACUITY: a concrete odd-degree (quintic) `x⁵ − x` has a root over `Cut`
                          (the costume target).
    dim_odd_has_eigenvector — ★ THE GENERAL ODD-DIMENSIONAL EIGEN-SEED: every endomorphism of an
                          ODD-`finrank` `Cut`-vector space has a NONZERO eigenvector — the eigenvalue
                          a root of its odd-degree characteristic polynomial (supplied by the general
                          odd-degree lever), the eigenvector the nonzero eigenspace element the
                          eigenspace machinery produces over the DERIVED field `Cut`. Generalizes N76
                          `dim3_has_eigenvector` from dimension 3 to EVERY odd dimension — the
                          re-seeding lever for the odd rungs of the deflation cascade.

  ── THE W1 HEAVY REMAINDER (childed N78, an honest dissolution ticket, NOT closed here) ──
  The FULL existence `∀ g, ∃ c u, g = specOpN c u` (assembled from the seed + the re-seeding at the
  dropped dimension + the N74 iterated descent) + the GLOBAL polar/KAK assembly for an arbitrary `g` +
  the compact part via CONNECTEDNESS + the GLOBAL reverse KAK surjectivity + the full `Spin(9)→SO(9)`
  exhaustion are the genuine HEAVY group-manifold core, childed onto the chain tail. THIS node banks
  the GENERAL odd-degree root engine, the real-closed-field identification of `Cut`, and the general
  odd-dimensional eigen-seed — the trunk-native escalation of the root engine and the eigen-seed from
  fixed degree/dimension (2, 3) to ARBITRARY odd degree/dimension.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). That an odd-degree polynomial over a real-closed /
  complete ordered field has a root, and that such a field is real closed, is standard real algebra.
  Here the general odd-degree root, the real-closed-field structure, and the odd-dimensional eigen-seed
  all DESCEND from the order-completeness the continuum was BUILT with — the N33
  `ConditionallyCompleteLinearOrder`, N34 `OrderTopology`/`IsTopologicalRing`, N35 `Archimedean`,
  N37 `CompleteSpace` over the DERIVED ℝ `Cut`, via the SAME `intermediate_value_Icc` engine that gave
  N57 `cutSqrt` and N75 `cut_cubic_has_root`, plus N57 `cutSqrt` for the squares. `IsRealClosed`,
  `of_linearOrderedField`, `intermediate_value_Icc`, `Polynomial.continuous`,
  `Module.End.hasEigenvalue_iff_isRoot_charpoly`, `HasEigenvalue.exists_hasEigenvector` are standard
  MACHINERY operating on the DERIVED objects. NO posited ℝ, NO Mathlib `Real`/`Real.sqrt` as content,
  NO posited field, NO posited Lorentz group.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Lorentz / boost / rotation / spectral /
  eigenvalue / eigenvector / eigen-seed / seed / re-seed / dimension / rank / Spin / SO(9) / KAK /
  polar / Cartan / isometry / real-closed-as-physics": what remains is the theorem that, over the
  derived complete ordered field `Cut`, every nonnegative element is a square, every odd-degree
  polynomial has a root, `Cut` is a real closed field (`IsRealClosed Cut`), and every endomorphism of
  an odd-finite-dimensional `Cut`-vector space has a nonzero `v` with `T v = λ • v` — pure mathematics
  about roots of polynomials over, and the algebraic structure of, the derived complete ordered field.
  No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, a fully proved derivation,
  NO Mathlib number-system content import (the field is the DERIVED `Cut`), NO posited Lorentz group,
  NO posited field, NO Mathlib ℝ/ℂ as content.
-/
import Phys.Algebra.LorentzContinuumSeedVector
import Mathlib.FieldTheory.IsRealClosed.Basic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators
open Polynomial

/-! ## The Cauchy dominance — a monic polynomial dominated by its top term beyond the root bound. -/

/-- The Cauchy dominance at the upper bound: a monic polynomial of `natDegree = n ≥ 1`, evaluated at
    `s ≥ (∑_{i<n} |coeff i|) + 1`, is `≥ 0`. The top term `s^n = s · s^(n-1)` dominates the lower sum
    `|∑_{i<n} coeff_i s^i| ≤ (s−1) s^(n-1)`. The degree-2/3 dominance of N57/N75 at arbitrary degree. -/
theorem cutPoly_eval_upper_nonneg (p : Polynomial Cut) (hmon : p.Monic) (n : ℕ) (hn : p.natDegree = n)
    (hn1 : 1 ≤ n) (s : Cut) (hs1 : 1 ≤ s)
    (hsbound : (∑ i ∈ Finset.range n, |p.coeff i|) ≤ s - 1) :
    0 ≤ p.eval s := by
  have hs0 : (0:Cut) ≤ s := le_trans zero_le_one hs1
  have hsn1 : (0:Cut) ≤ s ^ (n-1) := pow_nonneg hs0 _
  rw [Polynomial.eval_eq_sum_range, hn, Finset.sum_range_succ]
  have hcn : p.coeff n = 1 := by
    have := hmon; rw [Polynomial.Monic, Polynomial.leadingCoeff, hn] at this; exact this
  rw [hcn, one_mul]
  have hlow : |∑ i ∈ Finset.range n, p.coeff i * s ^ i| ≤ (s - 1) * s ^ (n-1) := by
    calc |∑ i ∈ Finset.range n, p.coeff i * s ^ i|
        ≤ ∑ i ∈ Finset.range n, |p.coeff i * s ^ i| := Finset.abs_sum_le_sum_abs _ _
      _ = ∑ i ∈ Finset.range n, |p.coeff i| * s ^ i := by
            apply Finset.sum_congr rfl; intro i _
            rw [abs_mul, abs_of_nonneg (pow_nonneg hs0 i)]
      _ ≤ ∑ i ∈ Finset.range n, |p.coeff i| * s ^ (n-1) := by
            apply Finset.sum_le_sum; intro i hi
            apply mul_le_mul_of_nonneg_left _ (abs_nonneg _)
            exact pow_le_pow_right₀ hs1 (Nat.le_sub_one_of_lt (Finset.mem_range.mp hi))
      _ = (∑ i ∈ Finset.range n, |p.coeff i|) * s ^ (n-1) := by rw [← Finset.sum_mul]
      _ ≤ (s - 1) * s ^ (n-1) := mul_le_mul_of_nonneg_right hsbound hsn1
  have habs : -((s - 1) * s ^ (n-1)) ≤ ∑ i ∈ Finset.range n, p.coeff i * s ^ i :=
    (abs_le.mp hlow).1
  have hsn : s ^ n = s * s ^ (n-1) := by
    conv_lhs => rw [show n = (n-1) + 1 from by omega]
    ring
  nlinarith [habs, hsn, hsn1, hs1]

/-- The Cauchy dominance at the lower bound, for ODD degree: a monic polynomial of ODD `natDegree = n`,
    evaluated at `−s` (same `s`), is `≤ 0`. The top term `(−s)^n = −(s^n)` flips sign (`Odd.neg_pow`)
    and dominates the lower sum. The odd-degree reflection that brackets the sign change for IVT. -/
theorem cutPoly_eval_lower_nonpos (p : Polynomial Cut) (hmon : p.Monic) (n : ℕ) (hodd : Odd n)
    (hn : p.natDegree = n) (s : Cut) (hs1 : 1 ≤ s)
    (hsbound : (∑ i ∈ Finset.range n, |p.coeff i|) ≤ s - 1) :
    p.eval (-s) ≤ 0 := by
  have hs0 : (0:Cut) ≤ s := le_trans zero_le_one hs1
  have hn1 : 1 ≤ n := hodd.pos
  have hsn1 : (0:Cut) ≤ s ^ (n-1) := pow_nonneg hs0 _
  rw [Polynomial.eval_eq_sum_range, hn, Finset.sum_range_succ]
  have hcn : p.coeff n = 1 := by
    have := hmon; rw [Polynomial.Monic, Polynomial.leadingCoeff, hn] at this; exact this
  rw [hcn, one_mul]
  have hpow : (-s) ^ n = -(s ^ n) := hodd.neg_pow s
  rw [hpow]
  have hlow : |∑ i ∈ Finset.range n, p.coeff i * (-s) ^ i| ≤ (s - 1) * s ^ (n-1) := by
    calc |∑ i ∈ Finset.range n, p.coeff i * (-s) ^ i|
        ≤ ∑ i ∈ Finset.range n, |p.coeff i * (-s) ^ i| := Finset.abs_sum_le_sum_abs _ _
      _ = ∑ i ∈ Finset.range n, |p.coeff i| * s ^ i := by
            apply Finset.sum_congr rfl; intro i _
            rw [abs_mul, abs_pow, abs_neg, abs_of_nonneg hs0]
      _ ≤ ∑ i ∈ Finset.range n, |p.coeff i| * s ^ (n-1) := by
            apply Finset.sum_le_sum; intro i hi
            apply mul_le_mul_of_nonneg_left _ (abs_nonneg _)
            exact pow_le_pow_right₀ hs1 (Nat.le_sub_one_of_lt (Finset.mem_range.mp hi))
      _ = (∑ i ∈ Finset.range n, |p.coeff i|) * s ^ (n-1) := by rw [← Finset.sum_mul]
      _ ≤ (s - 1) * s ^ (n-1) := mul_le_mul_of_nonneg_right hsbound hsn1
  have habs : ∑ i ∈ Finset.range n, p.coeff i * (-s) ^ i ≤ (s - 1) * s ^ (n-1) :=
    (abs_le.mp hlow).2
  have hsn : s ^ n = s * s ^ (n-1) := by
    conv_lhs => rw [show n = (n-1) + 1 from by omega]
    ring
  nlinarith [habs, hsn, hsn1, hs1]

/-! ## The general odd-degree root over the derived ℝ `Cut`. -/

/-- ★★ THE GENERAL ODD-DEGREE ROOT LEVER: EVERY monic polynomial over the derived ℝ `Cut` of ODD
    `natDegree` HAS a root over `Cut`.

    THE W1 REFRAME (THE ONE LAW) — the SAME `intermediate_value_Icc` engine that built N57 `cutSqrt`
    (degree 2) and N75 `cut_cubic_has_root` (degree 3), now at ARBITRARY odd degree. With the Cauchy
    bound `s = (∑_{i<n} |coeff i|) + 1`: the dominance `cutPoly_eval_upper_nonneg` makes `f(s) ≥ 0`;
    the odd reflection `cutPoly_eval_lower_nonpos` makes `f(−s) ≤ 0`; the bracketed sign change at `0`
    is crossed by IVT. The odd degree is exactly why the root exists for EVERY coefficient family. The
    degree-3→arbitrary-odd escalation of `cut_cubic_has_root`. NO Cardano radicals, NO Mathlib `Real`,
    NO posited field. -/
theorem cut_odd_degree_has_root {p : Polynomial Cut} (hmon : p.Monic) (hodd : Odd p.natDegree) :
    ∃ x : Cut, p.IsRoot x := by
  set n := p.natDegree with hn
  have hn1 : 1 ≤ n := hodd.pos
  set s : Cut := (∑ i ∈ Finset.range n, |p.coeff i|) + 1 with hs
  have hsbound : (∑ i ∈ Finset.range n, |p.coeff i|) ≤ s - 1 := by rw [hs]; linarith
  have hsum0 : (0:Cut) ≤ ∑ i ∈ Finset.range n, |p.coeff i| :=
    Finset.sum_nonneg (fun i _ => abs_nonneg _)
  have hs1 : 1 ≤ s := by rw [hs]; linarith
  have hfU : 0 ≤ p.eval s := cutPoly_eval_upper_nonneg p hmon n hn.symm hn1 s hs1 hsbound
  have hfL : p.eval (-s) ≤ 0 := cutPoly_eval_lower_nonpos p hmon n hodd hn.symm s hs1 hsbound
  have hcont : ContinuousOn (fun x : Cut => p.eval x) (Set.Icc (-s) s) :=
    p.continuous.continuousOn
  have hle : (-s : Cut) ≤ s := by linarith
  have hmem : (0:Cut) ∈ Set.Icc ((fun x : Cut => p.eval x) (-s)) ((fun x : Cut => p.eval x) s) :=
    ⟨hfL, hfU⟩
  obtain ⟨x, _, hx⟩ := intermediate_value_Icc hle hcont hmem
  exact ⟨x, hx⟩

/-! ## The two `IsRealClosed` facts, and the real-closed-field identification of `Cut`. -/

/-- Every nonnegative element of the derived ℝ `Cut` is a square — the witness is N57 `cutSqrt`. -/
theorem cut_isSquare_of_nonneg {x : Cut} (hx : 0 ≤ x) : IsSquare x :=
  ⟨cutSqrt x, (cutSqrt_sq hx).symm⟩

/-- Every (not-necessarily-monic) odd-`natDegree` polynomial over `Cut` has a root: normalize by the
    leading coefficient to a monic polynomial of the same degree, apply `cut_odd_degree_has_root`, and
    a root of `p = f · C (leadingCoeff)⁻¹` is a root of `f` (the constant factor is nonzero). -/
theorem cut_exists_root_of_odd {f : Polynomial Cut} (hf : Odd f.natDegree) :
    ∃ x, f.IsRoot x := by
  have hf0 : f ≠ 0 := by rintro rfl; simp at hf
  set p := f * Polynomial.C (f.leadingCoeff)⁻¹ with hp
  have hlc : f.leadingCoeff ≠ 0 := Polynomial.leadingCoeff_ne_zero.mpr hf0
  have hpmon : p.Monic := Polynomial.monic_mul_C_of_leadingCoeff_mul_eq_one (mul_inv_cancel₀ hlc)
  have hpdeg : p.natDegree = f.natDegree := by
    rw [hp, Polynomial.natDegree_mul_C (inv_ne_zero hlc)]
  obtain ⟨x, hx⟩ := cut_odd_degree_has_root hpmon (hpdeg ▸ hf)
  refine ⟨x, ?_⟩
  rw [Polynomial.IsRoot.def] at hx ⊢
  rw [hp, Polynomial.eval_mul, Polynomial.eval_C] at hx
  rcases mul_eq_zero.mp hx with h | h
  · exact h
  · exact absurd (inv_eq_zero.mp h) hlc

/-- ★★★ THE HEADLINE: the DERIVED ℝ `Cut` IS A REAL CLOSED FIELD. Via Mathlib's
    `IsRealClosed.of_linearOrderedField`, from the two facts: every nonnegative element is a square
    (`cut_isSquare_of_nonneg`, from N57 `cutSqrt`) and every odd-degree polynomial has a root
    (`cut_exists_root_of_odd`, the general odd-degree IVT engine of this node). The algebraic
    characterization of the real continuum — that `Cut` is real closed — DERIVED entirely from the
    order-completeness the continuum was BUILT with (N33–N37), NOT a posited ℝ. -/
instance cut_isRealClosed : IsRealClosed Cut :=
  IsRealClosed.of_linearOrderedField
    (fun hx => cut_isSquare_of_nonneg hx)
    (fun hf => cut_exists_root_of_odd hf)

/-- ★ NON-VACUITY (W8): a concrete odd-degree (quintic) polynomial `x⁵ − x` over the derived ℝ `Cut`
    HAS a root (`natDegree = 5`, odd; the general lever instantiated beyond the cubic of N75). A
    concrete, bitable existence — the costume asserts a WRONG specialization. -/
theorem cut_odd_real_root :
    ∃ x : Cut, (Polynomial.X ^ 5 - Polynomial.X : Polynomial Cut).IsRoot x := by
  apply cut_exists_root_of_odd
  rw [show (Polynomial.X ^ 5 - Polynomial.X : Polynomial Cut).natDegree = 5 from by compute_degree!]
  decide

/-! ## The general odd-dimensional eigen-seed — the re-seeding lever for the odd rungs. -/

/-- ★ THE GENERAL ODD-DIMENSIONAL EIGEN-SEED: every endomorphism `T` of an ODD-`finrank` `Cut`-vector
    space has a NONZERO eigenvector — a `λ` and a `v ≠ 0` with `T v = λ • v`. The eigenvalue is a root
    of the ODD-degree characteristic polynomial of `T` (its `natDegree = finrank`, odd, so the general
    odd-degree root lever `cut_odd_degree_has_root` supplies a root); the eigenvector is the nonzero
    eigenspace element the eigenspace machinery (`hasEigenvalue_iff_isRoot_charpoly` +
    `exists_hasEigenvector`) produces over the DERIVED field `Cut`. Generalizes N76
    `dim3_has_eigenvector` from the single dimension 3 to EVERY odd dimension — the re-seeding lever
    for the odd rungs of the deflation cascade `10 → 9 → 8 → …`. -/
theorem dim_odd_has_eigenvector {V : Type*} [AddCommGroup V] [Module Cut V] [Module.Finite Cut V]
    (hodd : Odd (Module.finrank Cut V)) (T : Module.End Cut V) :
    ∃ (lam : Cut) (v : V), v ≠ 0 ∧ T v = lam • v := by
  have hdeg : Odd T.charpoly.natDegree := by
    rw [LinearMap.charpoly_natDegree]; exact hodd
  obtain ⟨lam, hroot⟩ := cut_odd_degree_has_root (LinearMap.charpoly_monic T) hdeg
  have hev : T.HasEigenvalue lam :=
    (Module.End.hasEigenvalue_iff_isRoot_charpoly T lam).mpr hroot
  obtain ⟨v, hv⟩ := hev.exists_hasEigenvector
  exact ⟨lam, v, hv.2, hv.apply_eq_smul⟩

end

end Phys.Algebra
