/-
  Phys.Algebra.LorentzContinuumSpin9 — N55: THE TWO-SIDED MOUFANG / Spin(9) ROTATION GENERATOR
  beyond the single-unit circle subgroups, + the EXTENDED generated isometry submonoid (the
  forward step toward the full non-associative SO(9)), over the DERIVED ℝ `Cut`.
  ===========================================================================
  THE NEXT FORCED NODE after the generated-isometry-submonoid node (N54). N49–N54 banked, over the
  derived ℝ `Cut` and the terminal algebra `O Cut := CD (H Cut)`:
    • the continuum Born form `QvC = t² − x² − gFormC v v` + the isometry monoid `qvIsomMonoidC`
      (N49), the `Cut`-pinned Born composition law `gFormC (x·y)(x·y) = gFormC x x · gFormC y y`
      (`gFormC_comp`, N50, through the GENERIC doubled-base multiplicativity);
    • the BOOST one-parameter subgroup `boostOPS` (N52) + the SINGLE-UNIT rotation generators
      `rotCircFun a c s = rotFunC (c•1+s•a)` (each a single LEFT-multiplication, N53);
    • the GENERATED isometry submonoid `genIsomMonoidC := ⟨boostOPS ∪ rotGenSetC⟩` and the FORWARD
      soundness `genIsomMonoidC ≤ qvIsomMonoidC` (N54, every finite product of boosts + single-unit
      rotations is a `QvC`-isometry — the "every word is an isometry" half of the KAK `g=k·exp(p)`).

  ── THE FORWARD FRONTIER THIS NODE OPENS: the TWO-SIDED Moufang / Spin(9) generator ──
  N53/N54's rotation generators are each a SINGLE left-multiplication `v ↦ w·v` (a circle subgroup
  around one imaginary unit, where octonion non-associativity DISSOLVES on the alternative
  subalgebra). The full spacelike `SO(9)` needs rotations in ARBITRARY planes, where two single-unit
  rotations around NON-associating units do NOT compose into a single left-multiplication — this is
  exactly where the `2:1` cover `Spin(9) → SO(9)` and the Moufang / bimultiplication structure
  enter. The immediately-bankable forward generator (MEASURE-FIRST, W9) is the TWO-SIDED
  bimultiplication

      biMulFun u u' : (t,x,v) ↦ (t,x, u·(v·u'))

  — left-multiply by `u`, right-multiply by `u'`, the genuine two-sided product beyond a single
  left-multiplication. It is a `QvC`-isometry whenever `u, u'` are Born-units, and this DISSOLVES
  STRUCTURALLY through the banked Born composition law `gFormC_comp` applied TWICE:

      gFormC (u·(v·u')) (u·(v·u'))
        = gFormC u u · gFormC (v·u') (v·u')          [gFormC_comp u (v·u')]
        = gFormC u u · (gFormC v v · gFormC u' u')   [gFormC_comp v u']
        = 1 · (gFormC v v · 1) = gFormC v v          [hu, hu'].

  NO coordinate grind, NO analysis, NO topology — the Born = self-overlap composition law, applied
  on BOTH sides, is exactly the multiplicativity the two-sided product needs. The two-sided product
  genuinely EXTENDS the single-multiplication family: `biMulFun u 1 = rotFunC u` recovers the
  single-unit generator (right unit collapses), while the genuinely two-sided `biMulFun e₂ e₂` is
  NOT the single left-multiplication `rotFunC e₂` (`biMulFun e₂ e₂` sends the space vector `1` to
  `e₂·(1·e₂) = e₂·e₂ = −1`, while `rotFunC e₂` sends it to `e₂·1 = e₂ ≠ −1`). So the extended
  generated group `genIsomMonoidC2 := ⟨boostOPS ∪ rotGenSetC ∪ biMulGenSetC⟩` genuinely contains
  the new two-sided generators, a forward step toward the full `SO(9)`.

  WHAT IS PROVED (each a theorem, foundations-only, forward from the banked objects):
    biMulFun              — the two-sided Moufang generator `(t,x,v) ↦ (t,x, u·(v·u'))`.
    biMul_gFormC          — ★ THE THREE-FACTOR Born composition: `gFormC (u·(v·u')) (u·(v·u')) =
                            gFormC u u · (gFormC v v · gFormC u' u')`, via `gFormC_comp` TWICE.
    biMulFun_isom         — ★★ THE TWO-SIDED MOUFANG ROTATION IS A `QvC`-ISOMETRY when `u, u'` are
                            Born-units — the Spin(9) generator beyond the single-unit circle
                            subgroups, dissolved through the two-sided Born composition law.
    biMulFun_mem          — the Born-unit bimultiplication lies in the continuum isometry monoid.
    biMulFun_one_right    — `biMulFun u 1 = rotFunC u`: the two-sided generator RECOVERS the single
                            left-multiplication when the right factor is the unit (it generalizes
                            the N53/N54 single-unit rotation generators).
    biMulGenSetC          — the two-sided generator SET (all bimultiplications by Born-units).
    genIsomMonoidC2       — ★ THE EXTENDED GENERATED ISOMETRY SUBMONOID: the closure of
                            `boostOPS ∪ rotGenSetC ∪ biMulGenSetC` — the generated group enlarged by
                            the two-sided Moufang/Spin(9) generators (toward the full `SO(9)`).
    biMulGenSetC_le_isom  — every two-sided generator is a continuum `QvC`-isometry.
    genIsomMonoidC2_le_isom— ★★ THE EXTENDED FORWARD SOUNDNESS: `genIsomMonoidC2 ≤ qvIsomMonoidC`.
                            Every finite product of boosts, single-unit rotations, AND two-sided
                            Moufang rotations preserves the continuum Born form `QvC`. Structural,
                            via `Submonoid.closure_le` — NO grind.
    genIsomMonoidC_le_gen2 — the N54 generated group embeds in the extended one (`closure_mono`).
    biMulFun_e2_e2_ne_rotFunC_e2 — ★ W8 NON-VACUITY: the genuinely two-sided `biMulFun e₂ e₂` is
                            NOT the single left-multiplication `rotFunC e₂` — the two-sided product
                            is a genuinely new generator, not a relabelling of a single-unit rotation.
    biMulFun_e2_e2_mem_gen2 — the new two-sided generator lies in the extended generated group.

  ── THE W1 HEAVY REMAINDER (childed N56, an honest dissolution ticket, NOT closed here) ──
  The REVERSE direction — that EVERY orientation/time-preserving continuum isometry of `QvC` IS such
  a finite product (`qvIsomMonoidC` on the connected component `≤ genIsomMonoidC2`), the polar/KAK
  decomposition `g = k·exp(p)` requiring the positive-definite square root over the derived `Cut`,
  connectedness, and that the two-sided Moufang generators EXHAUST the full `SO(9)` (the `2:1` cover
  `Spin(9)→SO(9)` as the full generated group) — is the genuine HEAVY core. Mathlib has NO
  `SO⁺(1,9)`, no octonionic spinor cover, no Lie-group integration over `Cut`. It is to be attacked
  from the BORN POSITIVITY (the self-overlap form is positive-definite; a form-isometry's boost part
  is the positive-definite factor of its polar decomposition) rather than a coordinate KAK grind —
  the surjectivity may DISSOLVE through the positivity structure. This is the W1 dissolution
  remainder, childed onto the chain tail.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). That `Spin(9)` two-sidedly covers `SO(9)` via
  octonionic bimultiplication is standard (Sudbery, Manogue–Dray, Baez, the `Spin(9)` triality
  literature). Here the two-sided Moufang generator, its Born-form preservation, and the extended
  generated group DESCEND from the banked `Cut`-pinned Born composition law `gFormC_comp` (N50,
  through the GENERIC doubled-base multiplicativity) applied on BOTH sides, over the DERIVED ℝ `Cut`
  and the terminal algebra `O Cut` — NOT a posited Lorentz/Spin group, NOT Mathlib ℝ/ℂ as content,
  NOT a bridge. The W8 non-vacuity proves the two-sided generator is genuinely new (not a single
  left-multiplication).

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Lorentz / boost / rotation / Spin / SO(9) /
  SO⁺(1,9) / isometry / cover / generator / Moufang / bimultiplication / triality": what remains is
  the theorem that, over the derived complete ordered field `Cut` and the Cayley–Dickson double³
  `O Cut`, the map `(t,x,v) ↦ (t,x, u·(v·u'))` with `gFormC u u = gFormC u' u' = 1` preserves
  `t² − x² − gFormC v v` (via `gFormC (x·y)(x·y) = gFormC x x · gFormC y y` applied twice), such maps
  form part of a generating family whose generated submonoid of `Function.End (Cut×Cut×O Cut)` is
  contained in the form-preserving submonoid, recovers the single-multiplication maps `(t,x,v) ↦
  (t,x,u·v)` at `u'=1`, and contains a member (`u=u'=e₂`) not equal to any single-multiplication
  map. No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge, NO Mathlib
  number-system content import (the continuum is the DERIVED `Cut`), NO posited Lorentz group.
-/
import Phys.Algebra.LorentzContinuumGeneratedGroup

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section

/-! ## The two-sided Moufang / Spin(9) generator (the bimultiplication `v ↦ u·(v·u')`). -/

/-- THE TWO-SIDED MOUFANG GENERATOR over the derived ℝ: `(t,x,v) ↦ (t,x, u·(v·u'))` — left-multiply
    the nine space directions by `u` AND right-multiply by `u'`, leaving the time–space `(t,x)`
    block fixed. The genuine two-sided product beyond a single left-multiplication: the `Spin(9)`
    generator (the bimultiplication) that the single-unit circle subgroups (N53/N54) do not reach. -/
def biMulFun (u u' : O Cut) : STVC → STVC := fun p => (p.1, p.2.1, u * (p.2.2 * u'))

/-- ★ THE THREE-FACTOR Born composition law for the two-sided product, via the banked `Cut`-pinned
    Born composition law `gFormC_comp` applied TWICE: `gFormC (u·(v·u')) (u·(v·u')) =
    gFormC u u · (gFormC v v · gFormC u' u')`. The Born = self-overlap multiplicativity, applied on
    BOTH sides — the structural heart of the Moufang/Spin(9) isometry. -/
theorem biMul_gFormC (u u' v : O Cut) :
    gFormC (u * (v * u')) (u * (v * u')) = gFormC u u * (gFormC v v * gFormC u' u') := by
  rw [gFormC_comp u (v * u'), gFormC_comp v u']

/-- ★★ THE TWO-SIDED MOUFANG ROTATION IS A `QvC`-ISOMETRY when `u, u'` are Born-units
    (`gFormC u u = 1`, `gFormC u' u' = 1`): the `(t,x)` block is untouched, and the space block
    `gFormC (u·(v·u')) (u·(v·u')) = gFormC u u · (gFormC v v · gFormC u' u') = gFormC v v` is
    preserved by the three-factor composition law `biMul_gFormC` — the `Spin(9)` generator beyond
    the single-unit circle subgroups, with NO analysis. -/
theorem biMulFun_isom {u u' : O Cut} (hu : gFormC u u = 1) (hu' : gFormC u' u' = 1) (p : STVC) :
    QvC (biMulFun u u' p) = QvC p := by
  obtain ⟨t, x, v⟩ := p
  show QformC _ _ _ = QformC _ _ _
  unfold QformC biMulFun
  simp only
  rw [biMul_gFormC, hu, hu', mul_one, one_mul]

/-- The Born-unit two-sided bimultiplication lies in the continuum isometry monoid `qvIsomMonoidC`. -/
theorem biMulFun_mem {u u' : O Cut} (hu : gFormC u u = 1) (hu' : gFormC u' u' = 1) :
    (biMulFun u u' : Function.End STVC) ∈ qvIsomMonoidC :=
  fun p => biMulFun_isom hu hu' p

/-- `biMulFun u 1 = rotFunC u`: the two-sided generator RECOVERS the single left-multiplication
    (the N50/N53/N54 rotation generator) when the right factor is the unit `1` (`v·1 = v`). So the
    two-sided Moufang family genuinely GENERALIZES the single-unit rotation family. -/
theorem biMulFun_one_right (u : O Cut) : biMulFun u (1 : O Cut) = rotFunC u := by
  funext p
  obtain ⟨t, x, v⟩ := p
  show (t, x, u * (v * 1)) = (t, x, u * v)
  rw [mul_one]

/-! ## The two-sided generator set and the EXTENDED generated isometry submonoid. -/

/-- THE TWO-SIDED MOUFANG GENERATOR SET: every bimultiplication `biMulFun u u'` by a pair of
    Born-units `u, u'` (`gFormC u u = 1`, `gFormC u' u' = 1`). The full two-sided generator family
    — the `Spin(9)` generators beyond the single-unit circle subgroups. -/
def biMulGenSetC : Set (Function.End STVC) :=
  {T | ∃ (u u' : O Cut),
        gFormC u u = 1 ∧ gFormC u' u' = 1 ∧ T = (biMulFun u u' : Function.End STVC)}

/-- ★ THE EXTENDED GENERATED ISOMETRY SUBMONOID: the closure of `boostOPS ∪ rotGenSetC ∪
    biMulGenSetC` — the N54 generated group enlarged by the two-sided Moufang/Spin(9) generators,
    a forward step toward the full non-associative `SO(9)`. -/
def genIsomMonoidC2 : Submonoid (Function.End STVC) :=
  Submonoid.closure
    ((boostOPS : Set (Function.End STVC)) ∪ rotGenSetC ∪ biMulGenSetC)

/-- Every two-sided generator is a continuum `QvC`-isometry (`biMulFun_mem`). -/
theorem biMulGenSetC_le_isom : biMulGenSetC ⊆ (qvIsomMonoidC : Set (Function.End STVC)) := by
  rintro T ⟨u, u', hu, hu', rfl⟩
  exact biMulFun_mem hu hu'

/-- ★★ THE EXTENDED FORWARD SOUNDNESS: `genIsomMonoidC2 ≤ qvIsomMonoidC`. EVERY finite product of
    boosts, single-unit rotations, AND two-sided Moufang rotations preserves the continuum Born form
    `QvC`. All three generating families lie in the isometry monoid (`boostOPS_le_isom` N52,
    `rotGenSetC_le_isom` N53/N54, `biMulGenSetC_le_isom` this node), so their generated submonoid
    does too — by `Submonoid.closure_le`, NO coordinate grind, NO analysis, NO topology. -/
theorem genIsomMonoidC2_le_isom : genIsomMonoidC2 ≤ qvIsomMonoidC := by
  apply Submonoid.closure_le.mpr
  apply Set.union_subset
  · apply Set.union_subset
    · exact fun x hx => boostOPS_le_isom hx
    · exact rotGenSetC_le_isom
  · exact biMulGenSetC_le_isom

/-- The N54 generated group embeds in the extended one: `genIsomMonoidC ≤ genIsomMonoidC2`. Adding
    the two-sided generators only enlarges the closure (`Submonoid.closure_mono`). -/
theorem genIsomMonoidC_le_gen2 : genIsomMonoidC ≤ genIsomMonoidC2 := by
  apply Submonoid.closure_mono
  exact Set.subset_union_left

/-! ## Non-vacuity (W8): the two-sided generator is genuinely new (not a single multiplication). -/

/-- ★ W8 NON-VACUITY: the genuinely two-sided `biMulFun e₂ e₂` is NOT the single left-multiplication
    `rotFunC e₂`. Evaluated at the space vector `(0,0,1)`: the two-sided product gives `e₂·(1·e₂) =
    e₂·e₂ = −1` (the banked unit-imaginary square `e₂·(e₂·1) = −1`), while the single
    left-multiplication gives `e₂·1 = e₂`; and `e₂ ≠ −1` (the imaginary unit is not the real `−1`,
    since `gFormC 1 e₂ = 0 ≠ −1 = gFormC 1 (−1)`). So the two-sided Moufang generator is a genuinely
    NEW isometry, not a relabelling of a single-unit rotation — the forward extension is non-vacuous. -/
theorem biMulFun_e2_e2_ne_rotFunC_e2 :
    biMulFun (CD.e2 : O Cut) (CD.e2 : O Cut) ≠ rotFunC (CD.e2 : O Cut) := by
  intro hcontra
  have hev := congrArg (fun T => (T ((0:Cut),(0:Cut),(1:O Cut))).2.2) hcontra
  simp only [biMulFun, rotFunC, one_mul, mul_one] at hev
  -- hev : e₂ * e₂ = e₂   (LHS e₂·(1·e₂)=e₂·e₂; RHS e₂·1=e₂)
  -- the banked unit-imaginary square at v=1: e₂·(e₂·1) = −1, i.e. e₂·e₂ = −1
  have hsq : (CD.e2 : O Cut) * (CD.e2 : O Cut) = -1 := by
    have h := e2_alt (1 : O Cut)
    rwa [mul_one] at h
  rw [hsq] at hev
  -- hev : (-1 : O Cut) = e₂
  have h0 : gFormC (1 : O Cut) (CD.e2 : O Cut) = 0 := e2_gFormC_one
  rw [← hev] at h0
  -- h0 : gFormC 1 (-1) = 0, but gFormC 1 (-1) = -(gFormC 1 1) = -1
  rw [show gFormC (1 : O Cut) (-1 : O Cut) = -(1 : Cut) by
        show reQC ((1 : O Cut) * star (-1 : O Cut)) = -(1 : Cut)
        rw [star_neg, star_one, one_mul]
        show reQC (-(1 : O Cut)) = -(1 : Cut)
        simp only [reQC]
        rw [CD.neg_re, CD.neg_re, Dbl.neg_re]
        rfl] at h0
  exact absurd h0 (by norm_num)

/-- The new two-sided generator `biMulFun e₂ e₂` lies in the extended generated group (it is a
    Born-unit bimultiplication, `gFormC e₂ e₂ = 1`). -/
theorem biMulFun_e2_e2_mem_gen2 :
    (biMulFun (CD.e2 : O Cut) (CD.e2 : O Cut) : Function.End STVC) ∈ genIsomMonoidC2 := by
  apply Submonoid.subset_closure
  apply Set.mem_union_right
  exact ⟨CD.e2, CD.e2, e2_gFormC_self, e2_gFormC_self, rfl⟩

end

end Phys.Algebra
