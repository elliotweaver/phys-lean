/-
  # N41a — THE ITERATED LEIBNIZ BINOMIAL over the non-associative octonion algebra (increment 11, part a).

  N40 (`Phys/Algebra/DerivationAutExpHom.lean`) banked the GROUP LAW of the matrix exponential
  `expMap D = ∑' n, expTerm D n` over the derived ℝ: `exp(A)·exp(B) = exp(A+B)` for commuting
  `A`, `B` (whence invertibility, the GL-landing). N40 also reframed (THE ONE LAW): the literal
  `exp(D) ∈ AutO` is type-incoherent (`AutO` is over ℚ, `exp(D)` has transcendental `Cut` entries),
  so the remaining genuine content of "the exponential lands in the AUTOMORPHISM group" is that the
  exponential FLOW PRESERVES THE PRODUCT of the algebra itself: `exp(D)(xy) = exp(D)(x)·exp(D)(y)`.

  THIS file banks the ALGEBRAIC CORE of that product-preservation, the piece that needs NO topology,
  NO coordinates, NO completeness — only the Leibniz law and the binomial combinatorics: the
  ITERATED LEIBNIZ RULE. For a Leibniz-derivation `D` of the Cayley–Dickson double-of-a-double
  `CD (CD B)` (`O R = CD (H R) = CD (CD (Dbl R))`, so this applies verbatim to `O Cut`),

      `Dⁿ(x·y) = ∑_{k+l=n} C(n,k) · (Dᵏx · Dˡy)`.

  This is the algebra-side analogue of the banked matrix-side `expTerm_antidiagonal`
  (`∑_{k+l=n} expTerm A k · expTerm B l = expTerm (A+B) n`). Where that one used `Commute.add_pow'`
  on the ASSOCIATIVE matrix ring, here we CANNOT — the octonion product is non-associative AND the two
  factors `Dᵏx`, `Dˡy` do not commute. So the binomial is proved by a DIRECT induction, mirroring
  Mathlib's `Commute.add_pow` Pascal argument, but driven by the Leibniz split
  `D(Dᵏx · Dˡy) = D^{k+1}x · Dˡy + Dᵏx · D^{l+1}y` (THE only place `IsDeriv` enters) and a pure
  ℕ-scalar Pascal identity `pascal_smul_sum` on the binomial coefficients.

  ★ THE ONE CAUSE (THE ONE LAW). The SAME Leibniz law that made `Der(𝕆)` a Lie algebra under the
  commutator (`Phys/Algebra/Derivation.lean`, `isDeriv_bracket`, which used ONLY bilinearity +
  Leibniz, never associativity) is what integrates to the binomial expansion of the flow on a
  product. The derivation-is-a-Lie-algebra fact and the flow-preserves-the-product fact are the SAME
  Leibniz bilinearity read at two orders: order 1 (the bracket) and order n (the binomial).

  ★ WHY NON-ASSOCIATIVITY IS NO OBSTRUCTION (the trunk reframe, RUNBOOK W1). The iterated Leibniz
  rule is a statement about the BILINEAR product, not the associative structure: every step expands
  `D(u · v)` into `Du · v + u · Dv` by distributivity + Leibniz alone. No associator ever appears,
  exactly as in the bracket-closure proof. This is why the automorphism flow survives on the
  non-associative `𝕆` — the same reason the derivation Lie algebra does.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2): delete "derivation / automorphism / gauge / exp":
  the file is a complete proof that for a Leibniz endomorphism `D` of the Cayley–Dickson double of a
  double, the `n`-th iterate on a product expands by the binomial law `Dⁿ(xy) = ∑ C(n,k) Dᵏx·Dˡy`.
  No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.Derivation
import Mathlib.Algebra.BigOperators.NatAntidiagonal
import Mathlib.Data.Nat.Choose.Sum

namespace Phys.Algebra

open Phys.Cascade Finset
open scoped BigOperators

noncomputable section

attribute [local instance] CD.narCD CD.srCD

/-! ## The pure Pascal `ℕ`-scalar identity (the combinatorial heart, algebra-free). -/

/-- THE PASCAL ℕ-SCALAR IDENTITY. For any sequence `g : ℕ → M` into an additive commutative
    monoid, the `x`-shifted binomial sum plus the `y`-shifted binomial sum collapse, via Pascal's
    rule `C(N+1,m+1) = C(N,m) + C(N,m+1)`, into the next-order binomial sum:
    `∑_{m≤N} C(N,m)•g(m+1) + ∑_{m≤N} C(N,m)•g m = ∑_{m≤N+1} C(N+1,m)•g m`.
    This is the algebra-free combinatorial core that drives the induction step of the iterated
    Leibniz rule (and is the additive-monoid analogue of the engine of Mathlib's `Commute.add_pow`).
    Machinery on `ℕ`-indexed sums, NOT a posited number system: `ℕ` here is the iteration count of
    the fold's re-entry (the index of `Dⁿ`), the metalanguage arity, not a content ground ring. -/
theorem pascal_smul_sum {M : Type*} [AddCommMonoid M] (g : ℕ → M) (N : ℕ) :
    (∑ m ∈ range (N + 1), (N.choose m) • g (m + 1))
      + (∑ m ∈ range (N + 1), (N.choose m) • g m)
    = ∑ m ∈ range (N + 2), ((N + 1).choose m) • g m := by
  rw [Finset.sum_range_succ' (fun m => ((N + 1).choose m) • g m) (N + 1)]
  simp only [Nat.choose_zero_right, one_nsmul]
  have hpascal : ∀ m ∈ range (N + 1),
      ((N + 1).choose (m + 1)) • g (m + 1)
        = (N.choose m) • g (m + 1) + (N.choose (m + 1)) • g (m + 1) := by
    intro m _
    rw [Nat.choose_succ_succ' N m, add_nsmul]
  rw [Finset.sum_congr rfl hpascal, Finset.sum_add_distrib, add_assoc]
  congr 1
  rw [Finset.sum_range_succ' (fun m => (N.choose m) • g m) N]
  simp only [Nat.choose_zero_right, one_nsmul]
  congr 1
  rw [Finset.sum_range_succ (fun m => (N.choose (m + 1)) • g (m + 1)) N]
  simp [Nat.choose_succ_self]

section Deriv
variable {B : Type*} [CommRing B] [StarRing B]
variable (D : Module.End ℤ (CD (CD B)))

/-! ## The single-step facts (power-successor and the Leibniz product split). -/

/-- `D^(n+1) x = D (Dⁿ x)`: the successor of an endomorphism power applied to a point, peeled from
    the left (so the iteration agrees with applying `D` once more to the previous iterate). -/
theorem dpow_succ_apply (x : CD (CD B)) (n : ℕ) : (D ^ (n + 1)) x = D ((D ^ n) x) := by
  rw [_root_.pow_succ']; rfl

/-- ★ THE LEIBNIZ PRODUCT SPLIT (the ONLY place `IsDeriv` enters): applying the derivation to a
    scaled product `c • (Dᵏx · Dˡy)` splits it into the two shifted terms
    `c • (D^{k+1}x · Dˡy) + c • (Dᵏx · D^{l+1}y)`. Pure Leibniz + bilinearity; NO associativity. -/
theorem dterm_split (hD : IsDeriv D) (x y : CD (CD B)) (c k l : ℕ) :
    D (c • ((D ^ k) x * (D ^ l) y))
      = c • ((D ^ (k + 1)) x * (D ^ l) y) + c • ((D ^ k) x * (D ^ (l + 1)) y) := by
  rw [map_nsmul, hD ((D ^ k) x) ((D ^ l) y), ← dpow_succ_apply, ← dpow_succ_apply, smul_add]

/-! ## The iterated Leibniz binomial. -/

/-- ★★ THE ITERATED LEIBNIZ BINOMIAL (range form): for a Leibniz-derivation `D` of the
    non-associative `CD (CD B)`,
    `Dⁿ(x·y) = ∑_{m≤n} C(n,m)·(Dᵐx · D^{n-m}y)`.
    Proved by induction on `n`, mirroring Mathlib's `Commute.add_pow`: the successor step applies `D`
    to the inductive sum, splits each term by `dterm_split` (Leibniz), reindexes the two shifted
    families to a common `g k = Dᵏx · D^{n+1-k}y`, and collapses them by the Pascal scalar identity
    `pascal_smul_sum`. The non-associativity and non-commutativity of the octonion product are no
    obstruction: every step is a bilinear distributive identity, never an associative one. -/
theorem iter_leibniz_range (hD : IsDeriv D) (x y : CD (CD B)) (n : ℕ) :
    (D ^ n) (x * y)
      = ∑ m ∈ range (n + 1), (n.choose m) • ((D ^ m) x * (D ^ (n - m)) y) := by
  induction n with
  | zero => simp
  | succ N ih =>
      rw [dpow_succ_apply, ih, map_sum]
      have hsplit : ∀ m ∈ range (N + 1),
          D ((N.choose m) • ((D ^ m) x * (D ^ (N - m)) y))
            = (N.choose m) • ((D ^ (m + 1)) x * (D ^ (N - m)) y)
              + (N.choose m) • ((D ^ m) x * (D ^ (N - m + 1)) y) := by
        intro m _
        rw [dterm_split D hD x y (N.choose m) m (N - m)]
      rw [Finset.sum_congr rfl hsplit, Finset.sum_add_distrib]
      have hL1 : (∑ m ∈ range (N + 1), (N.choose m) • ((D ^ (m + 1)) x * (D ^ (N - m)) y))
          = ∑ m ∈ range (N + 1),
              (N.choose m) • ((fun k => (D ^ k) x * (D ^ (N + 1 - k)) y) (m + 1)) := by
        apply Finset.sum_congr rfl
        intro m hm
        rw [mem_range] at hm
        have : N + 1 - (m + 1) = N - m := by omega
        simp only [this]
      have hL2 : (∑ m ∈ range (N + 1), (N.choose m) • ((D ^ m) x * (D ^ (N - m + 1)) y))
          = ∑ m ∈ range (N + 1),
              (N.choose m) • ((fun k => (D ^ k) x * (D ^ (N + 1 - k)) y) m) := by
        apply Finset.sum_congr rfl
        intro m hm
        rw [mem_range] at hm
        have : N + 1 - m = N - m + 1 := by omega
        simp only [this]
      rw [hL1, hL2, pascal_smul_sum (fun k => (D ^ k) x * (D ^ (N + 1 - k)) y) N]

/-- ★ THE ITERATED LEIBNIZ BINOMIAL (antidiagonal form): the same fact summed over the antidiagonal
    `{(k,l) : k+l=n}`, matching the shape of the banked matrix-side `expTerm_antidiagonal`. This is
    the form the downstream Cauchy product (the analytic integration step) will consume. Reduces to
    `iter_leibniz_range` by `Finset.Nat.sum_antidiagonal_eq_sum_range_succ`. -/
theorem iter_leibniz_antidiag (hD : IsDeriv D) (x y : CD (CD B)) (n : ℕ) :
    (D ^ n) (x * y)
      = ∑ kl ∈ Finset.antidiagonal n, (n.choose kl.1) • ((D ^ kl.1) x * (D ^ kl.2) y) := by
  rw [Finset.Nat.sum_antidiagonal_eq_sum_range_succ
        (fun k l => (n.choose k) • ((D ^ k) x * (D ^ l) y)) n]
  exact iter_leibniz_range D hD x y n

end Deriv

/-! ## NON-VACUITY (W8): the binomial is genuine — the `n=2` instance has a real cross-term. -/

/-- NON-VACUITY: at `n = 2` the iterated Leibniz rule has the genuine middle (cross) term
    `2 • (Dx · Dy)`, not a degenerate one — `D²(xy) = D²x·y + 2•(Dx·Dy) + x·D²y`. Witnesses that the
    binomial coefficients are doing real work (the `C(2,1)=2` term is present), so the theorem is not
    a vacuous restatement of a one-term sum. -/
theorem iter_leibniz_two {B : Type*} [CommRing B] [StarRing B]
    (D : Module.End ℤ (CD (CD B))) (hD : IsDeriv D) (x y : CD (CD B)) :
    (D ^ 2) (x * y)
      = (D ^ 2) x * y + (2 : ℕ) • (D x * D y) + x * (D ^ 2) y := by
  rw [iter_leibniz_range D hD x y 2]
  simp [Finset.sum_range_succ, pow_zero, pow_one, Nat.choose]
  ring_nf
  abel

end

end Phys.Algebra
