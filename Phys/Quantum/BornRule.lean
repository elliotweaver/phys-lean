/-
  Phys.Quantum.BornRule — N393 (arc-J J3): KÄHLER COMPATIBILITY ⇒ THE BORN RULE.
  (★ THE CAPSTONE / THE MARQUEE OF ARC J.)
  ===========================================================================
  THE THIRD NODE OF ARC J — the foundations of quantum mechanics. Arc J derives
  the Born rule as a THEOREM. J1 (N391, `PrimitiveFibre.lean`) banked the RAW 2D
  real fibre `StateFibre = Cut × Cut` with its POSITIVE-DEFINITE self-overlap
  `bornForm` (the metric `g`) and orthonormal frame `eInward`/`eOutward`. J2
  (N392, `ComplexStructure.lean`) DERIVED the complex structure `foldComplex`
  (`J² = −1`, its sign forced by self-blindness; `J` IS the banked cascade unit
  `J₂`, N2 — the chain is unbroken). This node (J3) is the CAPSTONE: it derives
  that the metric `g`, the complex structure `J`, and the symplectic form `ω`
  COHERE (Kähler compatibility), so the fibre is a complex inner-product space and
  the transition probability IS the Born-square of the inner product. This RETIRES
  "Born = self-overlap" — used as a TRUNK PRIMITIVE all through arcs A–I — from
  assumed-primitive to DERIVED-theorem, closing the deepest self-consistency loop
  in the whole program.

  ── THE FORWARD DERIVATION (fold → the Born rule; nothing posited) ──
  The banked metric `g = bornForm` (Born = self-overlap positivity, N391) and the
  banked complex structure `J = foldComplex` (`i` = the fold's chirality, N392)
  live on the SAME concrete fibre. The Born rule falls out in three movements:

    · KÄHLER COMPATIBILITY (the metric and `J` cohere). The fold's own self-overlap
      `g` is INVARIANT under `J` (`g(Jx, Jy) = g(x, y)` — `J` is a `g`-isometry) and
      `J` is `g`-SKEW (`g(Jx, y) = −g(x, Jy)`). Define the symplectic form
      `ω(x, y) := g(Jx, y)`; it is antisymmetric. Metric + complex structure +
      symplectic form cohere — this is the Kähler triangle, DERIVED from the explicit
      banked forms, not assumed.
    · THE HERMITIAN INNER PRODUCT (`g + i·ω`, over the DERIVED complex algebra). The
      fibre `Cut × Cut` IS the banked cascade complex algebra `Dbl Cut` (N2) via
      `toDbl`, and the fibre's `J` IS multiplication by the banked complex unit
      `Dbl.J` (`toDbl_foldComplex`). The Hermitian inner product `⟨z|w⟩ = z̄ · w`
      over `Dbl Cut` has REAL part `g` and IMAGINARY part `ω` (`hInner_re`,
      `hInner_im`): `⟨φ|ψ⟩ = g(φ,ψ) + i·ω(φ,ψ)`. Conjugate-symmetry `⟨w|z⟩ = ⟨z|w⟩̄`
      holds. So the derived state space is a complex inner-product space, DERIVED.
    · THE BORN RULE (modulus-square = self-overlap, DERIVED). The transition
      probability is the modulus-square of the amplitude, `bornProb φ ψ :=
      g(φ,ψ)² + ω(φ,ψ)²`. Two facts retire the primitive:
        (a) `bornProb = |⟨φ|ψ⟩|²` — the norm-square of the Hermitian inner product
            over the DERIVED complex algebra (`bornProb_eq_dblNormSq`); and
        (b) ★ THE RETIREMENT: `bornProb φ ψ = bornForm (⟨amplitude⟩) (⟨amplitude⟩)`
            — the transition probability IS the RAW self-overlap `bornForm` (N391,
            the trunk primitive) of the complex overlap amplitude `(g, ω)`
            (`bornProb_eq_self_overlap_of_amplitude`). "Born = self-overlap",
            ASSUMED at the real level all through A–I, is now the THEOREM that the
            probability equals the self-overlap of the derived complex amplitude.
      The Born-square is nonnegative (`bornProb_nonneg` — the SAME trunk positivity),
      equals `g(φ,φ)²` on the diagonal (`bornProb_self`), is `1` on a unit state, and
      — since the primitive probe fibre is ONE complex dimension — satisfies the
      structural identity `|⟨φ|ψ⟩|² = |φ|²·|ψ|²` (`bornProb_eq_mul_normSq`, the 1-dim
      Cauchy–Schwarz equality).

  ⇒ the Born rule is DERIVED: the transition probability `|⟨φ|ψ⟩|²` over the
    fold-derived complex inner-product structure IS the fold's own self-overlap of
    the complex overlap amplitude. `i` is the fold's chirality (N392); "probability"
    is the fold's self-overlap positivity (N1/N391); modulus-square is self-overlap.
    Nothing is posited — no Hilbert space, no complex field, no probability postulate.

  WHAT IS BANKED HERE (forward, foundations-only):
    kahlerForm                      — ω(x,y) := g(Jx, y), the symplectic/Kähler form.
    kahlerForm_apply                — ω(x,y) = x₁y₂ − x₂y₁ (explicit form).
    bornForm_foldComplex_invariant  — ★ `g(Jx, Jy) = g(x, y)` (J is a g-isometry, Kähler).
    foldComplex_skew_adjoint        — ★ `g(Jx, y) = −g(x, Jy)` (J is g-skew, Kähler).
    kahlerForm_antisymm             — ω is antisymmetric.
    kahlerForm_self                 — ω(x,x) = 0.
    toDbl                           — StateFibre ≅ the banked complex algebra `Dbl Cut` (N2).
    toDbl_foldComplex               — ★ the fibre's J IS mult by the banked complex unit `Dbl.J`.
    dblConj / hInner                — conjugation and the Hermitian inner product `z̄·w` on `Dbl Cut`.
    hInner_re / hInner_im           — ★ `⟨φ|ψ⟩ = g(φ,ψ) + i·ω(φ,ψ)` (real part g, imag part ω).
    hInner_conj_symm                — `⟨w|z⟩ = ⟨z|w⟩̄` (Hermitian conjugate-symmetry).
    dblNormSq / bornProb            — the modulus-square; the transition probability g² + ω².
    bornProb_eq_dblNormSq           — `bornProb = |⟨φ|ψ⟩|²` (Born-square of the inner product).
    bornProb_eq_self_overlap_of_amplitude — ★★ THE RETIREMENT: Born-square = raw self-overlap
                                      (`bornForm`, N391) of the amplitude — the primitive is now a theorem.
    bornProb_nonneg                 — the Born-square is ≥ 0 (the trunk positivity again).
    bornProb_self                   — `bornProb φ φ = g(φ,φ)²`.
    bornProb_eInward_self           — `bornProb eInward eInward = 1` (unit state).
    bornProb_eInward_eOutward       — ★ [W8] `= 1` — eOutward = J(eInward) is the SAME complex ray,
                                      probability carried ENTIRELY by ω (a "Born = g²" misreading gives 0 ≠ 1).
    bornProb_eq_mul_normSq          — `|⟨φ|ψ⟩|² = |φ|²·|ψ|²` (1-complex-dim Cauchy–Schwarz equality).
    born_rule_derived               — ★★ THE CAPSTONE: Kähler compatibility, the Hermitian inner
                                      product `g + iω`, and Born = self-overlap of the amplitude — bundled.

  SCOPE (docs/RUNBOOK.md W4.5). This node derives EXACTLY J3: Kähler compatibility ⇒
  the Born-square as the derived complex inner-product's modulus-square = the raw
  self-overlap of the amplitude. It does NOT derive J4's measurement/decoherence
  (the gather/collapse). The primitive probe fibre is ONE complex dimension, so
  `|⟨φ|ψ⟩|² = |φ|²·|ψ|²` is the 1-dim structural identity — NOT a multi-dimensional
  Hilbert-space Cauchy–Schwarz claim (that lives above, with the sector tensor
  structure of J5/arc K). No probability MEASURE / normalization-to-1-over-outcomes
  is claimed here beyond the single-amplitude modulus-square.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "quantum / Born / probability
  / amplitude / transition / Hilbert / measurement": what remains is the pure
  statement that the banked positive-definite symmetric form `bornForm` on the banked
  2D carrier is INVARIANT under and SKEW with respect to the banked operator
  `foldComplex`, so with `ω(x,y) := bornForm(foldComplex x, y)` the pairing
  `bornForm + i·ω` is a conjugate-symmetric (Hermitian) form over the banked doubling
  algebra `Dbl Cut`, and the sum of squares `bornForm(x,y)² + ω(x,y)²` equals the raw
  self-overlap `bornForm` of the pair `(bornForm(x,y), ω(x,y))` and equals
  `bornForm(x,x)·bornForm(y,y)`. No theorem STATEMENT needs a physics word to be true.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
  Built on the BANKED derived ℝ `Cut`, the banked self-overlap `bornForm` (N391), the
  banked complex structure `foldComplex`/`J₂` (N392), and the banked cascade complex
  algebra `Dbl Cut` (N2) — NO Mathlib `Real` / `Complex` as content, NO posited
  Hilbert space, NO posited probability postulate.
-/
import Mathlib.Tactic
import Phys.Foundation.Fold
import Phys.Cascade.ComplexUnit
import Phys.Quantum.PrimitiveFibre
import Phys.Quantum.ComplexStructure

namespace Phys.Quantum

open Phys.Foundation Phys.Cascade Module
open Phys.Foundation.ContinuumQ

/-! ## The symplectic / Kähler form `ω(x,y) := g(Jx, y)` on the banked fibre. -/

/-- THE SYMPLECTIC / KÄHLER FORM. Read the banked self-overlap `g = bornForm` (N391)
    through the banked complex structure `J = foldComplex` (N392): `ω(x,y) := g(Jx, y)`.
    This is the imaginary part of the Hermitian inner product (`hInner_im`). -/
noncomputable def kahlerForm (x y : StateFibre) : ContinuumQ.Cut := bornForm (foldComplex x) y

/-- The explicit form of `ω`: `ω(x,y) = x₁·y₂ − x₂·y₁`. -/
theorem kahlerForm_apply (x y : StateFibre) :
    kahlerForm x y = x.1 * y.2 - x.2 * y.1 := by
  unfold kahlerForm bornForm; simp only [foldComplex_apply]; ring

/-! ## Kähler compatibility — the metric `g`, the complex structure `J`, and `ω` cohere. -/

/-- ★ KÄHLER COMPATIBILITY (isometry). The banked self-overlap `g = bornForm` is
    INVARIANT under the banked complex structure `J = foldComplex`: `g(Jx, Jy) = g(x, y)`.
    The fold's own metric does not see the fold's chirality — `J` is a `g`-isometry. -/
theorem bornForm_foldComplex_invariant (x y : StateFibre) :
    bornForm (foldComplex x) (foldComplex y) = bornForm x y := by
  unfold bornForm; simp only [foldComplex_apply]; ring

/-- ★ KÄHLER COMPATIBILITY (skew-adjointness). The banked complex structure `J` is
    `g`-SKEW: `g(Jx, y) = −g(x, Jy)`. Together with the isometry above this is the
    Kähler triangle relating `g`, `J`, and `ω(x,y) = g(Jx,y)`. -/
theorem foldComplex_skew_adjoint (x y : StateFibre) :
    bornForm (foldComplex x) y = - bornForm x (foldComplex y) := by
  unfold bornForm; simp only [foldComplex_apply]; ring

/-- The Kähler form is ANTISYMMETRIC: `ω(x,y) = −ω(y,x)` — the associated symplectic form. -/
theorem kahlerForm_antisymm (x y : StateFibre) :
    kahlerForm x y = - kahlerForm y x := by
  rw [kahlerForm_apply, kahlerForm_apply]; ring

/-- The Kähler form vanishes on the diagonal: `ω(x,x) = 0`. -/
theorem kahlerForm_self (x : StateFibre) : kahlerForm x x = 0 := by
  rw [kahlerForm_apply]; ring

/-! ## The fibre IS the banked complex algebra `Dbl Cut`; `J` is mult by the complex unit. -/

/-- The banked 2D fibre `StateFibre = Cut × Cut` viewed as the banked cascade complex
    algebra `Dbl Cut` (N2) — first component the real part, second the imaginary part. -/
noncomputable def toDbl (p : StateFibre) : Dbl ContinuumQ.Cut := ⟨p.1, p.2⟩

@[simp] theorem toDbl_re (p : StateFibre) : (toDbl p).re = p.1 := rfl
@[simp] theorem toDbl_im (p : StateFibre) : (toDbl p).im = p.2 := rfl

/-- ★ THE JOINT — the fibre's complex structure IS multiplication by the banked complex
    unit. `toDbl (J p) = Dbl.J * toDbl p`: the fibre's `foldComplex` (N392) and the
    algebra's complex unit `Dbl.J` (`Dbl.J_mul_J : J*J = −1`, N2) are the SAME operation.
    The chain is unbroken from the Born rule back through the cascade root. -/
theorem toDbl_foldComplex (p : StateFibre) :
    toDbl (foldComplex p) = Dbl.J * toDbl p := by
  apply Dbl.ext <;> simp [toDbl, foldComplex_apply, Dbl.J]

/-! ## The Hermitian inner product `⟨z|w⟩ = z̄·w = g + i·ω` over the derived complex algebra. -/

/-- CONJUGATION on the banked complex algebra `Dbl Cut`: the reversal of the fold's
    chirality, `(re, im) ↦ (re, −im)`. (Physicist reads: complex conjugation.) -/
noncomputable def dblConj (z : Dbl ContinuumQ.Cut) : Dbl ContinuumQ.Cut := ⟨z.re, -z.im⟩

@[simp] theorem dblConj_re (z : Dbl ContinuumQ.Cut) : (dblConj z).re = z.re := rfl
@[simp] theorem dblConj_im (z : Dbl ContinuumQ.Cut) : (dblConj z).im = -z.im := rfl

/-- THE HERMITIAN INNER PRODUCT over the derived complex algebra: `⟨z|w⟩ := z̄ · w`. -/
noncomputable def hInner (z w : Dbl ContinuumQ.Cut) : Dbl ContinuumQ.Cut := dblConj z * w

/-- ★ THE REAL PART of the Hermitian inner product is the banked self-overlap `g`:
    `Re⟨φ|ψ⟩ = g(φ, ψ)`. -/
theorem hInner_re (φ ψ : StateFibre) :
    (hInner (toDbl φ) (toDbl ψ)).re = bornForm φ ψ := by
  unfold hInner bornForm
  simp only [Dbl.mul_re, dblConj_re, dblConj_im, toDbl_re, toDbl_im]; ring

/-- ★ THE IMAGINARY PART of the Hermitian inner product is the Kähler form `ω`:
    `Im⟨φ|ψ⟩ = ω(φ, ψ)`. Together with `hInner_re`: `⟨φ|ψ⟩ = g(φ,ψ) + i·ω(φ,ψ)`. -/
theorem hInner_im (φ ψ : StateFibre) :
    (hInner (toDbl φ) (toDbl ψ)).im = kahlerForm φ ψ := by
  rw [kahlerForm_apply]; unfold hInner
  simp only [Dbl.mul_im, dblConj_re, dblConj_im, toDbl_re, toDbl_im]; ring

/-- HERMITIAN CONJUGATE-SYMMETRY: `⟨w|z⟩ = ⟨z|w⟩̄`. The derived state space is a genuine
    complex inner-product space. -/
theorem hInner_conj_symm (z w : Dbl ContinuumQ.Cut) :
    hInner w z = dblConj (hInner z w) := by
  apply Dbl.ext <;> simp [hInner, dblConj] <;> ring

/-! ## The Born rule — the modulus-square IS the raw self-overlap of the amplitude. -/

/-- The modulus-square (self-overlap) on the banked complex algebra `Dbl Cut`. -/
noncomputable def dblNormSq (z : Dbl ContinuumQ.Cut) : ContinuumQ.Cut := z.re ^ 2 + z.im ^ 2

/-- THE TRANSITION PROBABILITY (the Born-square): `bornProb φ ψ := g(φ,ψ)² + ω(φ,ψ)²`,
    the modulus-square of the complex overlap amplitude `g + i·ω`. -/
noncomputable def bornProb (φ ψ : StateFibre) : ContinuumQ.Cut :=
  (bornForm φ ψ) ^ 2 + (kahlerForm φ ψ) ^ 2

/-- THE BORN-SQUARE OF THE INNER PRODUCT: `bornProb = |⟨φ|ψ⟩|²`, the modulus-square of the
    Hermitian inner product over the DERIVED complex algebra `Dbl Cut`. -/
theorem bornProb_eq_dblNormSq (φ ψ : StateFibre) :
    bornProb φ ψ = dblNormSq (hInner (toDbl φ) (toDbl ψ)) := by
  unfold bornProb dblNormSq
  rw [hInner_re, hInner_im]

/-- ★★ THE RETIREMENT — Born = self-overlap, now a THEOREM. The transition probability
    `|⟨φ|ψ⟩|²` IS the RAW self-overlap `bornForm` (N391, the trunk primitive) of the
    complex overlap amplitude `(g(φ,ψ), ω(φ,ψ))`. "Born = self-overlap", ASSUMED at the
    real level all through arcs A–I, is now DERIVED: the probability equals the fold's own
    self-overlap of the derived complex amplitude. The primitive has become a theorem. -/
theorem bornProb_eq_self_overlap_of_amplitude (φ ψ : StateFibre) :
    bornProb φ ψ =
      bornForm (bornForm φ ψ, kahlerForm φ ψ) (bornForm φ ψ, kahlerForm φ ψ) := by
  unfold bornProb bornForm; ring

/-- The Born-square is NONNEGATIVE — the SAME trunk positivity (Born = self-overlap ≥ 0). -/
theorem bornProb_nonneg (φ ψ : StateFibre) : 0 ≤ bornProb φ ψ := by
  unfold bornProb
  have h1 : 0 ≤ (bornForm φ ψ) ^ 2 := sq_nonneg _
  have h2 : 0 ≤ (kahlerForm φ ψ) ^ 2 := sq_nonneg _
  linarith

/-- On the diagonal the Born-square is the square of the self-overlap: `bornProb φ φ = g(φ,φ)²`
    (the imaginary part `ω(φ,φ) = 0` — a state has full overlap with itself). -/
theorem bornProb_self (φ : StateFibre) : bornProb φ φ = (bornForm φ φ) ^ 2 := by
  unfold bornProb; rw [kahlerForm_self]; ring

/-- A unit state has Born-probability `1` with itself: `bornProb eInward eInward = 1`. -/
theorem bornProb_eInward_self : bornProb eInward eInward = 1 := by
  rw [bornProb_self, bornForm_eInward_self]; ring

/-- ★ [W8] NON-VACUITY / the genuinely COMPLEX content. `eOutward = J(eInward)` is the SAME
    complex ray as `eInward` (a phase, `i·eInward`), so the Born-probability between them is
    `1` — carried ENTIRELY by the Kähler form `ω` (the real self-overlap `g(eInward,eOutward)`
    is `0`). A "Born = g² (real part only)" misreading would give `0 ≠ 1`: the imaginary/Kähler
    part is genuinely load-bearing, and `ω` is not redundant with `g`. -/
theorem bornProb_eInward_eOutward : bornProb eInward eOutward = 1 := by
  unfold bornProb
  rw [bornForm_eInward_eOutward]
  have hω : kahlerForm eInward eOutward = 1 := by
    rw [kahlerForm_apply]; simp [eInward, eOutward]
  rw [hω]; ring

/-- The 1-COMPLEX-DIMENSIONAL structural identity `|⟨φ|ψ⟩|² = |φ|²·|ψ|²` (the Cauchy–Schwarz
    EQUALITY that holds because the primitive probe fibre is a single complex dimension — all
    states are collinear over the derived complex algebra). Scope (W4.5): this is the 1-dim
    fact, NOT a multi-dimensional Hilbert-space inequality (that lives above, with the sector
    tensor structure of J5/arc K). -/
theorem bornProb_eq_mul_normSq (φ ψ : StateFibre) :
    bornProb φ ψ = (bornForm φ φ) * (bornForm ψ ψ) := by
  unfold bornProb bornForm; rw [kahlerForm_apply]; ring

/-! ## THE CAPSTONE — the Born rule, DERIVED. -/

/-- ★★ THE CAPSTONE — KÄHLER COMPATIBILITY ⇒ THE BORN RULE, DERIVED. On the banked 2D fibre
    with its banked self-overlap `g = bornForm` (N391) and banked complex structure
    `J = foldComplex` (N392): (i) `g` is `J`-invariant and `J` is `g`-skew (Kähler
    compatibility); (ii) the fibre's `J` IS multiplication by the banked complex unit
    `Dbl.J` (N2), and the Hermitian inner product `⟨φ|ψ⟩ = g + i·ω` is conjugate-symmetric
    over the derived complex algebra `Dbl Cut`; (iii) THE RETIREMENT — the transition
    probability `|⟨φ|ψ⟩|²` IS the raw self-overlap `bornForm` (the trunk primitive) of the
    complex overlap amplitude. "Born = self-overlap", assumed all through arcs A–I, is now a
    theorem. Nothing is posited: `i` is the fold's chirality, "probability" is the fold's
    self-overlap positivity, modulus-square is self-overlap. -/
theorem born_rule_derived :
    -- (i) Kähler compatibility: g is J-invariant and J is g-skew.
    (∀ x y : StateFibre, bornForm (foldComplex x) (foldComplex y) = bornForm x y) ∧
    (∀ x y : StateFibre, bornForm (foldComplex x) y = - bornForm x (foldComplex y)) ∧
    -- (ii) the fibre's J IS mult by the banked complex unit, and g + i·ω is Hermitian.
    (∀ p : StateFibre, toDbl (foldComplex p) = Dbl.J * toDbl p) ∧
    (∀ φ ψ : StateFibre, (hInner (toDbl φ) (toDbl ψ)).re = bornForm φ ψ ∧
                          (hInner (toDbl φ) (toDbl ψ)).im = kahlerForm φ ψ) ∧
    (∀ z w : Dbl ContinuumQ.Cut, hInner w z = dblConj (hInner z w)) ∧
    -- (iii) THE RETIREMENT: the Born-square IS the raw self-overlap of the amplitude,
    --       equals the norm-square of the derived inner product, and is ≥ 0.
    (∀ φ ψ : StateFibre, bornProb φ ψ =
        bornForm (bornForm φ ψ, kahlerForm φ ψ) (bornForm φ ψ, kahlerForm φ ψ)) ∧
    (∀ φ ψ : StateFibre, bornProb φ ψ = dblNormSq (hInner (toDbl φ) (toDbl ψ))) ∧
    (∀ φ ψ : StateFibre, 0 ≤ bornProb φ ψ) := by
  refine ⟨bornForm_foldComplex_invariant, foldComplex_skew_adjoint, toDbl_foldComplex,
    fun φ ψ => ⟨hInner_re φ ψ, hInner_im φ ψ⟩, hInner_conj_symm,
    bornProb_eq_self_overlap_of_amplitude, bornProb_eq_dblNormSq, bornProb_nonneg⟩

end Phys.Quantum
