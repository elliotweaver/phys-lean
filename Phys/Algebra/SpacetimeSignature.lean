/-
  Phys.Algebra.SpacetimeSignature — N43: THE LORENTZIAN SIGNATURE (1,9) of the
  determinant form on the self-adjoint 2×2 matrices over the terminal algebra.
  ===========================================================================
  THE NEXT FORCED NODE after the colour-branching arc (N42a→b→c). The deepest
  structural claim — ONE CAUSE, MANY TERMINATIONS — already has the generation cap
  banked (N5 `JordanTower.lean` `jordan_cap_iff_nonassoc` + `HermitianJordan`
  `jordan_cap_pinned_at_three`: the Hermitian Jordan tower over `𝕆` holds at order 3,
  fails at 4, by the SAME octonionic non-associativity that stopped the cascade). This
  module banks the OTHER face the terminal algebra forces: the indefinite (Lorentzian)
  SIGNATURE of the natural determinant form on the self-adjoint `2 × 2` matrices over
  `𝕆`, DERIVED from the trunk's Born positivity — never a posited `(1,3)`/`(1,9)`.

  THE TRUNK INPUT (Born = self-overlap = positivity). The banked Born self-overlap form
  `gForm` on `O ℚ` is POSITIVE-DEFINITE: `gForm v v = Σ_{j} (cⱼ v)²` (a sum of 8 squares,
  `Phys/Algebra/DerivationCompact.lean` `gForm_self_sum_sq`), so `0 ≤ gForm v v`
  (`gForm_self_nonneg`) with equality iff `v = 0` (`gForm_self_eq_zero`). That positivity
  is the SPACELIKE block. The self-adjoint `2 × 2` structure forces exactly ONE real
  hyperbolic plane — the single TIMELIKE direction. The result is signature `(1, 9)`:
  ten-dimensional octonionic Minkowski space, the single time forced by the `2 × 2`
  Hermitian determinant, eight of the nine space directions forced by Born = 8 squares.

  THE FORM. A self-adjoint `2 × 2` octonion matrix has the shape
      `M(t, x, v) = !![ (t+x)•1, v ; star v, (t−x)•1 ]`     (`t, x ∈ ℚ`, `v ∈ O ℚ`),
  the real diagonal forced by Hermiticity (`herm2_isHermitian`). Its determinant, taken
  honestly as the real part `reQ (M₀₀·M₁₁ − M₀₁·M₁₀)` (NO Mathlib `Matrix.det`, which
  needs a commutative coordinate ring `𝕆` does not have), reduces — via the banked
  `selfMul`/Born identity `v · star v = ι (Nrm v)` written through `gForm` — to the
  quadratic form
      `Qform t x v = t² − x² − gForm v v`     (`herm2_det_eq`),
  the octonionic Minkowski norm. The minus on the `gForm v v` block is the Born positivity
  entering with the opposite sign to the time square — the source of the indefiniteness.

  THE DERIVATION (each step a theorem, foundations-only, forward from the banked objects):

    herm2 / herm2_isHermitian — the self-adjoint matrix and `Mᴴ = M`.
    herm2_det / herm2_det_eq  — ★★ THE FORCED REDUCTION: the real determinant equals
                                `t² − x² − gForm v v`. The Born self-overlap, with a sign.
    Qform / Qform_time_pos    — `Qform t 0 0 = t²`, strictly positive off `0`: the TIMELIKE
                                line carries a positive square.
    Qform_space_nonpos        — `Qform 0 x v = −(x² + gForm v v) ≤ 0`: the space block is
                                NEGATIVE (the Born positivity, negated).
    Qform_space_def           — `Qform 0 x v = 0 ↔ x = 0 ∧ v = 0`: the space block is
                                negative-DEFINITE (anisotropy from `gForm_self_eq_zero`).

    ── the SIGNATURE decomposition (Sylvester inertia, derived) ──
    STV                       — the 10-dim coordinate space `ℚ × ℚ × O ℚ` of the form.
    timeSub / spaceSub        — the positive-definite TIME line `⟨(1,0,0)⟩` and the
                                negative-definite SPACE block `{p | p.1 = 0}`.
    finrank_timeSub (= 1) / finrank_spaceSub (= 9) — the dimensions, the `1` and the `9`.
    timeSub_isCompl_spaceSub  — ★ `IsCompl timeSub spaceSub`: an internal direct sum
                                `STV = timeSub ⊕ spaceSub` into the two definite blocks.
    Qv_pos_on_time / Qv_neg_on_space — the form is positive-definite on the dim-1 block and
                                negative-definite on the dim-9 block.
    signature_one_nine        — ★★★ THE HEADLINE: `STV` splits as a `timeSub ⊕ spaceSub`
                                internal direct sum with `finrank timeSub = 1`,
                                `finrank spaceSub = 9`, the form positive-definite on the
                                first and negative-definite on the second — Sylvester
                                signature `(1, 9)`, DERIVED.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). The octonionic Minkowski space `ℝ^{1,9}`
  as `H₂(𝕆)` is standard (Sudbery, Baez, Manogue–Dray). Here the signature is DERIVED from
  the banked Born positivity (`gForm` = sum of 8 squares) + the self-adjoint `2 × 2` structure
  over the banked terminal algebra `O ℚ` — NO posited `(1,9)`, NO Mathlib ℝ/ℂ as content (the
  whole statement is over the cascade ground ring ℚ; Sylvester inertia is a ℚ-fact). The single
  TIME is forced by the determinant, not chosen.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "spacetime / Lorentzian / Minkowski /
  time / space / signature": what remains is the theorem that the real determinant of a
  self-adjoint `2 × 2` matrix over the Cayley–Dickson double of a double of a double of ℚ is the
  quadratic form `t² − x² − gForm v v`, that this form is positive on a 1-dim subspace and
  negative-definite on a complementary 9-dim subspace, so its Sylvester inertia is `(1, 9)`. No
  theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.DerivationCompact
import Phys.Algebra.DerivationFinrank
import Phys.Cascade.ForcedStop
import Mathlib.Data.Matrix.Basic
import Mathlib.Data.Fin.VecNotation
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Matrix

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-! ## The self-adjoint `2 × 2` matrix over the terminal algebra and its determinant. -/

/-- THE SELF-ADJOINT (Hermitian) `2 × 2` octonion matrix `M(t, x, v)`. The real diagonal
    `(t+x)•1`, `(t−x)•1` and the conjugate off-diagonal `v`, `star v` are exactly the shape
    Hermiticity forces. -/
def herm2 (t x : ℚ) (v : O ℚ) : Matrix (Fin 2) (Fin 2) (O ℚ) :=
  !![((t + x) • (1 : O ℚ)), v;
     star v, ((t - x) • (1 : O ℚ))]

/-- The matrix is self-adjoint: `Mᴴ = M`. -/
theorem herm2_isHermitian (t x : ℚ) (v : O ℚ) :
    (herm2 t x v)ᴴ = herm2 t x v := by
  refine Matrix.ext fun i j => ?_
  fin_cases i <;> fin_cases j <;>
    simp [herm2, Matrix.conjTranspose_apply]

/-- THE REAL DETERMINANT `reQ (M₀₀·M₁₁ − M₀₁·M₁₀)`. Taken as the real part because the
    coordinate algebra `O ℚ` is non-commutative, so the Mathlib `Matrix.det` (which needs a
    commutative ring) does not apply; the real part of the standard `2 × 2` determinant
    expression is the honest scalar invariant. -/
def herm2_det (t x : ℚ) (v : O ℚ) : ℚ :=
  reQ ((herm2 t x v) 0 0 * (herm2 t x v) 1 1 - (herm2 t x v) 0 1 * (herm2 t x v) 1 0)

/-- THE BORN QUADRATIC FORM `Qform t x v = t² − x² − gForm v v` — the octonionic Minkowski
    norm. The minus on the Born self-overlap block is the source of the indefiniteness. -/
def Qform (t x : ℚ) (v : O ℚ) : ℚ := t^2 - x^2 - gForm v v

/-- ★★ THE FORCED REDUCTION. The real determinant of the self-adjoint `2 × 2` octonion matrix
    equals the Born quadratic form `t² − x² − gForm v v`. The off-diagonal product
    `v · star v` collapses to the Born self-overlap `gForm v v` (the banked `selfMul`/Born
    positivity), and the real diagonal product gives `t² − x²` — the Lorentzian form, derived
    from the trunk, never posited. -/
theorem herm2_det_eq (t x : ℚ) (v : O ℚ) :
    herm2_det t x v = Qform t x v := by
  unfold herm2_det herm2 Qform
  simp only [Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.cons_val_fin_one, Matrix.empty_val', Matrix.of_apply]
  have h1 : (t + x) • (1 : O ℚ) * (t - x) • (1 : O ℚ) = ((t + x) * (t - x)) • (1 : O ℚ) := by
    rw [qsmul_mul_left, qsmul_mul_right, one_mul, smul_smul]
  have hsmul1 : ∀ q : ℚ, reQ (q • (1 : O ℚ)) = q := by
    intro q
    simp only [reQ, cd_qsmul_re, Dbl.smul_re]
    show q • (1 : ℚ) = q
    rw [smul_eq_mul, mul_one]
  rw [sub_eq_add_neg, reQ_add, reQ_neg, h1, hsmul1]
  unfold gForm
  ring

/-! ## Definiteness of the form on the time line and the space block. -/

/-- The form on the pure-time line: `Qform t 0 0 = t²`. -/
theorem Qform_time (t : ℚ) : Qform t 0 0 = t^2 := by
  unfold Qform gForm
  simp [reQ]

/-- ★ THE TIMELIKE LINE CARRIES A POSITIVE SQUARE: `t ≠ 0 → 0 < Qform t 0 0`. -/
theorem Qform_time_pos {t : ℚ} (ht : t ≠ 0) : 0 < Qform t 0 0 := by
  rw [Qform_time]; positivity

/-- The form on the space block: `Qform 0 x v = −(x² + gForm v v)`. -/
theorem Qform_space (x : ℚ) (v : O ℚ) : Qform 0 x v = -(x^2 + gForm v v) := by
  unfold Qform; ring

/-- ★ THE SPACE BLOCK IS NEGATIVE: `Qform 0 x v ≤ 0`. The Born self-overlap, negated. -/
theorem Qform_space_nonpos (x : ℚ) (v : O ℚ) : Qform 0 x v ≤ 0 := by
  rw [Qform_space]
  have h := gForm_self_nonneg v
  have hx : (0:ℚ) ≤ x^2 := sq_nonneg x
  linarith

/-- ★ THE SPACE BLOCK IS NEGATIVE-DEFINITE: `Qform 0 x v = 0 ↔ x = 0 ∧ v = 0`. The
    anisotropy of the Born form (`gForm_self_eq_zero`) makes the nine space directions a
    genuine negative-definite block — no null space directions. -/
theorem Qform_space_def {x : ℚ} {v : O ℚ} : Qform 0 x v = 0 ↔ x = 0 ∧ v = 0 := by
  rw [Qform_space, neg_eq_zero]
  constructor
  · intro h
    have hg := gForm_self_nonneg v
    have hx : (0:ℚ) ≤ x^2 := sq_nonneg x
    have hx0 : x^2 = 0 := by linarith
    have hg0 : gForm v v = 0 := by linarith
    exact ⟨pow_eq_zero_iff (by norm_num) |>.mp hx0, gForm_self_eq_zero.mp hg0⟩
  · rintro ⟨hx, hv⟩; subst hx; subst hv
    simp [gForm, reQ]

/-! ## THE SIGNATURE DECOMPOSITION — Sylvester inertia `(1, 9)`, derived.

    The 10-dim coordinate space `STV = ℚ × ℚ × O ℚ` splits as an internal direct sum of the
    positive-definite 1-dim TIME line and the negative-definite 9-dim SPACE block. The
    dimensions `1` and `9` are the signature; the definiteness of the form on each block
    (proved above) makes the split a genuine Sylvester decomposition. -/

/-- The coordinate space of the form: `(t, x, v)`. -/
abbrev STV := ℚ × ℚ × O ℚ

/-- The quadratic form on `STV`. -/
def Qv (p : STV) : ℚ := Qform p.1 p.2.1 p.2.2

/-- THE TIME LINE: the 1-dim subspace spanned by the pure-time vector `(1, 0, 0)`. -/
def timeSub : Submodule ℚ STV := Submodule.span ℚ {((1 : ℚ), (0 : ℚ), (0 : O ℚ))}

/-- THE SPACE BLOCK: the 9-dim subspace `{p | p.1 = 0}` (zero time component) — the kernel
    of the time-coordinate projection. -/
def spaceSub : Submodule ℚ STV := LinearMap.ker (LinearMap.fst ℚ ℚ (ℚ × O ℚ))

/-- `finrank STV = 10` (= `1 + 1 + 8`, the time, space-scalar and the 8 Born directions). -/
theorem finrank_STV : Module.finrank ℚ STV = 10 := by
  simp [STV, Module.finrank_prod, Module.finrank_self, finrank_O_eq_eight]
/-- ★ `finrank spaceSub = 9`. The space block is the kernel of the (surjective) time
    projection, so rank–nullity gives `10 − 1 = 9`. -/
theorem finrank_spaceSub : Module.finrank ℚ spaceSub = 9 := by
  have hsurj : Function.Surjective (LinearMap.fst ℚ ℚ (ℚ × O ℚ)) :=
    fun a => ⟨(a, 0), rfl⟩
  have hrk := LinearMap.finrank_range_add_finrank_ker (LinearMap.fst ℚ ℚ (ℚ × O ℚ))
  rw [LinearMap.range_eq_top.mpr hsurj] at hrk
  simp only [finrank_top] at hrk
  rw [finrank_STV, Module.finrank_self] at hrk
  -- hrk : 1 + finrank (ker fst) = 10
  have : Module.finrank ℚ (LinearMap.ker (LinearMap.fst ℚ ℚ (ℚ × O ℚ))) = 9 := by omega
  exact this

/-- ★ `finrank timeSub = 1`. The time line is spanned by the single nonzero vector `(1,0,0)`. -/
theorem finrank_timeSub : Module.finrank ℚ timeSub = 1 := by
  rw [timeSub, finrank_span_singleton]
  intro h
  have := congrArg Prod.fst h
  simp at this

/-- ★ `IsCompl timeSub spaceSub`: an internal direct sum `STV = timeSub ⊕ spaceSub` into the
    two definite blocks. Any `(t,x,v) = t•(1,0,0) + (0,x,v)` with the first summand in the
    time line and the second in the space block, and the blocks meet only at `0`. -/
theorem timeSub_isCompl_spaceSub : IsCompl timeSub spaceSub := by
  constructor
  · -- disjoint: timeSub ⊓ spaceSub = ⊥
    rw [Submodule.disjoint_def]
    intro p hpt hps
    obtain ⟨c, hc⟩ := Submodule.mem_span_singleton.mp hpt
    have hp1 : p.1 = 0 := hps
    rw [← hc] at hp1
    simp only [Prod.smul_fst, smul_eq_mul, mul_one] at hp1
    rw [← hc, hp1]
    simp
  · -- codisjoint: timeSub ⊔ spaceSub = ⊤
    rw [codisjoint_iff, eq_top_iff]
    intro p _
    have hsplit : p = (p.1 • ((1 : ℚ), (0 : ℚ), (0 : O ℚ)))
        + (0, p.2.1, p.2.2) := by
      obtain ⟨t, x, v⟩ := p
      simp
    rw [hsplit]
    apply Submodule.add_mem
    · apply Submodule.mem_sup_left
      exact Submodule.mem_span_singleton.mpr ⟨p.1, rfl⟩
    · apply Submodule.mem_sup_right
      show (0, p.2.1, p.2.2).1 = 0
      rfl

/-- The form is positive on the time line off the origin: `q ∈ timeSub, q ≠ 0 → 0 < Qv q`. -/
theorem Qv_pos_on_time {q : STV} (hq : q ∈ timeSub) (hne : q ≠ 0) : 0 < Qv q := by
  obtain ⟨c, hc⟩ := Submodule.mem_span_singleton.mp hq
  have hcne : c ≠ 0 := by
    rintro rfl; exact hne (by rw [← hc]; simp)
  rw [← hc]
  show 0 < Qform _ _ _
  have h2 : (c • ((1 : ℚ), (0 : ℚ), (0 : O ℚ))).1 = c := by simp
  have h3 : (c • ((1 : ℚ), (0 : ℚ), (0 : O ℚ))).2.1 = 0 := by simp
  have h4 : (c • ((1 : ℚ), (0 : ℚ), (0 : O ℚ))).2.2 = 0 := by simp
  rw [h2, h3, h4]
  exact Qform_time_pos hcne

/-- The form is negative on the space block off the origin: `q ∈ spaceSub, q ≠ 0 → Qv q < 0`. -/
theorem Qv_neg_on_space {q : STV} (hq : q ∈ spaceSub) (hne : q ≠ 0) : Qv q < 0 := by
  have hq0 : q.1 = 0 := hq
  obtain ⟨t, x, v⟩ := q
  simp only at hq0
  subst hq0
  show Qform _ _ _ < 0
  rcases lt_or_eq_of_le (Qform_space_nonpos x v) with h | h
  · exact h
  · exfalso
    obtain ⟨hx, hv⟩ := Qform_space_def.mp h
    subst hx; subst hv
    exact hne rfl
/-- ★★★ THE HEADLINE — SYLVESTER SIGNATURE `(1, 9)`. The coordinate space `STV` of the Born
    determinant form splits as an internal direct sum `timeSub ⊕ spaceSub` with
    `finrank timeSub = 1` and `finrank spaceSub = 9`, the form positive-definite on the
    first block and negative-definite on the second. The Lorentzian signature `(1, 9)` of the
    self-adjoint `2 × 2` matrices over the terminal algebra — ONE timelike, NINE spacelike —
    DERIVED from the trunk's Born positivity, never posited. -/
theorem signature_one_nine :
    IsCompl timeSub spaceSub
      ∧ Module.finrank ℚ timeSub = 1
      ∧ Module.finrank ℚ spaceSub = 9
      ∧ (∀ q ∈ timeSub, q ≠ 0 → 0 < Qv q)
      ∧ (∀ q ∈ spaceSub, q ≠ 0 → Qv q < 0) :=
  ⟨timeSub_isCompl_spaceSub, finrank_timeSub, finrank_spaceSub,
    fun _ hq hne => Qv_pos_on_time hq hne, fun _ hq hne => Qv_neg_on_space hq hne⟩

end

end Phys.Algebra
