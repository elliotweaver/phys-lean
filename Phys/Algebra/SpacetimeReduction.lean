/-
  Phys.Algebra.SpacetimeReduction — N419 (arc-O O4): THE (1,9) → (1,3) SPACETIME
  REDUCTION. The physical (1,3) Lorentzian structure is CONTAINED, as a form-isometric
  subspace, in the banked octonionic Minkowski (1,9) (N43 `signature_one_nine`), via the
  restriction to the cascade's FIRST FOLD — the complex rung `Dbl ℚ ⊂ O ℚ`.
  ===========================================================================
  THE OLDEST STRUCTURAL DEBT (docs/SEED_COMPLETION_SWEEP.md §O4). N43 derived the Sylvester
  signature `(1, 9)` of the Born-determinant form `Qform t x v = t² − x² − gForm v v` on
  `STV = ℚ × ℚ × O ℚ` — octonionic Minkowski space `H₂(𝕆)`. Physical spacetime is 4-dimensional
  with signature `(1, 3)`. This module DERIVES `(1, 3)` — never posits it — as the restriction
  of the ALREADY-BANKED `(1, 9)` form to the fold's own complex unit.

  THE FORCED CHOICE OF SUBSPACE — the fold's first fold. The cascade begins when self-blindness
  forces the complex unit `J` (`J² = −1`, N392 `foldComplex`): the first Cayley–Dickson double
  `Dbl ℚ` — the ℂ rung. Every later rung DOUBLES this: `H ℚ = CD (Dbl ℚ)`, `O ℚ = CD (H ℚ)`. So
  `Dbl ℚ` sits inside `O ℚ` as the distinguished 2-dimensional subalgebra `d ↦ ⟨⟨d, 0⟩, 0⟩`
  (the double base-embedding `iota ∘ iota`). The self-adjoint `2 × 2` matrices over THIS
  subalgebra are `H₂(ℂ)`, whose determinant form is the `(1, 3)` Minkowski form — the physical
  spacetime. (Restricting instead to the quaternion rung `H ℚ` would give `H₂(ℍ)`, signature
  `(1, 5)`; to the real line, `H₂(ℝ)`, signature `(1, 2)`. The `(1, 3)` member of this ladder is
  forced by the ℂ rung — the fold's FIRST fold, the QM phase unit — NOT chosen.)

  THE REDUCTION (each step a theorem, foundations-only, forward from the banked objects):

    cToO                — the ℂ-rung embedding `Dbl ℚ →ₗ[ℚ] O ℚ`, `d ↦ ⟨⟨d, 0⟩, 0⟩`.
    gForm_cToO          — ★ THE COORDINATE COLLAPSE: `gForm (cToO d) (cToO d) = d.re² + d.im²`
                          — six of the eight Born coordinates vanish on the ℂ rung, leaving the
                          two-square sub-norm (the ℂ modulus squared).
    STV4 / Q4 / Q4v     — the 4-dim coordinate space `ℚ × ℚ × Dbl ℚ` and the `(1,3)` form
                          `Q4 t x d = t² − x² − (d.re² + d.im²)`.
    emb4                — the 4→10 embedding `STV4 →ₗ[ℚ] STV`, `(t,x,d) ↦ (t,x,cToO d)`.
    emb4_injective      — the embedding is injective: `(1,3)` sits genuinely inside `(1,9)`.
    emb4_preserves_form — ★★ THE WELD: `Qv (emb4 p) = Q4v p` — the banked `(1,9)` form restricted
                          to the ℂ-rung image IS the `(1,3)` form. The 10→4 tie, DERIVED.

    ── the SIGNATURE decomposition of the reduced form (Sylvester inertia `(1, 3)`) ──
    timeSub4 / spaceSub4          — the positive-definite TIME line `⟨(1,0,0)⟩` and the
                                    negative-definite 3-dim SPACE block `{p | p.1 = 0}`.
    finrank_timeSub4 (= 1) / finrank_spaceSub4 (= 3) — the dimensions, the `1` and the `3`.
    timeSub4_isCompl_spaceSub4    — `STV4 = timeSub4 ⊕ spaceSub4` internal direct sum.
    Q4v_pos_on_time4 / Q4v_neg_on_space4 — positive-definite on the `1`, negative-definite on
                                    the `3`.
    signature_one_three           — ★★★ THE HEADLINE: Sylvester signature `(1, 3)`, DERIVED.
    spacetime_reduction           — ★★★ THE CAPSTONE: `emb4` is an injective, form-preserving
                                    linear embedding of the `(1,3)` space into the banked `(1,9)`
                                    space — the physical spacetime CONTAINED in the octonionic
                                    Minkowski space, forced by the ℂ rung, never posited.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). The division-algebra spacetime ladder
  `H₂(ℝ,ℂ,ℍ,𝕆) → (1,2),(1,3),(1,5),(1,9)` is standard (Sudbery, Baez, Manogue–Dray). Here the
  physical `(1, 3)` is DERIVED as the restriction of the banked `(1, 9)` form to the cascade's
  own first-fold complex rung — NO posited `(1,3)`, NO posited 4D spacetime, NO Mathlib ℝ/ℂ as
  content (the whole statement is over the cascade ground ring ℚ; Sylvester inertia is a ℚ-fact,
  exactly as in N43). The choice of the ℂ rung is forced by the fold's first fold, not chosen.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "spacetime / Lorentzian / Minkowski /
  time / space / signature / reduction": what remains is the theorem that the restriction of the
  quadratic form `t² − x² − gForm v v` to the image of the double base-embedding of `Dbl ℚ` in
  `O ℚ` is `t² − x² − (d.re² + d.im²)`, that this form is positive on a 1-dim subspace and
  negative-definite on a complementary 3-dim subspace (Sylvester inertia `(1, 3)`), and that the
  embedding into the 10-dim space is injective and form-preserving. No theorem STATEMENT needs a
  physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.SpacetimeSignature

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-! ## The ℂ-rung embedding `Dbl ℚ → O ℚ` and the Born coordinate collapse. -/

/-- THE ℂ-RUNG EMBEDDING. The cascade's first fold `Dbl ℚ` (the complex unit `J`, N392) embeds
    into the terminal algebra `O ℚ = CD (H ℚ) = CD (CD (Dbl ℚ))` as the double base-embedding
    `d ↦ ⟨⟨d, 0⟩, 0⟩` (`iota ∘ iota`) — the distinguished 2-dimensional subalgebra. -/
def cToO : Dbl ℚ →ₗ[ℚ] O ℚ where
  toFun d := ⟨⟨d, 0⟩, 0⟩
  map_add' d d' := by ext <;> simp
  map_smul' q d := by ext <;> simp

/-- ★ THE COORDINATE COLLAPSE. The Born self-overlap of a ℂ-rung element is the two-square
    sub-norm `d.re² + d.im²` (the ℂ modulus squared): six of the eight octonion Born coordinates
    vanish on the complex rung, so the `(1,9)` form's space block restricts to a 2-square block. -/
theorem gForm_cToO (d : Dbl ℚ) : gForm (cToO d) (cToO d) = d.re ^ 2 + d.im ^ 2 := by
  rw [gForm_self_sum_sq]
  simp only [cToO, LinearMap.coe_mk, AddHom.coe_mk, c0, c1, c2, c3, c4, c5, c6, c7,
    CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im]
  ring

/-! ## The 4-dimensional `(1,3)` form and its embedding into the `(1,9)` space. -/

/-- The 4-dim coordinate space of the reduced form: `(t, x, d)` with `d` on the ℂ rung. -/
abbrev STV4 := ℚ × ℚ × Dbl ℚ

/-- THE `(1,3)` MINKOWSKI FORM `Q4 t x d = t² − x² − (d.re² + d.im²)` — the physical spacetime
    form, one time and three space (`x` plus the two ℂ-rung coordinates). -/
def Q4 (t x : ℚ) (d : Dbl ℚ) : ℚ := t ^ 2 - x ^ 2 - (d.re ^ 2 + d.im ^ 2)

/-- The `(1,3)` form on `STV4`. -/
def Q4v (p : STV4) : ℚ := Q4 p.1 p.2.1 p.2.2

/-- THE 4→10 EMBEDDING `STV4 →ₗ[ℚ] STV`, `(t,x,d) ↦ (t, x, cToO d)`: the physical spacetime
    coordinates mapped into the octonionic Minkowski coordinates, the space block landing on the
    ℂ rung. -/
def emb4 : STV4 →ₗ[ℚ] STV where
  toFun p := (p.1, p.2.1, cToO p.2.2)
  map_add' a b := by
    simp only [Prod.fst_add, Prod.snd_add, map_add, Prod.mk_add_mk]
  map_smul' q p := by
    simp only [Prod.smul_fst, Prod.smul_snd, map_smul, RingHom.id_apply, Prod.smul_mk]

/-- ★ THE EMBEDDING IS INJECTIVE: the `(1,3)` space sits genuinely inside the `(1,9)` space. -/
theorem emb4_injective : Function.Injective emb4 := by
  intro p q h
  simp only [emb4, LinearMap.coe_mk, AddHom.coe_mk, Prod.mk.injEq] at h
  obtain ⟨h1, h2, h3⟩ := h
  have hd : p.2.2 = q.2.2 := by
    have := congrArg (fun z => z.re.re) h3
    simpa [cToO] using this
  obtain ⟨pt, px, pd⟩ := p
  obtain ⟨qt, qx, qd⟩ := q
  simp_all

/-- ★★ THE WELD (the 10→4 tie). The banked octonionic `(1,9)` form `Qv` restricted to the
    ℂ-rung image IS the physical `(1,3)` form `Q4v`: `Qv (emb4 p) = Q4v p`. The `(1,3)` structure
    is CONTAINED in the derived `(1,9)`, form-isometrically — DERIVED from the banked Born
    coordinate collapse, never posited. -/
theorem emb4_preserves_form (p : STV4) : Qv (emb4 p) = Q4v p := by
  show Qform (emb4 p).1 (emb4 p).2.1 (emb4 p).2.2 = Q4 p.1 p.2.1 p.2.2
  simp only [emb4, LinearMap.coe_mk, AddHom.coe_mk]
  unfold Qform Q4
  rw [gForm_cToO]

/-! ## Definiteness of the reduced form on the time line and the 3-dim space block. -/

/-- The reduced form on the pure-time line: `Q4 t 0 0 = t²`. -/
theorem Q4_time (t : ℚ) : Q4 t 0 0 = t ^ 2 := by
  unfold Q4; simp

/-- ★ THE TIMELIKE LINE CARRIES A POSITIVE SQUARE: `t ≠ 0 → 0 < Q4 t 0 0`. -/
theorem Q4_time_pos {t : ℚ} (ht : t ≠ 0) : 0 < Q4 t 0 0 := by
  rw [Q4_time]; positivity

/-- The reduced form on the space block: `Q4 0 x d = −(x² + (d.re² + d.im²))`. -/
theorem Q4_space (x : ℚ) (d : Dbl ℚ) : Q4 0 x d = -(x ^ 2 + (d.re ^ 2 + d.im ^ 2)) := by
  unfold Q4; ring

/-- ★ THE SPACE BLOCK IS NEGATIVE: `Q4 0 x d ≤ 0`. -/
theorem Q4_space_nonpos (x : ℚ) (d : Dbl ℚ) : Q4 0 x d ≤ 0 := by
  rw [Q4_space]
  have hx : (0:ℚ) ≤ x ^ 2 := sq_nonneg x
  have hr : (0:ℚ) ≤ d.re ^ 2 := sq_nonneg _
  have hi : (0:ℚ) ≤ d.im ^ 2 := sq_nonneg _
  linarith

/-- ★ THE SPACE BLOCK IS NEGATIVE-DEFINITE: `Q4 0 x d = 0 ↔ x = 0 ∧ d = 0`. The two-square
    sub-norm is anisotropic — the three space directions (`x` and the two ℂ-rung coordinates)
    form a genuine negative-definite block. -/
theorem Q4_space_def {x : ℚ} {d : Dbl ℚ} : Q4 0 x d = 0 ↔ x = 0 ∧ d = 0 := by
  unfold Q4
  constructor
  · intro h
    have hx : (0:ℚ) ≤ x ^ 2 := sq_nonneg x
    have hr : (0:ℚ) ≤ d.re ^ 2 := sq_nonneg _
    have hi : (0:ℚ) ≤ d.im ^ 2 := sq_nonneg _
    have hx0 : x ^ 2 = 0 := by linarith
    have hr0 : d.re ^ 2 = 0 := by linarith
    have hi0 : d.im ^ 2 = 0 := by linarith
    refine ⟨pow_eq_zero_iff (by norm_num) |>.mp hx0, ?_⟩
    have hre : d.re = 0 := pow_eq_zero_iff (by norm_num) |>.mp hr0
    have him : d.im = 0 := pow_eq_zero_iff (by norm_num) |>.mp hi0
    ext <;> assumption
  · rintro ⟨hx, hd⟩; subst hx; subst hd; simp

/-! ## THE SIGNATURE DECOMPOSITION — Sylvester inertia `(1, 3)`, derived.

    The 4-dim coordinate space `STV4 = ℚ × ℚ × Dbl ℚ` splits as an internal direct sum of the
    positive-definite 1-dim TIME line and the negative-definite 3-dim SPACE block. The dimensions
    `1` and `3` are the physical spacetime signature; the definiteness on each block makes the
    split a genuine Sylvester decomposition, exactly as N43 for `(1, 9)`. -/

/-- THE TIME LINE: the 1-dim subspace spanned by the pure-time vector `(1, 0, 0)`. -/
def timeSub4 : Submodule ℚ STV4 := Submodule.span ℚ {((1 : ℚ), (0 : ℚ), (0 : Dbl ℚ))}

/-- THE SPACE BLOCK: the 3-dim subspace `{p | p.1 = 0}` (zero time component). -/
def spaceSub4 : Submodule ℚ STV4 := LinearMap.ker (LinearMap.fst ℚ ℚ (ℚ × Dbl ℚ))

/-- `finrank STV4 = 4` (= `1 + 1 + 2`, the time, the space-scalar `x`, and the 2 ℂ-rung dirs). -/
theorem finrank_STV4 : Module.finrank ℚ STV4 = 4 := by
  simp [STV4, Module.finrank_prod, Module.finrank_self, finrank_dbl_eq_two]

/-- ★ `finrank spaceSub4 = 3`. Rank–nullity on the (surjective) time projection: `4 − 1 = 3`. -/
theorem finrank_spaceSub4 : Module.finrank ℚ spaceSub4 = 3 := by
  have hsurj : Function.Surjective (LinearMap.fst ℚ ℚ (ℚ × Dbl ℚ)) :=
    fun a => ⟨(a, 0), rfl⟩
  have hrk := LinearMap.finrank_range_add_finrank_ker (LinearMap.fst ℚ ℚ (ℚ × Dbl ℚ))
  rw [LinearMap.range_eq_top.mpr hsurj] at hrk
  simp only [finrank_top] at hrk
  rw [finrank_STV4, Module.finrank_self] at hrk
  have : Module.finrank ℚ (LinearMap.ker (LinearMap.fst ℚ ℚ (ℚ × Dbl ℚ))) = 3 := by omega
  exact this

/-- ★ `finrank timeSub4 = 1`. The time line is spanned by the single nonzero vector `(1,0,0)`. -/
theorem finrank_timeSub4 : Module.finrank ℚ timeSub4 = 1 := by
  rw [timeSub4, finrank_span_singleton]
  intro h
  have := congrArg Prod.fst h
  simp at this

/-- ★ `IsCompl timeSub4 spaceSub4`: the internal direct sum `STV4 = timeSub4 ⊕ spaceSub4`. -/
theorem timeSub4_isCompl_spaceSub4 : IsCompl timeSub4 spaceSub4 := by
  constructor
  · rw [Submodule.disjoint_def]
    intro p hpt hps
    obtain ⟨c, hc⟩ := Submodule.mem_span_singleton.mp hpt
    have hp1 : p.1 = 0 := hps
    rw [← hc] at hp1
    simp only [Prod.smul_fst, smul_eq_mul, mul_one] at hp1
    rw [← hc, hp1]
    simp
  · rw [codisjoint_iff, eq_top_iff]
    intro p _
    have hsplit : p = (p.1 • ((1 : ℚ), (0 : ℚ), (0 : Dbl ℚ))) + (0, p.2.1, p.2.2) := by
      obtain ⟨t, x, d⟩ := p
      simp
    rw [hsplit]
    apply Submodule.add_mem
    · apply Submodule.mem_sup_left
      exact Submodule.mem_span_singleton.mpr ⟨p.1, rfl⟩
    · apply Submodule.mem_sup_right
      show (0, p.2.1, p.2.2).1 = 0
      rfl

/-- The reduced form is positive on the time line off the origin. -/
theorem Q4v_pos_on_time4 {q : STV4} (hq : q ∈ timeSub4) (hne : q ≠ 0) : 0 < Q4v q := by
  obtain ⟨c, hc⟩ := Submodule.mem_span_singleton.mp hq
  have hcne : c ≠ 0 := by
    rintro rfl; exact hne (by rw [← hc]; simp)
  rw [← hc]
  show 0 < Q4 _ _ _
  have h2 : (c • ((1 : ℚ), (0 : ℚ), (0 : Dbl ℚ))).1 = c := by simp
  have h3 : (c • ((1 : ℚ), (0 : ℚ), (0 : Dbl ℚ))).2.1 = 0 := by simp
  have h4 : (c • ((1 : ℚ), (0 : ℚ), (0 : Dbl ℚ))).2.2 = 0 := by simp
  rw [h2, h3, h4]
  exact Q4_time_pos hcne

/-- The reduced form is negative on the space block off the origin. -/
theorem Q4v_neg_on_space4 {q : STV4} (hq : q ∈ spaceSub4) (hne : q ≠ 0) : Q4v q < 0 := by
  have hq0 : q.1 = 0 := hq
  obtain ⟨t, x, d⟩ := q
  simp only at hq0
  subst hq0
  show Q4 _ _ _ < 0
  rcases lt_or_eq_of_le (Q4_space_nonpos x d) with h | h
  · exact h
  · exfalso
    obtain ⟨hx, hd⟩ := Q4_space_def.mp h
    subst hx; subst hd
    exact hne rfl

/-- ★★★ THE HEADLINE — SYLVESTER SIGNATURE `(1, 3)`. The 4-dim coordinate space `STV4` of the
    reduced ℂ-rung form splits as an internal direct sum `timeSub4 ⊕ spaceSub4` with
    `finrank timeSub4 = 1` and `finrank spaceSub4 = 3`, the form positive-definite on the first
    block and negative-definite on the second — the physical Lorentzian signature `(1, 3)`,
    DERIVED as the restriction of the banked octonionic `(1, 9)` (N43) to the cascade's first-fold
    complex rung, never posited. -/
theorem signature_one_three :
    IsCompl timeSub4 spaceSub4
      ∧ Module.finrank ℚ timeSub4 = 1
      ∧ Module.finrank ℚ spaceSub4 = 3
      ∧ (∀ q ∈ timeSub4, q ≠ 0 → 0 < Q4v q)
      ∧ (∀ q ∈ spaceSub4, q ≠ 0 → Q4v q < 0) :=
  ⟨timeSub4_isCompl_spaceSub4, finrank_timeSub4, finrank_spaceSub4,
    fun _ hq hne => Q4v_pos_on_time4 hq hne, fun _ hq hne => Q4v_neg_on_space4 hq hne⟩

/-- ★★★ THE CAPSTONE — THE `(1,9) → (1,3)` REDUCTION. The 4-dim `(1,3)` space embeds into the
    banked 10-dim `(1,9)` space (`emb4`) injectively and form-preservingly (`Qv (emb4 p) = Q4v p`),
    and carries Sylvester signature `(1, 3)`. The physical spacetime is CONTAINED, form-
    isometrically, in the octonionic Minkowski space — forced by the fold's own complex unit (the
    ℂ rung `Dbl ℚ ⊂ O ℚ`), NEVER posited. -/
theorem spacetime_reduction :
    Function.Injective emb4
      ∧ (∀ p : STV4, Qv (emb4 p) = Q4v p)
      ∧ IsCompl timeSub4 spaceSub4
      ∧ Module.finrank ℚ timeSub4 = 1
      ∧ Module.finrank ℚ spaceSub4 = 3
      ∧ (∀ q ∈ timeSub4, q ≠ 0 → 0 < Q4v q)
      ∧ (∀ q ∈ spaceSub4, q ≠ 0 → Q4v q < 0) :=
  ⟨emb4_injective, emb4_preserves_form, timeSub4_isCompl_spaceSub4,
    finrank_timeSub4, finrank_spaceSub4,
    fun _ hq hne => Q4v_pos_on_time4 hq hne, fun _ hq hne => Q4v_neg_on_space4 hq hne⟩

end

end Phys.Algebra
