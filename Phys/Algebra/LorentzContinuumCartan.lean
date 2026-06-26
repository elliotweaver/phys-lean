/-
  Phys.Algebra.LorentzContinuumCartan — N58: THE INFINITESIMAL CARTAN DECOMPOSITION of the
  continuum isometry Lie algebra over the DERIVED ℝ `Cut` — the Euclidean reference form `EvC`
  (the positive-definite companion of the indefinite Minkowski `BvC`), its positive-definiteness,
  and the split of the tangent generators into the COMPACT (rotation) and NONCOMPACT (boost)
  parts, the Lie-algebra skeleton of the polar/KAK decomposition `g = k·exp(p)`.
  ===========================================================================
  THE NEXT FORCED NODE after the positive-definite-square-root node (N57). N49–N57 banked, over
  the derived ℝ `Cut` and the terminal algebra `O Cut := CD (H Cut)`:
    • the continuum Born form `QvC = t² − x² − gFormC v v`, the isometry monoid `qvIsomMonoidC`
      (N49), the Born composition law `gFormC_comp` (N50);
    • the tangent Lie algebra `infIsomLieAlg` + the polarized Minkowski form `BvC` + the
      infinitesimal boost `boostGenC` and rotation `rotGenC a` generators + the polarized SKEW
      identity `gFormC_skew` (N51);
    • the FORWARD soundness `genIsomMonoidC2 ≤ qvIsomMonoidC` (N52–N55);
    • the BORN POSITIVITY foundation `gFormC_nonneg`/`gFormC_eq_zero_iff` + the (1,9) signature
      split (N56);
    • the POSITIVE-DEFINITE scalar square root `cutSqrt` over `Cut` (N57).

  ── THE TARGET (N58) AND THE W3 DECOMPOSITION ──
  The ticket TARGET is the GLOBAL reverse KAK surjectivity — that EVERY orientation/time-
  preserving continuum isometry of `QvC` IS a finite product of the banked generators
  (`qvIsomMonoidC` on the connected component `≤ genIsomMonoidC2`), via the polar/KAK
  decomposition `g = k·exp(p)`. That global theorem is a genuine MULTI-NODE arc: it requires
  (1) a general operator adjoint w.r.t. a positive-definite reference form, (2) `g*g` self-adjoint
  + positive-semidefinite, (3) an OPERATOR square root over the 10-dim form space (the operator
  analogue of `cutSqrt` — no Mathlib spectral theory over `Cut`), (4) the compact part `k` via
  CONNECTEDNESS of the isometry group over `Cut` (no Mathlib topology of `SO⁺(1,9)`), and (5) the
  full `Spin(9)→SO(9)` exhaustion (every spacelike rotation a finite product of `biMulFun`). None
  of (3)–(5) is bankable in one run; Mathlib has no `SO⁺(1,9)`, no octonionic spinor cover, no
  Lie-group integration over `Cut`. So — exactly the W3 pattern the ROADMAP §N58 anticipates — the
  global reverse surjectivity is childed (N59) and THIS node banks the immediately-available,
  theory-native STRUCTURAL skeleton of the polar/KAK direction: the INFINITESIMAL CARTAN
  DECOMPOSITION of the tangent algebra.

  ── THE TRUNK REFRAME (THE ONE LAW): the Cartan split is the EvC-involution of `infIsomLieAlg` ──
  The polar/KAK decomposition `g = k·exp(p)` writes a connected isometry as a COMPACT rotation `k`
  times a positive-definite NONCOMPACT boost `exp(p)`. Its Lie-algebra shadow is the Cartan split
  `𝔰𝔬(1,9) = 𝔨 ⊕ 𝔭`: relative to a positive-definite Euclidean reference form `E` (the `(+,+,…,+)`
  companion of the indefinite Minkowski `B`), the compact part `𝔨` is the `E`-SKEW generators (the
  rotations) and the noncompact part `𝔭` is the `E`-SYMMETRIC generators (the boosts). The
  positive-definite reference form is exactly what the trunk already supplies — `EvC p p =
  t² + x² + gFormC v v` is a sum of the time square, the `x` square, and the Born self-overlap
  `gFormC v v`, which N56 proved is itself a sum of eight coordinate squares — so `EvC` is
  positive-definite by the ORDER structure of the derived ℝ `Cut` (`gFormC_nonneg`/
  `gFormC_eq_zero_iff`), with no analysis, no posited inner product. The boost/rotation Cartan
  split is then PURE FIELD ARITHMETIC (the same `gFormC_skew` engine N51 used for `IsInfIsomC`),
  re-grounded over the continuum for free. The classical \"choose a maximal compact / Cartan
  involution\" dissolves into the algebraic `EvC`-symmetry vs. `EvC`-skewness of the banked
  generators.

  WHAT IS PROVED (each a theorem, foundations-only, forward from the banked objects):
    EvC                 — THE EUCLIDEAN REFERENCE FORM `E p q = t·t' + x·x' + gFormC v v'` — the
                          positive-definite `(+,+,…,+)` companion of the indefinite Minkowski `BvC`.
    EvC_self/_symm      — `EvC p p = t² + x² + gFormC v v` and symmetry (`Cut`-bilinear, symmetric).
    EvC_nonneg          — ★★ `0 ≤ EvC p p` over the derived ℝ — `EvC` is positive-SEMIdefinite, the
                          sum of two coordinate squares and the (N56-nonneg) Born self-overlap.
    EvC_eq_zero_iff     — ★★ POSITIVE-DEFINITENESS: `EvC p p = 0 ↔ p = 0` — the reference form has
                          no nonzero null vector (the non-degeneracy the polar positive part needs).
    EvC_one_pos         — NON-VACUITY: `0 < EvC` on a concrete nonzero vector (`= 1`).
    IsEvCSymm/IsEvCSkew — the 𝔭 (EvC-symmetric) and 𝔨 (EvC-skew) membership predicates.
    boostGenC_EvC_symm  — ★★ THE NONCOMPACT PART: the infinitesimal boost `(t,x,v) ↦ (x,t,0)` is
                          EvC-SYMMETRIC (`EvC(Tp)q = EvC p(Tq)`) — it lies in `𝔭`, by pure field
                          arithmetic on the `(t,x)` block.
    rotGenC_EvC_skew    — ★★ THE COMPACT PART: the infinitesimal rotation `(t,x,v) ↦ (0,0,a·v)` for
                          imaginary `a` (`gFormC a 1 = 0`) is EvC-SKEW (`EvC(Tp)q + EvC p(Tq) = 0`)
                          — it lies in `𝔨`, via the polarized Born skew identity `gFormC_skew`.
    boostGenC_not_EvC_skew — ★ NON-VACUITY (W8 teeth): the boost is NOT EvC-skew — the compact and
                          noncompact parts are genuinely DISTINCT, the split is nontrivial.

  ── THE W1 HEAVY REMAINDER (childed N59, an honest dissolution ticket, NOT closed here) ──
  The global reverse surjectivity — `qvIsomMonoidC` on the connected component `≤ genIsomMonoidC2`,
  via the operator-level polar/KAK `g = k·exp(p)` — needs the OPERATOR square root over the 10-dim
  form space (lifting `cutSqrt`), the form-adjoint `g*` w.r.t. `EvC`/`BvC`, connectedness, and the
  full `Spin(9)→SO(9)` exhaustion (every spacelike rotation a finite product of `biMulFun`). That
  global Lie-group machinery has no Mathlib analogue over `Cut`; it is the genuine HEAVY core,
  childed onto the chain tail as an honest W1 dissolution ticket. THIS node banks its infinitesimal
  Cartan skeleton — the compact/noncompact split of the tangent generators relative to the
  positive-definite reference form.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). That `SO⁺(1,9)` has a Cartan decomposition
  `𝔰𝔬(1,9) = 𝔨 ⊕ 𝔭` with `𝔨 ≅ 𝔰𝔬(9)` compact and `𝔭` the boosts is standard (Helgason, Knapp).
  Here the Euclidean reference form, its positive-definiteness, and the compact/noncompact split of
  the generators DESCEND from the banked continuum Born self-overlap (positive-definite, N56) +
  the polarized Born skew identity (`gFormC_skew`, N51) over the DERIVED ℝ `Cut` — NO posited
  Cartan involution, NO posited maximal compact, NO posited inner product, NO Mathlib ℝ/ℂ as
  content. The W1 reframe (the Cartan split is the EvC-symmetric/EvC-skew dichotomy of the banked
  generators, EvC positive-definite by the order structure of the continuum) is exactly what makes
  the polar direction's Lie-algebra skeleton re-ground over the continuum without any analysis.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Lorentz / boost / rotation / Cartan / KAK
  / polar / compact / noncompact / isometry / Spin / SO(9) / Euclidean / symmetric-as-physics /
  skew-as-physics": what remains is the theorem that, over the derived complete ordered field `Cut`
  and the Cayley–Dickson double³ `O Cut`, the symmetric bilinear form `EvC p q = t·t' + x·x' +
  gFormC v v'` satisfies `0 ≤ EvC p p` with equality iff `p = 0`; that the `Cut`-linear map
  `(t,x,v) ↦ (x,t,0)` satisfies `EvC(Tp)q = EvC p(Tq)`; that `(t,x,v) ↦ (0,0,a·v)` for every `a`
  with `gFormC a 1 = 0` satisfies `EvC(Tp)q + EvC p(Tq) = 0`; and that the first map does NOT
  satisfy the second (skew) identity. No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge, NO Mathlib
  number-system content import (the continuum is the DERIVED `Cut`), NO posited Lorentz group, NO
  posited Cartan involution / inner product.
-/
import Phys.Algebra.LorentzContinuumSqrt

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section

/-! ## The Euclidean reference form — the positive-definite companion of the Minkowski form. -/

/-- THE EUCLIDEAN REFERENCE FORM `E p q = t·t' + x·x' + gFormC v v'` — the positive-definite
    `(+,+,…,+)` companion of the indefinite Minkowski form `BvC = t·t' − x·x' − gFormC v v'`. The
    reference form relative to which the polar/KAK Cartan split is taken. -/
def EvC (p q : STVC) : Cut := p.1 * q.1 + p.2.1 * q.2.1 + gFormC p.2.2 q.2.2

/-- The reference form on the diagonal: `E p p = t² + x² + gFormC v v` — the sum of the time
    square, the `x` square, and the Born self-overlap. -/
theorem EvC_self (p : STVC) : EvC p p = p.1 ^ 2 + p.2.1 ^ 2 + gFormC p.2.2 p.2.2 := by
  obtain ⟨t, x, v⟩ := p
  show t * t + x * x + gFormC v v = t ^ 2 + x ^ 2 + gFormC v v
  ring

/-- `EvC` is symmetric. -/
theorem EvC_symm (p q : STVC) : EvC p q = EvC q p := by
  obtain ⟨t, x, v⟩ := p; obtain ⟨t', x', v'⟩ := q
  show t * t' + x * x' + gFormC v v' = t' * t + x' * x + gFormC v' v
  rw [gFormC_symm v v']; ring

/-- ★★ `EvC` IS POSITIVE-SEMIDEFINITE: `0 ≤ EvC p p` over the derived ℝ `Cut`. The reference form
    is the sum of two coordinate squares (`t²`, `x²`) and the Born self-overlap `gFormC v v`, which
    N56 `gFormC_nonneg` proved is itself a sum of eight squares — nonnegative by the order structure
    of the continuum. NO analysis, NO posited inner product. -/
theorem EvC_nonneg (p : STVC) : 0 ≤ EvC p p := by
  rw [EvC_self]
  have hnn := gFormC_nonneg p.2.2
  nlinarith [sq_nonneg p.1, sq_nonneg p.2.1, hnn]

/-- ★★ POSITIVE-DEFINITENESS: `EvC p p = 0 ↔ p = 0`. The Euclidean reference form has no nonzero
    null vector — a sum of squares (plus the positive-definite Born self-overlap) vanishes iff
    every part vanishes iff `p = 0`. The non-degeneracy the polar decomposition's positive part
    requires, DERIVED from the order structure of the continuum + N56 `gFormC_eq_zero_iff`. -/
theorem EvC_eq_zero_iff (p : STVC) : EvC p p = 0 ↔ p = 0 := by
  obtain ⟨t, x, v⟩ := p
  rw [EvC_self]
  constructor
  · intro h
    simp only at h
    have hnn := gFormC_nonneg v
    have ht : t = 0 := by nlinarith [sq_nonneg t, sq_nonneg x, hnn]
    have hx : x = 0 := by nlinarith [sq_nonneg t, sq_nonneg x, hnn]
    have hv : v = 0 := by
      have : gFormC v v = 0 := by nlinarith [sq_nonneg t, sq_nonneg x, hnn]
      exact (gFormC_eq_zero_iff v).mp this
    subst ht; subst hx; subst hv; rfl
  · intro h
    rw [Prod.ext_iff, Prod.ext_iff] at h
    obtain ⟨ht, hx, hv⟩ := h
    simp only at ht hx hv
    rw [ht, hx, hv]
    show (0 : Cut) ^ 2 + 0 ^ 2 + gFormC 0 0 = 0
    rw [gFormC_zero_left]; ring

/-- NON-VACUITY (W8): the reference form is strictly positive on a concrete nonzero vector,
    `0 < EvC (1,0,0) (1,0,0)` (`= 1`). -/
theorem EvC_one_pos : 0 < EvC ((1 : Cut), (0 : Cut), (0 : O Cut)) ((1 : Cut), (0 : Cut), (0 : O Cut)) := by
  rw [EvC_self]
  show 0 < (1 : Cut) ^ 2 + (0 : Cut) ^ 2 + gFormC 0 0
  rw [gFormC_zero_left]
  norm_num

/-! ## The Cartan split — the compact (EvC-skew) and noncompact (EvC-symmetric) generators. -/

/-- THE NONCOMPACT (𝔭) MEMBERSHIP PREDICATE: a `Cut`-linear self-map is EvC-SYMMETRIC iff
    `∀ p q, E(T p) q = E p (T q)`. The boost-type generators of the Cartan decomposition. -/
def IsEvCSymm (T : Module.End Cut STVC) : Prop := ∀ p q : STVC, EvC (T p) q = EvC p (T q)

/-- THE COMPACT (𝔨) MEMBERSHIP PREDICATE: a `Cut`-linear self-map is EvC-SKEW iff
    `∀ p q, E(T p) q + E p (T q) = 0`. The rotation-type generators of the Cartan decomposition. -/
def IsEvCSkew (T : Module.End Cut STVC) : Prop := ∀ p q : STVC, EvC (T p) q + EvC p (T q) = 0

/-- ★★ THE NONCOMPACT PART: the infinitesimal boost `(t,x,v) ↦ (x,t,0)` (N51 `boostGenC`) is
    EvC-SYMMETRIC — it lies in the noncompact part `𝔭` of the Cartan decomposition, by pure field
    arithmetic on the `(t,x)` block (the `v`-block is sent to `0`, so its `gFormC` term vanishes).
    Combined with `boostGenC_inf` (N51, `BvC`-skew) this is the polar/KAK \"boost part\": a generator
    that is `BvC`-skew (an infinitesimal isometry) AND `EvC`-symmetric (positive/noncompact). -/
theorem boostGenC_EvC_symm : IsEvCSymm boostGenC := by
  intro p q
  obtain ⟨t, x, v⟩ := p; obtain ⟨t', x', v'⟩ := q
  show EvC (x, t, (0 : O Cut)) (t', x', v') = EvC (t, x, v) (x', t', (0 : O Cut))
  show x * t' + t * x' + gFormC 0 v' = t * x' + x * t' + gFormC v 0
  rw [gFormC_zero_left, gFormC_symm v 0, gFormC_zero_left]; ring

/-- ★★ THE COMPACT PART: the infinitesimal rotation `(t,x,v) ↦ (0,0,a·v)` for imaginary `a`
    (`gFormC a 1 = 0`, N51 `rotGenC`) is EvC-SKEW — it lies in the compact part `𝔨` of the Cartan
    decomposition. The `(t,x)` block is sent to `0`, and on the space block the polarized Born skew
    identity gives `gFormC (a·v) v' + gFormC v (a·v') = 2·gFormC a 1·gFormC v v' = 0`. Derived from
    `gFormC_skew` (N51), NO coordinate brute. Combined with `rotGenC_inf` (N51, also `BvC`-skew)
    this is the polar/KAK \"rotation part\": a generator that is both `BvC`-skew and `EvC`-skew
    (compact). -/
theorem rotGenC_EvC_skew {a : O Cut} (ha : gFormC a 1 = 0) : IsEvCSkew (rotGenC a) := by
  intro p q
  obtain ⟨t, x, v⟩ := p; obtain ⟨t', x', v'⟩ := q
  show EvC (0, 0, a * v) (t', x', v') + EvC (t, x, v) (0, 0, a * v') = 0
  show (0 * t' + 0 * x' + gFormC (a * v) v') + (t * 0 + x * 0 + gFormC v (a * v')) = 0
  have hskew := gFormC_skew a v v'
  rw [ha, mul_zero, zero_mul] at hskew
  linarith [hskew]

/-- ★ NON-VACUITY (W8 teeth): the infinitesimal boost is NOT EvC-skew. The compact (`EvC`-skew,
    rotation) and noncompact (`EvC`-symmetric, boost) parts of the Cartan decomposition are
    genuinely DISTINCT — read off at `p = (1,0,0)`, `q = (0,1,0)`: `E(T p) q + E p (T q) =
    E(0,1,0)(0,1,0) + E(1,0,0)(1,0,0) = 1 + 1 = 2 ≠ 0`. So the split into 𝔨 ⊕ 𝔭 is nontrivial. -/
theorem boostGenC_not_EvC_skew : ¬ IsEvCSkew boostGenC := by
  intro h
  have := h ((1 : Cut), (0 : Cut), (0 : O Cut)) ((0 : Cut), (1 : Cut), (0 : O Cut))
  simp only [boostGenC, LinearMap.coe_mk, AddHom.coe_mk, EvC] at this
  rw [show gFormC (0 : O Cut) 0 = 0 by rw [gFormC_zero_left]] at this
  norm_num at this

end

end Phys.Algebra
