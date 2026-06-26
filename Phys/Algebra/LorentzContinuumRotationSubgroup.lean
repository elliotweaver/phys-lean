/-
  Phys.Algebra.LorentzContinuumRotationSubgroup — N53: THE ROTATION ONE-PARAMETER SUBGROUP over
  the DERIVED ℝ `Cut` — the COMPACT MIRROR of the N52 boost one-parameter subgroup, the CIRCLE
  group of rotations around a fixed imaginary unit, derived through the banked left-ALTERNATIVE
  (operator-square) law, DERIVED.
  ===========================================================================
  THE NEXT FORCED NODE after the boost-one-parameter-subgroup node (N52). N52 banked the BOOST
  one-parameter subgroup `boostOPS ≤ qvIsomMonoidC` — the abelian HYPERBOLA group `(a,b)·(a',b') =
  (a a'+b b', a b'+b a')`, the finite exp-polynomial in the N51 infinitesimal boost generator
  `boostGenC`. This node builds its COMPACT SIBLING: the ROTATION one-parameter subgroup, the
  abelian CIRCLE group of rotations around a single fixed imaginary unit `a` of the terminal
  algebra `O Cut`, re-grounded over the derived ℝ `Cut`.

  ── THE ONE LAW / W1 REFRAME — non-associativity DISSOLVES on the single-unit subalgebra, via the
     banked left-ALTERNATIVE law; the transcendental cos/sin is the rotation-angle habit ──
  The naive global rotation composition `rotFunC u ∘ rotFunC u' = rotFunC (u·u')` (N50) FAILS for
  GENERIC octonionic `u, u'` by NON-ASSOCIATIVITY (`u·(u'·v) ≠ (u·u')·v`, banked
  `not_associative`). But the genuine one-parameter SUBGROUP iterates a SINGLE fixed imaginary unit
  `a`, and the iterates live inside the ASSOCIATIVE subalgebra the alternative law governs: for an
  imaginary unit `a` the banked operator-square law `L_sq_imag`/`scaling_law` (the LEFT-ALTERNATIVE
  law, `Phys/Algebra/Operator.lean`) gives `a·(a·v) = −(ι(Nrm a)·v)`, and at a unit (`Nrm a = 1`,
  `ι 1 = 1`) this is the clean operator relation

      a · (a · v) = − v                                                       [UNIT-IMAGINARY SQUARE]

  exactly the compact analogue of the boost generator's `boostGenC² = (block projection)`. The
  rotation generator is `rotCircFun a c s : (t,x,v) ↦ (t,x, c•v + s•(a·v))`, parametrized by the
  algebraic CIRCLE point `(c,s)` (`c²+s²=1`) rather than the transcendental angle `(cos θ, sin θ)`:
  the would-be `cos θ • v + sin θ • (a·v)` becomes the algebraic circle point, dissolving the
  rotation angle exactly as N52 dissolved the rapidity and N49 dissolved the boost rapidity. NO
  transcendental cos/sin, NO Mathlib ℝ — pure module algebra over the derived `Cut` plus the one
  banked alternative-law relation. The one-parameter subgroup it sweeps is the abelian CIRCLE group
  `{(c,s) | c²+s²=1}` under `(c,s)·(c',s') = (c c'−s s', c s'+s c')`, the compact mirror of N52's
  hyperbola group (the sign of the cross term flips: `−s s'` for the circle vs `+b b'` for the
  hyperbola — the compact vs non-compact signature).

  WHAT IS PROVED (each a theorem, foundations-only, forward from the banked objects):
    rotCircFun            — the rotation circle generator `(t,x,v) ↦ (t,x, c•v + s•(a·v))` around a
                            fixed imaginary unit `a`, the compact sibling of `boostFunC`.
    rotCircFun_comp       — ★★ THE COMPOSITION LAW (the one-parameter-subgroup law): under the
                            unit-imaginary square `a·(a·v) = −v`, two rotations compose to a rotation
                            with the algebraic CIRCLE-GROUP product `(c,s)·(c',s') =
                            (c c'−s s', c s'+s c')`. The non-associativity subtlety DISSOLVED on the
                            single-unit alternative subalgebra — the theory-native `exp((θ+φ)R) =
                            exp(θR)·exp(φR)`, the group coordinate the circle point, not the angle.
    circParam_circle_mul  — ★ THE CIRCLE CLOSURE `(c c'−s s')² + (c s'+s c')² = (c²+s²)(c'²+s'²)`:
                            the group product of two circle points is a circle point.
    rotCircFun_one        — the identity rotation `rotCircFun a 1 0 = id` (the circle point `(1,0)`).
    rotCircFun_inv        — the group inverse: `c²+s²=1 → rotCircFun a c s ∘ rotCircFun a c (−s) =
                            id` under the unit-imaginary square (the inverse circle point `(c,−s)`).
    rotCircFun_eq_rotFunC — `rotCircFun a c s = rotFunC (c•1 + s•a)`: the circle generator IS the
                            banked N50 global rotation by the unit-circle element `c•1 + s•a`.
    gFormC_circParam_self — the Born self-overlap of `c•1+s•a` expands bilinearly:
                            `gFormC (c•1+s•a)(c•1+s•a) = c²·gFormC 1 1 + c s·gFormC a 1 +
                            c s·gFormC 1 a + s²·gFormC a a`.
    rotCircFun_isom       — ★★ THE ROTATION IS A `QvC`-ISOMETRY when `(c,s)` is on the unit circle
                            (`c²+s²=1`) and `a` is an imaginary Born-unit (`gFormC 1 a = 0`,
                            `gFormC a a = 1`): via `rotCircFun_eq_rotFunC` + the banked N50 `rotC_isom`
                            (the parameter `c•1+s•a` is itself a Born-unit, `gFormC = c²+s² = 1`).
    rotCircOPS            — ★ THE ROTATION ONE-PARAMETER SUBGROUP as a `Submonoid (Function.End STVC)`
                            for a fixed unit-imaginary `a` (`a·(a·v) = −v`): the circle-parametrized
                            rotation family, closed under composition (the circle-group product).
    rotCircOPS_le_isom    — ★ `rotCircOPS ≤ qvIsomMonoidC` for an imaginary Born-unit `a`: every
                            rotation in the subgroup preserves the continuum Born form `QvC`.
    e2 concrete (e2_imag, e2_alt, e2_gFormC_self, e2_gFormC_one, rotCircOPS_e2_ne_bot) — ★ NON-VACUITY
                            (W8): the cascade's terminal imaginary unit `a = e₂ : O Cut` satisfies the
                            unit-imaginary square + the Born-unit conditions over the derived ℝ, and
                            the rotation subgroup around it is NOT the trivial `{1}` group (the
                            quarter-turn `(c,s)=(0,1)` is a genuine non-identity rotation).

  WHAT IS CHILDED (N54, the heavy KAK remainder). The HEAVY core — that EVERY orientation/time-
  preserving continuum isometry of `QvC` is a FINITE PRODUCT of the boost (`boostOPS`) + rotation
  (`rotCircOPS`) one-parameter subgroups (the Cartan/polar KAK decomposition, the actual surjectivity
  onto the connected component `SO⁺(1,9)`) — is a deep global Lie-group theorem (polar decomposition
  `g = k·exp(p)` + connectedness + topology over the derived ℝ; Mathlib has no `SO⁺(1,9)`, no
  octonionic spinor cover, no Lie-group integration over `Cut`). It is the genuine W1 HEAVY remainder
  — an honest dissolution ticket, to be attacked from the Born positivity (the polar decomposition of
  a form-isometry into a positive-definite boost part `exp(p)` and a compact rotation part `k`) rather
  than a coordinate KAK grind. Also childed: the full non-associative `SO(9)` rotation completion
  (the Moufang/`Spin(9)→SO(9)` cover, where non-associativity forces a paired/triple product beyond
  the single-unit circle subgroups). This node banks the rotation one-parameter subgroup — the compact
  mirror completing both one-parameter generator families over the derived ℝ; the global finite-product
  surjectivity is childed onto the chain tail.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). That the compact part of the octonionic Minkowski
  isometry group is swept by rotations around imaginary units is standard (Sudbery, Manogue–Dray,
  Baez). Here the rotation one-parameter subgroup, its circle-group composition/inverse laws, and its
  Born-form preservation DESCEND from the banked left-ALTERNATIVE operator-square law `L_sq_imag`
  (`Phys/Algebra/Operator.lean`) + the banked continuum rotation `rotFunC`/`rotC_isom` (N50) + the
  module structure on the terminal algebra `O Cut` over the DERIVED ℝ `Cut` — NO posited Lorentz
  group, NO Mathlib ℝ/ℂ as content. The W1 reframe (the non-associativity DISSOLVING on the
  single-unit alternative subalgebra, the algebraic circle point in place of the transcendental
  rotation angle) is exactly what lets the rotation subgroup re-ground over the continuum with no
  analysis and no posited associativity.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Lorentz / boost / rotation / Spin /
  SO⁺(1,9) / SO(9) / isometry / cover / generator / one-parameter / circle / compact / KAK / Cartan":
  what remains is the theorem that, over the derived complete ordered field `Cut` and the
  Cayley–Dickson double³ `O Cut`, for a fixed `a` with `a·(a·v) = −v` for all `v`, the `Cut`-maps
  `(t,x,v) ↦ (t,x, c•v + s•(a·v))` form a submonoid of `Function.End (Cut × Cut × O Cut)` under
  composition (composition law `(c,s)(c',s') = (c c'−s s', c s'+s c')`, unit `(1,0)`, inverse
  `(c,−s)`), contained — when `c²+s²=1`, `gFormC 1 a = 0`, `gFormC a a = 1` — in the submonoid
  preserving `t² − x² − gFormC v v`, and each equals `(t,x,v) ↦ (t,x,(c•1+s•a)·v)`. No theorem
  STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge, NO Mathlib
  number-system content import (the continuum is the DERIVED `Cut`), NO posited Lorentz group.
-/
import Phys.Algebra.LorentzContinuumExpIntegration
import Phys.Algebra.Operator

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section

/-! ## The rotation circle generator (around a fixed imaginary unit of the terminal algebra). -/

/-- THE ROTATION CIRCLE GENERATOR over the derived ℝ: `(t,x,v) ↦ (t,x, c•v + s•(a·v))`, rotating the
    nine space directions in the `{v, a·v}` plane by the circle point `(c,s)`, leaving the time–space
    `(t,x)` block fixed. The compact sibling of the hyperbolic boost `boostFunC` — the rotation around
    a fixed imaginary unit `a`, parametrized by the algebraic circle point not the transcendental
    angle. -/
def rotCircFun (a : O Cut) (c s : Cut) : STVC → STVC :=
  fun p => (p.1, p.2.1, c • p.2.2 + s • (a * p.2.2))

/-- ★★ THE COMPOSITION LAW (the one-parameter-subgroup law) for the rotation around a fixed
    unit-imaginary `a` (`a·(a·v) = −v` for all `v`, the banked left-alternative operator square):
    the rotations compose to a rotation with the algebraic CIRCLE-GROUP product `(c,s)·(c',s') =
    (c c'−s s', c s'+s c')`. The octonion non-associativity DISSOLVES on the single-unit alternative
    subalgebra — the theory-native `exp((θ+φ)R) = exp(θR)·exp(φR)`, the group coordinate the circle
    point, not the angle. The compact mirror of `boostFunC_comp` (the `−s s'` cross term is the
    compact-signature flip of the boost's `+b b'`). -/
theorem rotCircFun_comp (a : O Cut) (halt : ∀ v : O Cut, a * (a * v) = -v) (c s c' s' : Cut) :
    rotCircFun a c s ∘ rotCircFun a c' s' = rotCircFun a (c*c' - s*s') (c*s' + s*c') := by
  funext p
  obtain ⟨t, x, v⟩ := p
  show (t, x, c • (c' • v + s' • (a * v)) + s • (a * (c' • v + s' • (a * v))))
      = (t, x, (c*c' - s*s') • v + (c*s' + s*c') • (a * v))
  refine Prod.ext rfl (Prod.ext rfl ?_)
  show c • (c' • v + s' • (a * v)) + s • (a * (c' • v + s' • (a * v)))
      = (c*c' - s*s') • v + (c*s' + s*c') • (a * v)
  rw [mul_add_na, smulCompat_oCut.hr, smulCompat_oCut.hr, halt v,
    smul_add, smul_add, smul_smul, smul_smul, smul_smul, smul_smul, smul_neg]
  module

/-- ★ THE CIRCLE CLOSURE: the group product of two circle points lands back on the circle.
    `(c c'−s s')² + (c s'+s c')² = (c²+s²)(c'²+s'²)`. With `c²+s²=1` and `c'²+s'²=1` the product is
    again a unit-circle point — the rotation family is closed under composition. The compact mirror
    of the hyperbola closure `boostParam_hyp_mul`. -/
theorem circParam_circle_mul (c s c' s' : Cut) :
    (c*c' - s*s')^2 + (c*s' + s*c')^2 = (c^2 + s^2) * (c'^2 + s'^2) := by ring

/-- The identity rotation `rotCircFun a 1 0 = id` — the circle-group unit (the circle point `(1,0)`). -/
theorem rotCircFun_one (a : O Cut) : rotCircFun a (1 : Cut) (0 : Cut) = id := by
  funext p
  obtain ⟨t, x, v⟩ := p
  show (t, x, (1 : Cut) • v + (0 : Cut) • (a * v)) = (t, x, v)
  refine Prod.ext rfl (Prod.ext rfl ?_)
  show (1 : Cut) • v + (0 : Cut) • (a * v) = v
  rw [one_smul, zero_smul, add_zero]

/-- The group inverse: on the unit circle, `rotCircFun a c s ∘ rotCircFun a c (−s) = id` (the inverse
    circle point is `(c,−s)`) under the unit-imaginary square. Every rotation in the subgroup is
    invertible. The compact mirror of `boostFunC_inv`. -/
theorem rotCircFun_inv (a : O Cut) (halt : ∀ v : O Cut, a * (a * v) = -v) {c s : Cut}
    (h : c^2 + s^2 = 1) :
    rotCircFun a c s ∘ rotCircFun a c (-s) = id := by
  rw [rotCircFun_comp a halt]
  have hc : c*c - s*(-s) = 1 := by nlinarith [h]
  have hs : c*(-s) + s*c = 0 := by ring
  rw [hc, hs, rotCircFun_one]

/-! ## The rotation circle generator IS the banked N50 global rotation by a unit-circle element. -/

/-- `rotCircFun a c s = rotFunC (c•1 + s•a)`: the rotation circle generator is exactly the banked N50
    global rotation `rotFunC` by the element `c•1 + s•a` of the terminal algebra. The left
    distributivity `add_mul_na` + the smul–mul compatibility `smulCompat_oCut.hl` reorganize the
    `{1, a}`-plane action into a single left-multiplication. -/
theorem rotCircFun_eq_rotFunC (a : O Cut) (c s : Cut) :
    rotCircFun a c s = rotFunC (c • (1 : O Cut) + s • a) := by
  funext p
  obtain ⟨t, x, v⟩ := p
  show (t, x, c • v + s • (a * v)) = (t, x, (c • (1 : O Cut) + s • a) * v)
  refine Prod.ext rfl (Prod.ext rfl ?_)
  show c • v + s • (a * v) = (c • (1 : O Cut) + s • a) * v
  rw [add_mul_na, smulCompat_oCut.hl, smulCompat_oCut.hl, one_mul]

/-- The Born self-overlap of `c•1 + s•a` expands bilinearly through the banked `gFormC` bilinearity:
    `gFormC (c•1+s•a)(c•1+s•a) = c²·gFormC 1 1 + c s·gFormC a 1 + c s·gFormC 1 a + s²·gFormC a a`. -/
theorem gFormC_circParam_self (a : O Cut) (c s : Cut) :
    gFormC (c • (1 : O Cut) + s • a) (c • (1 : O Cut) + s • a)
      = c^2 * gFormC 1 1 + c*s * gFormC a 1 + c*s * gFormC 1 a + s^2 * gFormC a a := by
  rw [gFormC_add_left, gFormC_add_right, gFormC_add_right,
    gFormC_smul_left, gFormC_smul_left, gFormC_smul_right, gFormC_smul_right,
    gFormC_smul_left, gFormC_smul_left, gFormC_smul_right, gFormC_smul_right]
  ring

/-- ★★ THE ROTATION IS A `QvC`-ISOMETRY when `(c,s)` is on the unit circle (`c²+s²=1`) and `a` is an
    imaginary Born-unit (`gFormC 1 a = 0`, `gFormC a a = 1`): the parameter `c•1+s•a` is itself a
    Born-unit (`gFormC (c•1+s•a)(c•1+s•a) = c²·1 + 0 + 0 + s²·1 = c²+s² = 1`), so the banked N50
    `rotC_isom` applies. The compact generator preserves the continuum Born form, with NO analysis. -/
theorem rotCircFun_isom (a : O Cut) {c s : Cut} (hcs : c^2 + s^2 = 1)
    (ha1 : gFormC (1 : O Cut) a = 0) (haa : gFormC a a = 1) (p : STVC) :
    QvC (rotCircFun a c s p) = QvC p := by
  rw [rotCircFun_eq_rotFunC]
  apply rotC_isom
  rw [gFormC_circParam_self, gFormC_one, haa, gFormC_symm a 1, ha1]
  linear_combination hcs

/-- The Born-unit circle rotation lies in the continuum isometry monoid `qvIsomMonoidC`. -/
theorem rotCircFun_mem (a : O Cut) {c s : Cut} (hcs : c^2 + s^2 = 1)
    (ha1 : gFormC (1 : O Cut) a = 0) (haa : gFormC a a = 1) :
    (rotCircFun a c s : Function.End STVC) ∈ qvIsomMonoidC :=
  fun p => rotCircFun_isom a hcs ha1 haa p

/-! ## The rotation one-parameter subgroup as a submonoid. -/

/-- ★ THE ROTATION ONE-PARAMETER SUBGROUP as a `Submonoid (Function.End STVC)` for a fixed
    unit-imaginary `a` (`a·(a·v) = −v`): the circle-parametrized rotation family `{T | ∃ c s, c²+s²=1
    ∧ T = rotCircFun a c s}`, closed under composition (the circle-group product, `rotCircFun_comp` +
    `circParam_circle_mul`) with unit `rotCircFun a 1 0`. The integrated one-parameter subgroup whose
    tangent is the N51 infinitesimal rotation generator `rotGenC a` — the compact mirror of N52's
    `boostOPS`. -/
def rotCircOPS (a : O Cut) (halt : ∀ v : O Cut, a * (a * v) = -v) : Submonoid (Function.End STVC) where
  carrier := {T | ∃ c s : Cut, c^2 + s^2 = 1 ∧ T = rotCircFun a c s}
  one_mem' := ⟨1, 0, by ring, (rotCircFun_one a).symm⟩
  mul_mem' := by
    rintro S T ⟨c, s, hcs, rfl⟩ ⟨c', s', hcs', rfl⟩
    refine ⟨c*c' - s*s', c*s' + s*c', ?_, ?_⟩
    · rw [circParam_circle_mul, hcs, hcs']; ring
    · exact rotCircFun_comp a halt c s c' s'

@[simp] theorem mem_rotCircOPS (a : O Cut) (halt : ∀ v : O Cut, a * (a * v) = -v)
    {T : Function.End STVC} :
    T ∈ rotCircOPS a halt ↔ ∃ c s : Cut, c^2 + s^2 = 1 ∧ T = rotCircFun a c s := Iff.rfl

/-- ★ `rotCircOPS ≤ qvIsomMonoidC` for an imaginary Born-unit `a` (`gFormC 1 a = 0`, `gFormC a a =
    1`): every rotation in the one-parameter subgroup preserves the continuum Born form `QvC` — the
    compact generator family, integrated, is a global continuum isometry. The compact mirror of
    `boostOPS_le_isom`. -/
theorem rotCircOPS_le_isom (a : O Cut) (halt : ∀ v : O Cut, a * (a * v) = -v)
    (ha1 : gFormC (1 : O Cut) a = 0) (haa : gFormC a a = 1) :
    rotCircOPS a halt ≤ qvIsomMonoidC := by
  rintro T ⟨c, s, hcs, rfl⟩
  exact rotCircFun_mem a hcs ha1 haa

/-! ## CONCRETE + NON-VACUITY (W8) on the cascade's terminal imaginary unit `a = e₂ : O Cut`. -/

/-- The new generator `e₂` of the last doubling is IMAGINARY in `O Cut` (`star e₂ = −e₂`). -/
theorem e2_imag : star (CD.e2 : O Cut) = -(CD.e2 : O Cut) := by ext <;> simp [CD.e2]

/-- ★ THE UNIT-IMAGINARY SQUARE for `e₂` over the derived ℝ: `e₂·(e₂·v) = −v` for all `v`. From the
    banked left-alternative operator-square law `L_sq_imag` (`e₂·(e₂·v) = −(ι(Nrm e₂)·v)`) with the
    unit self-overlap `Nrm e₂ = 1`, `ι 1 = 1`. The compact analogue of `boostGenC² = projection`. -/
theorem e2_alt (v : O Cut) : (CD.e2 : O Cut) * ((CD.e2 : O Cut) * v) = -v := by
  have h := L_sq_imag (CD.e2 : O Cut) e2_imag v
  rw [h]
  have hN : (CD.iota (CD.Nrm (CD.e2 : O Cut)) : O Cut) = 1 := by
    rw [show CD.Nrm (CD.e2 : O Cut) = (1 : H Cut) by rw [CD.Nrm_def]; simp [CD.e2]]
    ext <;> simp [CD.iota]
  rw [hN, one_mul]

/-- The Born self-overlap of the unit generator is `1`: `gFormC e₂ e₂ = 1` over the derived ℝ. -/
theorem e2_gFormC_self : gFormC (CD.e2 : O Cut) (CD.e2 : O Cut) = 1 := by
  show reQC ((CD.e2 : O Cut) * star (CD.e2 : O Cut)) = 1
  rw [e2_imag]
  simp only [reQC, CD.e2]
  simp [CD.mul_re, CD.neg_re]

/-- The unit generator `e₂` is orthogonal to `1`: `gFormC 1 e₂ = 0` (it is imaginary, no scalar
    component). -/
theorem e2_gFormC_one : gFormC (1 : O Cut) (CD.e2 : O Cut) = 0 := by
  show reQC ((1 : O Cut) * star (CD.e2 : O Cut)) = 0
  rw [e2_imag, one_mul]
  simp only [reQC, CD.e2]
  simp [CD.neg_re]

/-- THE ROTATION ONE-PARAMETER SUBGROUP around the cascade's terminal imaginary unit `e₂`, realized
    over the derived ℝ. -/
def rotCircOPS_e2 : Submonoid (Function.End STVC) := rotCircOPS (CD.e2 : O Cut) e2_alt

/-- The quarter-turn rotation `(c,s) = (0,1)` around `e₂` lies in the rotation one-parameter
    subgroup. -/
theorem quarterTurn_mem_rotCircOPS_e2 :
    (rotCircFun (CD.e2 : O Cut) 0 1 : Function.End STVC) ∈ rotCircOPS_e2 :=
  ⟨0, 1, by ring, rfl⟩

/-- The quarter-turn rotation around `e₂` is not the identity map — it sends the space vector
    `(0,0,1)` to `(0,0,e₂)` with `e₂ ≠ 1`, a genuine non-identity rotation. -/
theorem rotCircFun_e2_quarter_ne_id : rotCircFun (CD.e2 : O Cut) 0 1 ≠ id := by
  intro hc
  have heval := congrArg (fun T => (T ((0 : Cut), (0 : Cut), (1 : O Cut))).2.2) hc
  simp only [rotCircFun, mul_one, zero_smul, one_smul, zero_add, id_eq] at heval
  -- heval : e₂ = 1
  have hne : (CD.e2 : O Cut) ≠ 1 := by
    intro hc2
    -- if e₂ = 1 then gFormC 1 e₂ = gFormC 1 1, i.e. 0 = 1 by the banked Born facts
    have h0 : gFormC (1 : O Cut) (CD.e2 : O Cut) = 0 := e2_gFormC_one
    rw [hc2, gFormC_one] at h0
    exact one_ne_zero h0
  exact hne heval

/-- ★ NON-VACUITY (W8): the rotation one-parameter subgroup around `e₂` is NOT the trivial `{1}`
    group — the quarter-turn `(c,s)=(0,1)` sends the space vector `(0,0,1)` to `(0,0,e₂)` with
    `e₂ ≠ 1`, a genuine non-identity rotation. So `rotCircOPS_e2 ≠ ⊥`. -/
theorem rotCircOPS_e2_ne_bot : rotCircOPS_e2 ≠ ⊥ := by
  intro hbot
  have hmem : (rotCircFun (CD.e2 : O Cut) 0 1 : Function.End STVC) ∈ rotCircOPS_e2 :=
    quarterTurn_mem_rotCircOPS_e2
  rw [hbot] at hmem
  have h1 : (rotCircFun (CD.e2 : O Cut) 0 1 : Function.End STVC) = (1 : Function.End STVC) :=
    (Submonoid.mem_bot (M := Function.End STVC)).mp hmem
  exact rotCircFun_e2_quarter_ne_id h1

end

end Phys.Algebra
