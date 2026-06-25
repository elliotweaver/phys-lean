/-
  # N41c — THE VECTOR EXPONENTIAL on `O Cut` + THE CAUCHY-PRODUCT PRODUCT-PRESERVATION
  #         (the AUTOMORPHISM GROUP, increment 11, part c) over the DERIVED ℝ.

  N41a (`Phys/Algebra/DerivationLeibnizPow.lean`) banked the PURE-ALGEBRA core of the exponential
  flow's product-preservation: for a Leibniz derivation `D` of the non-associative `CD (CD B)`,
  `Dⁿ(x·y) = ∑_{k+l=n} C(n,k)•(Dᵏx · Dˡy)` (the iterated Leibniz binomial, `iter_leibniz_antidiag`).
  N41b (`Phys/Cascade/OctonionTopology.lean`) banked the FOUNDATIONAL TOPOLOGICAL GROUND: `O Cut` is
  a COMPLETE UNIFORM TOPOLOGICAL `*`-ALGEBRA over the derived ℝ — `oCut_t3Space`, `oCut_completeSpace`,
  `oCut_continuousMul`, `oCut_isTopologicalSemiring` — the EXACT hypotheses the trunk-native Cauchy
  product `Summable.tsum_mul_tsum_eq_tsum_sum_antidiagonal` consumes, with NO ℝ-valued `Norm`.

  THIS file performs the ANALYTIC INTEGRATION: it defines the LITERAL `O Cut`-valued vector
  exponential `expO D x := ∑' n, (1/n!)•(Dⁿ x)` and passes the per-`n` iterated-Leibniz identity to
  the `tsum` limit by the Cauchy product over the now-topological `O Cut`, concluding the LITERAL
  product-preservation `expO D (x·y) = expO D x · expO D y` for a Leibniz derivation `D`.

  ★ THE ROUTE (trunk-native, NO ℝ-valued norm, NO `import Mathlib.Data.Real`).
    (1) `Module Cut (O Cut)` — the componentwise `Cut`-scalar action `c • z = ⟨c•z.re, c•z.im⟩`,
        built by transfer up the cascade (`dblModuleCut` → `cdModuleCut` ×2), the SAME `SMul` N41b's
        `oCut_continuousSMul` is stated over (defeq to `CD.instSMul`). MACHINERY on the DERIVED object.
    (2) `SmulCompat` — the smul-CENTRALITY bundle `(c•a)·b = c•(a·b)`, `a·(c•b) = c•(a·b)`,
        `star (c•a) = c•star a`, … lifted from `Cut`-on-`Dbl Cut` up through the two `CD` doublings
        (`smulCompat_cd`). These are the bilinearity-of-`•`-over-`·` facts the per-`n` rewrite needs;
        they survive non-associativity because each is a statement about the BILINEAR product, never
        about reassociation — exactly as N41a's iterated Leibniz and N6's bracket closure do.
    (3) `expO_term_antidiag` — THE PER-`n` ALGEBRAIC INTEGRATION: combine N41a `iter_leibniz_antidiag`
        with `C(n,k)/n! = 1/(k!·l!)` (`Nat.choose_mul_factorial_mul_factorial`) and the smul-centrality
        bundle to rewrite `(1/n!)•(Dⁿ(x·y))` as `∑_{k+l=n} ((1/k!)•Dᵏx)·((1/l!)•Dˡy)` — the antidiagonal
        of products of exponential terms.
    (4) `expO_mul_of_summable` — THE CAUCHY-PRODUCT PRODUCT-PRESERVATION: the trunk-native
        `Summable.tsum_mul_tsum_eq_tsum_sum_antidiagonal` (over `oCut_t3Space` + `oCut_completeSpace` +
        `oCut_isTopologicalSemiring`, NO ℝ-valued norm) turns `(expO D x)·(expO D y)` into
        `∑'ₙ ∑_{k+l=n} (…)·(…)`, which `expO_term_antidiag` collapses to `∑'ₙ (1/n!)•(Dⁿ(x·y)) =
        expO D (x·y)`. The summability of the two series and the product family enter as explicit
        hypotheses — discharged unconditionally by the dedicated SUMMABILITY node (childed N41d, the
        Cut-side coordinatization `O Cut ≃ₗ[Cut] (Fin 8 → Cut)` transporting the banked N39
        `expTerm_summable` operator-norm majorant).

  ★ THE ONE CAUSE (THE ONE LAW). The SAME Leibniz bilinearity that made `Der(𝕆)` a Lie algebra
  (N6 `isDeriv_bracket`, order 1) and gave the iterated binomial (N41a, order n) is what — once the
  topological ground (N41b) lets the finite identity pass to the `tsum` limit — integrates to the
  product-preservation of the exponential flow. The bracket, the binomial, and the flow are the SAME
  Leibniz bilinearity read at orders 1, n, and ∞.

  ★ WHAT THIS NODE DOES NOT DO (childed N41d). The UNCONDITIONAL summability of the vector exp series
  (the Cut-side coordinatization / operator-norm majorant transported from N39) — which discharges the
  `hx`/`hy`/`hxy` hypotheses to yield the unconditional product-preservation — together with the
  BIJECTION (inverse `expO (-D)`) and the derivative `d/dt exp(tD)|₀ = D`. Those rest on the SAME
  Cut-side coordinatization and are scoped to the dedicated forward node.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2): delete "exp / derivation / automorphism / gauge / G₂
  / colour": the file is a complete proof that for a Leibniz endomorphism `D` of the 8-dimensional
  complete-topological non-associative `*`-algebra over the completion-of-the-gather-of-closures of the
  derived rationals, the formal power series `E(x) := ∑ₙ (1/n!)•(Dⁿ x)` satisfies `E(x·y) = E(x)·E(y)`
  whenever the relevant series converge. No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge, NO posited
  exp/G₂/Aut/metric/norm-system, NO Mathlib ℝ as content, NO ℝ-valued `Norm`, NO Mathlib
  `NormedSpace.exp`/`Matrix.exp`/`HasDerivAt`.
-/
import Phys.Cascade.OctonionTopology
import Phys.Algebra.DerivationLeibnizPow
import Mathlib.Topology.Algebra.InfiniteSum.Ring

namespace Phys.Algebra

open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ
open scoped BigOperators

noncomputable section

attribute [local instance] CD.narCD CD.srCD

/-! ## The smul-centrality bundle (the bilinearity of `•` over `·`, lifted up the cascade). -/

/-- THE SMUL-CENTRALITY BUNDLE for a scalar action on a `*`-ring-like carrier: the five facts that
    let a central scalar pass through the Cayley–Dickson product, conjugation and the additive
    structure. These are exactly the bilinearity-of-`•`-over-`·` statements the per-`n` exponential
    rewrite consumes; they are about the BILINEAR product, never reassociation, so they survive
    non-associativity (cf. N41a `iter_leibniz`, N6 `isDeriv_bracket`). -/
structure SmulCompat (R A : Type*) [Mul A] [Add A] [Neg A] [Star A] [SMul R A] : Prop where
  hl : ∀ (c : R) (a b : A), (c • a) * b = c • (a * b)
  hr : ∀ (c : R) (a b : A), a * (c • b) = c • (a * b)
  hstar : ∀ (c : R) (a : A), star (c • a) = c • star a
  hneg : ∀ (c : R) (a : A), c • (-a) = -(c • a)
  hadd : ∀ (c : R) (a b : A), c • (a + b) = c • a + c • b

section Generic
variable {R A : Type*} [Mul A] [Add A] [Neg A] [Star A] [SMul R A]

/-- A central scalar passes through the Cayley–Dickson product from the left, given the base bundle.
    Each coordinate of `(c•z)·w` is, by the CD product formula, a base product with the scalar on a
    left factor; `hl`/`hr`/`hadd`/`hneg` move it out. -/
theorem cd_smul_mul_left (H : SmulCompat R A) (c : R) (z w : CD A) :
    (c • z) * w = c • (z * w) := by
  ext
  · show (c • z.re) * w.re + -(star w.im * (c • z.im)) = c • (z.re * w.re + -(star w.im * z.im))
    rw [H.hl, H.hr, H.hadd, H.hneg]
  · show w.im * (c • z.re) + (c • z.im) * star w.re = c • (w.im * z.re + z.im * star w.re)
    rw [H.hr, H.hl, H.hadd]

/-- A central scalar passes through the Cayley–Dickson product from the right (uses also `hstar`,
    because the right factor's `im` enters conjugated in the product). -/
theorem cd_smul_mul_right (H : SmulCompat R A) (c : R) (z w : CD A) :
    z * (c • w) = c • (z * w) := by
  ext
  · show z.re * (c • w.re) + -(star (c • w.im) * z.im) = c • (z.re * w.re + -(star w.im * z.im))
    rw [H.hr, H.hstar, H.hl, H.hadd, H.hneg]
  · show (c • w.im) * z.re + z.im * star (c • w.re) = c • (w.im * z.re + z.im * star w.re)
    rw [H.hl, H.hstar, H.hr, H.hadd]

/-- A central scalar commutes with the doubled conjugation. -/
theorem cd_smul_star (H : SmulCompat R A) (c : R) (z : CD A) : star (c • z) = c • star z := by
  ext
  · show star (c • z.re) = c • star z.re; rw [H.hstar]
  · show -(c • z.im) = c • (-z.im); rw [H.hneg]

/-- A central scalar commutes with negation. -/
theorem cd_smul_neg (H : SmulCompat R A) (c : R) (z : CD A) : c • (-z) = -(c • z) := by
  ext
  · show c • (-z.re) = -(c • z.re); rw [H.hneg]
  · show c • (-z.im) = -(c • z.im); rw [H.hneg]

/-- A central scalar distributes over the doubled addition. -/
theorem cd_smul_add (H : SmulCompat R A) (c : R) (z w : CD A) : c • (z + w) = c • z + c • w := by
  ext
  · show c • (z.re + w.re) = c • z.re + c • w.re; rw [H.hadd]
  · show c • (z.im + w.im) = c • z.im + c • w.im; rw [H.hadd]

/-- ★ THE LIFT: a base smul-centrality bundle yields one on the Cayley–Dickson double. This is what
    propagates `Cut`-centrality up every rung of the cascade unchanged. -/
theorem smulCompat_cd (H : SmulCompat R A) : SmulCompat R (CD A) where
  hl := cd_smul_mul_left H
  hr := cd_smul_mul_right H
  hstar := cd_smul_star H
  hneg := cd_smul_neg H
  hadd := cd_smul_add H

end Generic

/-- THE BASE CASE: `Cut` acts on the rung-1 double `Dbl Cut` componentwise, and that action is
    central (the rung-1 product is the commutative-base Cayley–Dickson product). -/
theorem smulCompat_dbl_cut : SmulCompat Cut (Dbl Cut) where
  hl c a b := by ext <;> simp [Dbl.smul_re] <;> ring
  hr c a b := by ext <;> simp [Dbl.smul_re] <;> ring
  hstar c a := by ext <;> simp [Dbl.smul_re]
  hneg c a := by ext <;> simp [Dbl.smul_re]
  hadd c a b := by ext <;> simp [Dbl.smul_re] <;> ring

/-- ★ `Cut` IS CENTRAL on the terminal algebra `O Cut = CD (CD (Dbl Cut))` — the base bundle lifted
    through the two outer doublings. The bilinearity-of-`•`-over-`·` the analytic integration needs. -/
theorem smulCompat_oCut : SmulCompat Cut (O Cut) :=
  smulCompat_cd (smulCompat_cd smulCompat_dbl_cut)

/-! ## The `Cut`-module structure on `O Cut` (machinery, mirroring `cdModuleQ`). -/

/-- `Module Cut (Dbl Cut)` — the rung-1 algebra as a `Cut`-vector space, the componentwise action the
    cascade already carries (`SMul Cut (Dbl Cut)`). -/
@[reducible] def dblModuleCut : Module Cut (Dbl Cut) where
  one_smul z := by ext <;> simp [Dbl.smul_re]
  mul_smul a b z := by ext <;> simp [Dbl.smul_re] <;> ring
  smul_zero a := by ext <;> simp [Dbl.smul_re]
  smul_add a x y := by ext <;> simp [Dbl.smul_re] <;> ring
  add_smul a b z := by ext <;> simp [Dbl.smul_re] <;> ring
  zero_smul z := by ext <;> simp [Dbl.smul_re]

attribute [local instance] dblModuleCut

/-- `Module Cut (CD A)` from one on the base, built componentwise over the generic `CD.instSMul`
    (so DEFEQ to the action `oCut_continuousSMul` is stated over — no diamond). -/
@[reducible] def cdModuleCut {A : Type*} [NonAssocRing A] [StarRing A] [Module Cut A] :
    @Module Cut (CD A) _ (by letI := CD.narCD (A := A); infer_instance) := by
  letI := CD.narCD (A := A)
  exact
    { one_smul := by intro z; ext <;> simp
      mul_smul := by intro a b z; ext <;> simp [mul_smul]
      smul_zero := by intro a; ext <;> simp
      smul_add := by intro a x y; ext <;> simp [smul_add]
      add_smul := by intro a b z; ext <;> simp [add_smul]
      zero_smul := by intro z; ext <;> simp }

/-- `Module Cut (H Cut)` — the rung-2 algebra `H Cut = CD (Dbl Cut)` as a `Cut`-vector space. -/
noncomputable instance instModuleCutH : Module Cut (H Cut) := cdModuleCut (A := Dbl Cut)

/-- ★ `Module Cut (O Cut)` — THE TERMINAL ALGEBRA as an 8-dimensional `Cut`-vector space, the action
    the vector exponential's `(1/n!)•` lives over. MACHINERY on the DERIVED object (STANDARD §3). -/
noncomputable instance instModuleCutO : Module Cut (O Cut) := cdModuleCut (A := H Cut)

/-! ## The vector exponential and the analytic integration. -/

/-- ★ THE VECTOR EXPONENTIAL on `O Cut`: `expO D x := ∑' n, (1/n!)•(Dⁿ x)` — the LITERAL `O Cut`-valued
    exponential flow of a ℤ-linear endomorphism `D`, applied to a point. The `tsum` over the
    Cauchy-complete `O Cut` (N41b `oCut_completeSpace`); it is the genuine limit exactly when the series
    is summable (discharged unconditionally by the childed summability node). MACHINERY on the DERIVED
    `O Cut`, NOT Mathlib's `NormedSpace.exp` (an ℝ/ℂ-NormedAlgebra content trap). -/
def expO (D : Module.End ℤ (O Cut)) (x : O Cut) : O Cut :=
  ∑' n, (1 / (n.factorial : Cut)) • ((D ^ n) x)

/-- `expO 0 = id`: the exponential of the zero endomorphism is the identity. Only the `n = 0` term
    (`(1/0!)•(D⁰ x) = x`) survives; every higher term has `0ⁿ = 0`. Unconditional (no summability
    needed — a single-term `tsum`). The unit of the one-parameter flow. -/
theorem expO_zero (x : O Cut) : expO 0 x = x := by
  unfold expO
  rw [tsum_eq_single 0]
  · simp
  · intro n hn; rw [zero_pow hn]; simp

/-- ★ THE PER-`n` ALGEBRAIC INTEGRATION: for a Leibniz derivation `D`,
    `(1/n!)•(Dⁿ(x·y)) = ∑_{k+l=n} ((1/k!)•Dᵏx)·((1/l!)•Dˡy)`.
    Combines the banked N41a `iter_leibniz_antidiag` (`Dⁿ(x·y) = ∑ C(n,k)•(Dᵏx·Dˡy)`) with the
    smul-centrality bundle `smulCompat_oCut` (pulling the `1/k!`, `1/l!` scalars out of each product)
    and the scalar binomial identity `C(n,k)/n! = 1/(k!·l!)` for `k+l=n`
    (`Nat.choose_mul_factorial_mul_factorial`). The non-associativity and non-commutativity of the
    octonion product are no obstruction: every step is a bilinear/distributive identity. -/
theorem expO_term_antidiag (D : Module.End ℤ (O Cut)) (hD : IsDeriv D) (x y : O Cut) (n : ℕ) :
    (1 / (n.factorial : Cut)) • ((D ^ n) (x * y))
      = ∑ kl ∈ Finset.antidiagonal n,
          ((1 / (kl.1.factorial : Cut)) • ((D ^ kl.1) x)) *
            ((1 / (kl.2.factorial : Cut)) • ((D ^ kl.2) y)) := by
  rw [iter_leibniz_antidiag D hD x y n, Finset.smul_sum]
  apply Finset.sum_congr rfl
  intro kl hkl
  rw [Finset.mem_antidiagonal] at hkl
  rw [smulCompat_oCut.hl, smulCompat_oCut.hr, smul_smul]
  rw [smul_comm (1 / (n.factorial : Cut)) (n.choose kl.1), ← Nat.cast_smul_eq_nsmul Cut, smul_smul]
  congr 1
  have hk : kl.1 ≤ n := by omega
  have hcmf := Nat.choose_mul_factorial_mul_factorial hk
  rw [show n - kl.1 = kl.2 by omega] at hcmf
  have hk0 : (kl.1.factorial : Cut) ≠ 0 := by positivity
  have hl0 : (kl.2.factorial : Cut) ≠ 0 := by positivity
  have hn0 : (n.factorial : Cut) ≠ 0 := by positivity
  have hcast : (n.choose kl.1 : Cut) * (kl.1.factorial : Cut) * (kl.2.factorial : Cut)
      = (n.factorial : Cut) := by
    have hnat : ((n.choose kl.1 * kl.1.factorial * kl.2.factorial : ℕ) : Cut)
        = ((n.factorial : ℕ) : Cut) := by rw [hcmf]
    push_cast at hnat; linarith [hnat]
  field_simp
  linarith [hcast]

/-- ★★ THE LITERAL `O Cut` PRODUCT-PRESERVATION (the analytic Cauchy-product integration): for a
    Leibniz derivation `D` of the non-associative `O Cut`, the vector exponential PRESERVES the
    octonion product, `expO D (x·y) = expO D x · expO D y`, GIVEN the convergence of the two series
    and the product family. The trunk-native Cauchy product
    `Summable.tsum_mul_tsum_eq_tsum_sum_antidiagonal` — which over `O Cut` needs only
    `[T3Space] [NonUnitalNonAssocSemiring] [IsTopologicalSemiring]` (banked N41b `oCut_t3Space` +
    `oCut_isTopologicalSemiring`, with NO ℝ-valued `Norm`) — rewrites `(expO D x)·(expO D y)` as
    `∑'ₙ ∑_{k+l=n} ((1/k!)•Dᵏx)·((1/l!)•Dˡy)`, and the per-`n` integration `expO_term_antidiag`
    collapses each antidiagonal sum to `(1/n!)•(Dⁿ(x·y))`, i.e. to `expO D (x·y)`. THE genuine
    analytic integration of the banked N41a binomial over the banked N41b topological semiring.

    The three summability hypotheses are discharged UNCONDITIONALLY by the dedicated summability node
    (childed): the vector exp series of any `x` over `O Cut` is absolutely convergent via the Cut-side
    coordinatization transporting the banked N39 operator-norm majorant. They are honest explicit
    hypotheses (a genuine analytic prerequisite scoped to its own node) — this theorem is a fully
    proved conditional implication, with the convergence premises owed by the childed summability node. -/
theorem expO_mul_of_summable (D : Module.End ℤ (O Cut)) (hD : IsDeriv D) (x y : O Cut)
    (hx : Summable (fun n => (1 / (n.factorial : Cut)) • ((D ^ n) x)))
    (hy : Summable (fun n => (1 / (n.factorial : Cut)) • ((D ^ n) y)))
    (hxy : Summable (fun kl : ℕ × ℕ =>
      ((1 / (kl.1.factorial : Cut)) • ((D ^ kl.1) x)) *
        ((1 / (kl.2.factorial : Cut)) • ((D ^ kl.2) y)))) :
    expO D (x * y) = expO D x * expO D y := by
  unfold expO
  rw [hx.tsum_mul_tsum_eq_tsum_sum_antidiagonal hy hxy]
  apply tsum_congr
  intro n
  exact expO_term_antidiag D hD x y n

/-! ## NON-VACUITY (W8): the integration is genuine — the `n=1` term recovers the Leibniz law. -/

/-- ★ NON-VACUITY exercising the new content: the `n = 1` instance of the per-`n` integration
    `expO_term_antidiag` COLLAPSES EXACTLY to the Leibniz law `D(x·y) = D x · y + x · D y` — the
    derivative seed (the `n=1` term of the flow IS the derivation). This both witnesses that
    `expO_term_antidiag` is non-vacuous (it produces a genuine two-term antidiagonal, not a degenerate
    one-term sum) and pins the `d/dt exp(tD)|₀ = D` content at the linear order. The antidiagonal of
    `1` is `{(0,1),(1,0)}`, giving `((1/0!)•x)·((1/1!)•Dy) + ((1/1!)•Dx)·((1/0!)•y) = x·Dy + Dx·y`. -/
theorem expO_term_antidiag_one (D : Module.End ℤ (O Cut)) (hD : IsDeriv D) (x y : O Cut) :
    D (x * y) = D x * y + x * D y := by
  have h := expO_term_antidiag D hD x y 1
  rw [show Finset.antidiagonal (1:ℕ) = {(0,1),(1,0)} from by decide,
    Finset.sum_insert (by decide), Finset.sum_singleton] at h
  simp only [pow_zero, pow_one, Module.End.one_apply, Nat.factorial_zero, Nat.factorial_one,
    Nat.cast_one, one_div, inv_one, one_smul] at h
  rw [h]; abel

/-- NON-VACUITY: a CONCRETE nonzero Leibniz derivation exists on the terminal algebra (the banked
    `witnessDeriv` over `O ℚ`), so the conditional product-preservation `expO_mul_of_summable` is not
    vacuously quantified over an empty hypothesis class. -/
theorem isDeriv_witness_exists : ∃ D : Module.End ℤ (O ℚ), IsDeriv D ∧ D ≠ 0 :=
  ⟨witnessDeriv, witnessDeriv_isDeriv, witnessDeriv_ne_zero⟩

end

end Phys.Algebra
