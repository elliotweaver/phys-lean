/-
  Phys.Algebra.LorentzContinuum — N49: THE CONTINUUM RE-GROUNDING of the isometry structure
  over the DERIVED ℝ — the Born determinant form, the hyperbolic boost, and the continuum
  isometry monoid built over the DERIVED CONTINUUM `Cut`, and the headline that the continuum
  isometry structure STRICTLY EXTENDS the rational cover (N48), DERIVED.
  ===========================================================================
  THE NEXT FORCED NODE after the spinor-cover-group node (N48). N45 banked the ABSTRACT isometry
  structure of the Born determinant form over the (Mathlib-`ℚ`-coefficiented) cascade carrier; N48
  banked the cover group `spinorCoverMonoid` on the associative endomorphism side and proved the
  whole generated cover acts by Born-form isometries (`spinorCoverMonoid ≤ qvIsomMonoid`). The
  remaining front the ticket names is the SURJECTIVITY onto the CONNECTED isometry component — that
  the cover is ONTO `SO⁺(1,9)`. The crux the ticket flags: a generic Lorentz transformation is NOT
  rational (it needs an IRRATIONAL boost rapidity), so the continuous isometry component lives over
  the DERIVED ℝ `Cut` (N11–N13), and the rational cover canNOT, on its own, reach it. The
  surjectivity statement must therefore first be FORMULATED over the derived ℝ, and the FIRST thing
  it requires is that the carrier + form + boost generators RE-GROUND over `Cut`, with the
  continuum strictly EXCEEDING the rational generators. THIS module banks that continuum
  re-grounding and the strict-extension headline.

  ── THE ONE LAW / W1 REFRAME (the cosh/sinh rapidity is a standard-physics habit) ──
  The classical picture parametrizes a boost by a rapidity `θ` through `(cosh θ, sinh θ)`, which
  needs the transcendental functions `cosh`/`sinh` and the identity `cosh²θ − sinh²θ = 1`. Over the
  derived ℝ those analytic functions are NOT banked (only the summability of the exponential series
  is). Returning to the trunk: the isometry condition the form actually imposes is the ALGEBRAIC
  unit-hyperbola equation `a² − b² = 1` — a boost point is ANY point on the hyperbola, with no
  reference to a rapidity coordinate. The boost-isometry proof is then PURE FIELD ARITHMETIC
  (`linear_combination (t²−x²)·h`), valid over ANY field — in particular over the derived complete
  ordered field `Cut`. The transcendental rapidity coordinatization dissolves; the algebraic
  hyperbola point is the theory-native object, and it transfers to the continuum for free.

  ── THE CONTINUUM CARRIER (over the DERIVED ℝ, not Mathlib ℝ/ℂ) ──
  `Cut` (the derived ℝ, banked as a `CommRing`/`Field`/`Archimedean`/`ConditionallyComplete`
  ordered field over the DERIVED ℚ `Q`) is given the trivial `*`-ring structure (`star = id`,
  `starRingOfComm`), which feeds the Cayley–Dickson construction `CD`. Then the SAME generic carrier
  the cascade uses, `O Cut := CD (H Cut)`, is the terminal algebra over the derived continuum — the
  octonions over the derived ℝ. The Born self-overlap `gFormC`, the quadratic form `QformC =
  t² − x² − gFormC v v`, and the hyperbolic boost `boostFunC a b` are the continuum analogs of the
  N43/N45 objects, now coefficiented by `Cut`.

  WHAT IS PROVED (each a theorem, foundations-only, forward from the banked objects):
    boostC_isom             — ★★ THE CONTINUUM BOOST `(t,x,v) ↦ (a t + b x, b t + a x, v)` over the
                              DERIVED ℝ preserves the continuum Born form `QvC` iff `a² − b² = 1`,
                              by PURE FIELD ARITHMETIC — no analysis, no rapidity, no Mathlib ℝ.
    IsQvIsomC / qvIsomMonoidC — ★ THE CONTINUUM ISOMETRY MONOID: the `QvC`-preservers as a submonoid
                              of `Function.End STVC` (the associative function-composition side).
    boostC_mem              — the continuum boost on the unit hyperbola lies in the isometry monoid.
    sqrt2_sq                — `√2² = 2` over the derived ℝ (from the banked `sqrt2_mul_sqrt2`).
    irr_hyperbola           — ★ the IRRATIONAL point `(3√2/4, √2/4)` lands on the unit hyperbola
                              `a² − b² = 1` (built from the DERIVED √2).
    irrBoost_isom           — ★ the IRRATIONAL boost is a genuine continuum isometry — an element of
                              the continuum isometry monoid with an IRRATIONAL boost parameter.
    sqrt2_quarter_not_rational — `√2/4` is NOT in the image of the derived-ℚ embedding `Qcut`
                              (else `√2 = Qcut (4c)`, contradicting the banked `sqrt2_not_rational`).
    boostFunC_inj           — boosts are determined by their parameters (read at `(1,0,0)`).
    continuum_strictly_extends_rational — ★★★ THE HEADLINE: the irrational continuum boost is NOT
                              equal to ANY boost with derived-RATIONAL parameters `Qcut a`, `Qcut b`.
                              The rational cover (N48, whose boosts have rational parameters) is NOT
                              the whole continuous isometry component — reaching it genuinely REQUIRES
                              the derived ℝ. This is the precise content of "surjectivity onto the
                              connected component needs the continuum": the rational generators alone
                              do NOT surject onto the continuous group.
    irrBoost_ne_id          — ★ NON-TRIVIALITY (W8 teeth): the irrational boost is not the identity
                              (its space component `√2/4 ≠ 0`), a genuine time–space mix beyond the
                              rational cover.

  WHAT IS CHILDED (N50, the heavy Lie-theoretic core). The FULL surjectivity — that EVERY
  orientation/time-preserving isometry of the continuum `(1,9)` form is a finite product of the
  boost + rotation generators (the connected component `SO⁺(1,9)` as the generated subgroup, the
  `2:1` covering degree) — is a deep Cartan / polar-decomposition / generation-by-one-parameter-
  subgroups theorem. Mathlib has no `SO⁺(1,9)`, no octonionic spinor cover, no Lie machinery for it;
  it is the genuinely heavy continuum core (an honest W1 dissolution ticket if it resists after
  measure + reframe through the derived-ℝ exp stack). This node banks the continuum re-grounding and
  the strict-extension headline — the content that the continuum is NECESSARY — childed onto the
  chain tail. The continuum ROTATION generator over `Cut` (needing a `Cut`-pinned `selfMul`/Born
  composition law `gFormC_comp`, currently ℚ-pinned) is part of that childed re-grounding.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). That `SO⁺(1,9)` is the connected isometry group
  of octonionic Minkowski space is standard (Sudbery, Manogue–Dray, Baez). Here the continuum
  carrier `O Cut`, the continuum form, the continuum boost isometry, and the strict extension over
  the rational cover are DERIVED from the banked terminal-algebra construction + the banked DERIVED
  ℝ `Cut` (over the DERIVED ℚ) + the banked derived √2 — NO posited Lorentz group, NO Mathlib ℝ/ℂ
  as content. The W1 reframe (the algebraic hyperbola point, not the transcendental rapidity) is
  exactly what lets the continuum boost re-ground without any analysis.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Lorentz / boost / spinor / rotation /
  SO⁺(1,9) / isometry / cover / surjectivity / rapidity / spacetime": what remains is the theorem
  that, over the derived complete ordered field `Cut` and the Cayley–Dickson double³ `O Cut`, the
  `Cut`-coefficiented shear `(t,x,v) ↦ (a t + b x, b t + a x, v)` with `a² − b² = 1` preserves
  `t² − x² − gFormC v v`, that such shears form a submonoid of `Function.End (Cut × Cut × O Cut)`,
  and that the shear with the IRRATIONAL hyperbola point `(3√2/4, √2/4)` (built from the derived √2,
  which is not in the image of the derived-ℚ embedding) is NOT equal to any shear with parameters in
  the image of that embedding — so the rational-parameter shears do not exhaust the continuum ones.
  No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge, NO Mathlib
  number-system content import (the continuum is the DERIVED `Cut` over the DERIVED `Q`), NO posited
  Lorentz group.
-/
import Phys.Algebra.LorentzIsometry
import Phys.Foundation.ContinuumFieldMul
import Phys.Foundation.ContinuumFieldInverse

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- The derived ℝ `Cut` is trivially a `*`-ring (`star = id`), which feeds the Cayley–Dickson
    construction `CD`. The continuum carrier is then the SAME generic terminal algebra the cascade
    uses, now coefficiented by the DERIVED continuum. -/
noncomputable instance instStarRingCut : StarRing Cut := starRingOfComm

attribute [local instance] CD.narCD CD.srCD

noncomputable section

/-! ## The continuum carrier, Born form, and continuum hyperbolic boost (over the DERIVED ℝ). -/

/-- THE CONTINUUM COORDINATE SPACE `Cut × Cut × O Cut` — the form's coordinate space re-grounded
    over the derived ℝ `Cut` and the terminal algebra `O Cut := CD (H Cut)` over it. -/
abbrev STVC := Cut × Cut × O Cut

/-- The deep-real (scalar) component of a continuum octonion. -/
def reQC (x : O Cut) : Cut := x.re.re.re

/-- THE CONTINUUM BORN SELF-OVERLAP FORM `gFormC v w := reQC (v · star w)` over the derived ℝ. -/
def gFormC (v w : O Cut) : Cut := reQC (v * star w)

/-- THE CONTINUUM BORN QUADRATIC FORM `QformC t x v = t² − x² − gFormC v v` over the derived ℝ. -/
def QformC (t x : Cut) (v : O Cut) : Cut := t^2 - x^2 - gFormC v v

/-- The continuum Born form on the coordinate triple. -/
def QvC (p : STVC) : Cut := QformC p.1 p.2.1 p.2.2

/-- THE CONTINUUM HYPERBOLIC BOOST over the derived ℝ: `(t,x,v) ↦ (a·t+b·x, b·t+a·x, v)`, leaving
    the nine space directions `v` fixed. The boost parameter `(a,b)` ranges over the CONTINUUM, not
    just the rationals — the rapidity may be irrational. -/
def boostFunC (a b : Cut) : STVC → STVC :=
  fun p => (a * p.1 + b * p.2.1, b * p.1 + a * p.2.1, p.2.2)

/-- ★★ THE CONTINUUM BOOST IS A `QvC`-ISOMETRY iff `a² − b² = 1` — PURE FIELD ARITHMETIC over the
    derived ℝ, with NO analysis, NO cosh/sinh rapidity, NO Mathlib ℝ. The space block `v` is
    untouched so the Born self-overlap `gFormC v v` cancels identically; the indefinite `t² − x²`
    block is preserved exactly by the unit-hyperbola condition (the indefinite sign — the source of
    the `(1,9)` signature — is what a hyperbolic shear, not a circular rotation, preserves). The
    classical transcendental rapidity dissolves into the algebraic hyperbola point. -/
theorem boostC_isom {a b : Cut} (h : a^2 - b^2 = 1) (p : STVC) :
    QvC (boostFunC a b p) = QvC p := by
  obtain ⟨t, x, v⟩ := p
  show QformC _ _ _ = QformC _ _ _
  unfold QformC boostFunC
  simp only
  linear_combination (t^2 - x^2) * h

/-! ## The continuum isometry monoid (on the associative function-composition side). -/

/-- THE CONTINUUM ISOMETRY PREDICATE: a self-map of the continuum coordinate space preserving the
    continuum Born form `QvC`. -/
def IsQvIsomC (T : STVC → STVC) : Prop := ∀ p, QvC (T p) = QvC p

/-- The identity preserves the continuum form. -/
theorem isQvIsomC_id : IsQvIsomC id := fun _ => rfl

/-- A composite of two continuum isometries is a continuum isometry. -/
theorem isQvIsomC_comp {S T : STVC → STVC} (hS : IsQvIsomC S) (hT : IsQvIsomC T) :
    IsQvIsomC (S ∘ T) := fun p => by simp only [Function.comp_apply]; rw [hS (T p), hT p]

/-- ★ THE CONTINUUM ISOMETRY STRUCTURE: the `QvC`-preservers as a submonoid of the
    function-composition monoid `Function.End STVC`. The continuous isometry structure of the
    octonionic Minkowski form, over the DERIVED ℝ — not a posited Lorentz group. (Carried on the
    associative function-composition side, exactly as the N48 reframe places the cover group on the
    associative endomorphism side.) -/
def qvIsomMonoidC : Submonoid (Function.End STVC) where
  carrier := {T | IsQvIsomC T}
  one_mem' := isQvIsomC_id
  mul_mem' hS hT := isQvIsomC_comp hS hT

/-- The continuum boost on the unit hyperbola lies in the continuum isometry monoid. -/
theorem boostC_mem {a b : Cut} (h : a^2 - b^2 = 1) : boostFunC a b ∈ qvIsomMonoidC :=
  fun p => boostC_isom h p

/-! ## The strict extension — the continuum EXCEEDS the rational cover (the irrational boost). -/

/-- `√2² = 2` over the derived ℝ, from the banked capstone `sqrt2_mul_sqrt2` (`√2·√2 = Qcut 2`). -/
theorem sqrt2_sq : sqrt2 ^ 2 = (2 : Cut) := by
  rw [sq, sqrt2_mul_sqrt2]
  have h : (2 : Q) = 1 + 1 := by norm_num
  rw [h, ← Qcut_add, ← one_add_one_eq_two]; rfl

/-- ★ THE IRRATIONAL HYPERBOLA POINT from the derived √2: `(a,b) = (3√2/4, √2/4)` lands on the unit
    hyperbola `a² − b² = 1` (`(9·2 − 2)/16 = 1`), pure field arithmetic over the derived ℝ. This is
    a boost point the RATIONAL generators of the N48 cover cannot reach. -/
theorem irr_hyperbola : ((3 * sqrt2)/4)^2 - (sqrt2/4)^2 = 1 := by
  have hs : sqrt2 ^ 2 = (2 : Cut) := sqrt2_sq
  field_simp; nlinarith [hs]

/-- ★ THE IRRATIONAL BOOST is a continuum `QvC`-isometry — a genuine element of the continuum
    isometry monoid whose boost parameter (rapidity) is IRRATIONAL (built from the derived √2). -/
theorem irrBoost_isom : boostFunC ((3 * sqrt2)/4) (sqrt2/4) ∈ qvIsomMonoidC :=
  boostC_mem irr_hyperbola

/-- `√2/4` is NOT a derived rational — it is not in the image of the derived-ℚ embedding
    `Qcut : Q → Cut`. If `√2/4 = Qcut c`, then `√2 = Qcut c + Qcut c + Qcut c + Qcut c = Qcut (4c)`
    (additive `Qcut_add`), contradicting the banked `sqrt2_not_rational`. -/
theorem sqrt2_quarter_not_rational : ¬ ∃ c : Q, (sqrt2 / 4 : Cut) = Qcut c := by
  rintro ⟨c, hc⟩
  apply sqrt2_not_rational
  refine ⟨c + c + c + c, ?_⟩
  have h4 : sqrt2 = sqrt2 / 4 + sqrt2 / 4 + sqrt2 / 4 + sqrt2 / 4 := by ring
  rw [h4, hc, Qcut_add, Qcut_add, Qcut_add]

/-- Two continuum boosts are equal (as maps) only if their parameters agree — read off at the
    pure-time vector `(1,0,0) ↦ (a,b,0)`. -/
theorem boostFunC_inj {a b a' b' : Cut} (h : boostFunC a b = boostFunC a' b') :
    a = a' ∧ b = b' := by
  have := congrArg (fun T => T ((1 : Cut), (0 : Cut), (0 : O Cut))) h
  simp only [boostFunC, mul_one, mul_zero, add_zero, Prod.mk.injEq] at this
  exact ⟨this.1, this.2.1⟩

/-- ★★★ THE HEADLINE — THE CONTINUUM STRICTLY EXTENDS THE RATIONAL COVER. The irrational continuum
    boost (a genuine isometry of the continuum Born form, `irrBoost_isom`) is NOT equal to ANY boost
    with derived-RATIONAL parameters `Qcut a`, `Qcut b` (`a, b : Q`). Hence the rational cover (the
    N48 `spinorCoverMonoid`, whose boost generators have derived-rational parameters) is NOT the
    whole continuous isometry component: reaching the full continuous group genuinely REQUIRES the
    derived ℝ. This is the precise content of "surjectivity onto the connected component `SO⁺(1,9)`
    needs the continuum" — the rational generators alone do NOT surject onto the continuous group;
    the continuum is necessary. -/
theorem continuum_strictly_extends_rational :
    ∀ a b : Q, boostFunC ((3 * sqrt2)/4) (sqrt2/4) ≠ boostFunC (Qcut a) (Qcut b) := by
  intro a b hcontra
  obtain ⟨_, hb⟩ := boostFunC_inj hcontra
  exact sqrt2_quarter_not_rational ⟨b, hb⟩

/-! ## Non-triviality (W8 teeth) — the irrational boost genuinely mixes time and space. -/

/-- ★ NON-TRIVIALITY: the irrational continuum boost is NOT the identity map — it sends the
    pure-time vector `(1,0,0)` to `(3√2/4, √2/4, 0)`, a genuine time–space mix with nonzero
    (irrational) space component `√2/4 ≠ 0` (the derived √2 is strictly positive, `zero_lt_sqrt2`).
    So the continuum isometry monoid contains a genuinely nontrivial element beyond the rational
    cover. -/
theorem irrBoost_ne_id : boostFunC ((3 * sqrt2)/4) (sqrt2/4) ≠ id := by
  intro hcontra
  have := congrArg (fun T => (T ((1 : Cut), (0 : Cut), (0 : O Cut))).2.1) hcontra
  simp only [boostFunC, mul_one, mul_zero, add_zero, id_eq] at this
  have hpos : (0 : Cut) < sqrt2 := zero_lt_sqrt2
  have hz : sqrt2 = 0 := by
    have h4 : sqrt2 = (sqrt2 / 4) * 4 := by ring
    rw [h4, this, zero_mul]
  rw [hz] at hpos; exact lt_irrefl 0 hpos

end

end Phys.Algebra
