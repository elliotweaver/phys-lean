/-
  Phys.Algebra.LorentzContinuumSpin9Reach — N94: A CONCRETE `biMulFun` 2-PLANE ROTATION
  WITNESS — the order-2 half-turn realized as a single two-sided generator, the
  immediately-bankable SO(9)-reachability piece toward the `Spin(9)→SO(9)` exhaustion, over
  the DERIVED ℝ `Cut` and the terminal algebra `O Cut := CD (H Cut)`.
  ===========================================================================
  THE FORWARD FRONTIER after N93 (docs/ROADMAP.md §N94). N93 banked the full operator-level
  polar/KAK split `g = k·p^{1/2}` with BOTH factors landed as isometries (`p^{1/2}` the positive
  self-adjoint part, `k := g·(p^{1/2})⁻¹` the compact/orthogonal part `IsQvIsomC k`). The remaining
  HEAVY core is the TOPOLOGY — connectedness of the isometry group over `Cut`, the global reverse
  KAK surjectivity, and the `Spin(9)→SO(9)` exhaustion (Mathlib has no `SO⁺(1,9)`, no octonionic
  spinor cover, no Lie-group integration over `Cut`). MEASURE-FIRST (§N94 priority (i)): the
  immediately-bankable structural witness is a CONCRETE `biMulFun` 2-plane rotation.

  ── THE WITNESS: the unit-imaginary two-sided generator is an order-2 2-plane half-turn ──
  N55 banked the two-sided Moufang/Spin(9) generator `biMulFun u u' : (t,x,v) ↦ (t,x, u·(v·u'))`
  and the extended generated submonoid `genIsomMonoidC2 := ⟨boostOPS ∪ rotGenSetC ∪ biMulGenSetC⟩`
  with the forward soundness `genIsomMonoidC2 ≤ qvIsomMonoidC`. This node pins the GEOMETRY of the
  diagonal two-sided generator `biMulFun u u` for a UNIT-IMAGINARY `u` (`u·u = −1`,
  `u·(u·v) = −v`): it is an INVOLUTION — a concrete order-2 rotation (a 180° half-turn) — and a
  genuine 2-PLANE rotation: it NEGATES the plane `span{1,u}` and FIXES the anticommuting
  complement. ALL of this DISSOLVES through the banked octonion alternative laws (N5b
  `Phys/Algebra/Alternative.lean`: `mul_flex` `x·(y·x)=(x·y)·x`, `mul_mul_right` `(x·y)·y=x·(y·y)`),
  NO coordinate grind:

      (biMulFun u u)²(v) = u·((u·(v·u))·u)
        = u·(u·((v·u)·u))      [mul_flex u (v·u)]
        = u·(u·(v·(u·u)))      [mul_mul_right v u]
        = u·(u·(v·(−1)))       [u·u = −1]
        = u·(u·(−v)) = −(u·(u·v)) = −(−v) = v.

  The 2-plane geometry, same alternative laws:
    • NEGATES the plane: `biMulFun u u (1) = u·(1·u) = u·u = −1`;
      `biMulFun u u (u) = u·(u·u) = u·(−1) = −u`.
    • FIXES the complement: for `w` anticommuting (`u·w = −(w·u)`),
      `biMulFun u u (w) = u·(w·u) = u·(−(u·w)) = −(u·(u·w)) = −(−w) = w`.

  ── THE DISTINGUISHING FACT (W8 — the genuine novelty toward SO(9)) ──
  The SINGLE-UNIT circle subgroup's half-turn is `(rotFunC u)²(v) = u·(u·v) = −v` for ALL `v` — the
  WHOLE-block negation `−id` (a central element), NOT a 2-plane rotation. The TWO-SIDED `biMulFun u u`
  negates ONLY the 2-plane `span{1,u}` and FIXES the orthogonal complement. So the two-sided
  generator REACHES a 2-plane rotation the single-unit family does not — the forward step toward the
  full non-associative `SO(9)`. The concrete witness `biMulFun_e2_fixes_j` (the half-turn around `e₂`
  FIXES the anticommuting unit `ιe₂`) is the teeth: a whole-block `−id` would send `ιe₂ ↦ −ιe₂`.

  WHAT IS PROVED (each a theorem, foundations-only, forward from the banked objects):
    biMulFun_imag_sq              — ★ the CORE: `u·((u·(v·u))·u) = v` (unit-imaginary `u`), the
                                    two-sided square via the alternative laws.
    biMulFun_imag_involutive      — ★★ the order-2 half-turn `biMulFun u u (biMulFun u u p) = p`
                                    (pointwise + the composition form `… ∘ … = id`).
    biMulFun_imag_negates_one     — the half-turn negates `1`.
    biMulFun_imag_negates_self    — the half-turn negates `u`.
    biMulFun_imag_fixes_anticomm  — ★ the half-turn FIXES every anticommuting `w` — the 2-plane
                                    structure (negate the plane, fix the complement).
    biMulFun_imag_mem_gen2        — the unit half-turn lies in the extended generated group.
    biMulFun_e2_sq / _involutive  — the CONCRETE `e₂` half-turn is an involution.
    biMulFun_e2_fixes_j           — ★ W8 NON-VACUITY/teeth: the concrete half-turn around `e₂` FIXES
                                    the anticommuting unit `ιe₂` (NOT the whole-block `−id`).
    biMulFun_e2_mem_gen2          — the concrete `e₂` half-turn lies in the extended generated group.

  ── THE W1 HEAVY REMAINDER (childed N95, an honest dissolution ticket, NOT closed here) ──
  CONNECTEDNESS of the isometry group over `Cut`, the one-parameter spectral-power path
  `t ↦ specOpN (fun i => (c i)^t) u` realising the positive part's connectedness to the identity,
  the GLOBAL reverse KAK surjectivity `qvIsomMonoidC` on the connected component `≤ genIsomMonoidC2`,
  and the full `Spin(9)→SO(9)` exhaustion — the genuine group-manifold topology Mathlib lacks over
  `Cut`. Childed onto the chain tail.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). That octonionic bimultiplication `v ↦ u·(v·u)`
  is a (2-plane) rotation, and that `Spin(9)` two-sidedly covers `SO(9)`, is standard (Sudbery,
  Manogue–Dray, Baez, the `Spin(9)` triality literature). Here the involution, the 2-plane
  negate/fix geometry, and the membership DESCEND from the banked octonion alternative laws
  (`mul_flex`, `mul_mul_right`, N5b — themselves forward from the Cayley–Dickson product, the cascade
  STOP) over the DERIVED ℝ `Cut` and the terminal algebra `O Cut` — NOT a posited Lorentz/Spin group,
  NOT Mathlib ℝ/ℂ as content, NOT a bridge.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Lorentz / boost / rotation / half-turn /
  plane / SO(9) / Spin / SO⁺(1,9) / isometry / generator / Moufang / bimultiplication / reflection /
  involution / order / 2-plane / cover / orthogonal / compact": what remains is the theorem that over
  the derived complete ordered field `Cut` and the Cayley–Dickson double³ `O Cut`, for `u` with
  `u·u = −1` and `u·(u·v) = −v`, the map `(t,x,v) ↦ (t,x, u·(v·u))` composed with itself is the
  identity, negates `1` and `u`, fixes every `w` with `u·w = −(w·u)`, and lies in the generated
  submonoid `genIsomMonoidC2 ⊆ Function.End (Cut × Cut × O Cut)`. No theorem STATEMENT needs a
  physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge, NO Mathlib
  number-system content import (the continuum is the DERIVED `Cut`), NO posited Lorentz group.
-/
import Phys.Algebra.LorentzContinuumSpin9
import Phys.Algebra.Alternative

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section

/-! ## The unit-imaginary two-sided generator is an order-2 2-plane half-turn. -/

/-- ★ THE CORE two-sided square law for a unit-imaginary `u` (`u·u = −1`, `u·(u·v) = −v`):
    `u·((u·(v·u))·u) = v`. The inner left-then-right product `biMulFun u u` applied twice on the
    space vector `v` returns `v`. Dissolved through the banked octonion alternative laws — flexibility
    `(u·(v·u))·u = u·((v·u)·u)` (`mul_flex`) and right-alternativity `(v·u)·u = v·(u·u)`
    (`mul_mul_right`) — then `u·u = −1` and the unit-imaginary operator-square `u·(u·(−v)) = v`.
    NO coordinate grind, NO analysis. -/
theorem biMulFun_imag_sq (u : O Cut) (hsq : u * u = -1)
    (hL : ∀ w : O Cut, u * (u * w) = -w) (v : O Cut) :
    u * ((u * (v * u)) * u) = v := by
  have hflex : (u * (v * u)) * u = u * ((v * u) * u) := (mul_flex u (v * u)).symm
  have hrt : (v * u) * u = -v := by
    rw [mul_mul_right v u, hsq, mul_neg_one]
  rw [hflex, hrt, hL (-v), neg_neg]

/-- ★★ THE ORDER-2 HALF-TURN (pointwise): for a unit-imaginary `u`, `biMulFun u u` is an INVOLUTION
    — applied twice it is the identity. The two-sided Moufang/Spin(9) generator `biMulFun u u` is a
    concrete order-2 rotation (a 180° half-turn), via the core square law `biMulFun_imag_sq`. -/
theorem biMulFun_imag_involutive (u : O Cut) (hsq : u * u = -1)
    (hL : ∀ w : O Cut, u * (u * w) = -w) (p : STVC) :
    biMulFun u u (biMulFun u u p) = p := by
  obtain ⟨t, x, v⟩ := p
  simp only [biMulFun]
  rw [biMulFun_imag_sq u hsq hL v]

/-- The order-2 half-turn as a composition identity: `biMulFun u u ∘ biMulFun u u = id`. -/
theorem biMulFun_imag_involutive_comp (u : O Cut) (hsq : u * u = -1)
    (hL : ∀ w : O Cut, u * (u * w) = -w) :
    biMulFun u u ∘ biMulFun u u = id := by
  funext p
  exact biMulFun_imag_involutive u hsq hL p

/-! ## The 2-plane geometry: negate the plane `span{1,u}`, fix the complement. -/

/-- The half-turn NEGATES the unit `1`: `biMulFun u u (0,0,1) = (0,0,−1)`, since `u·(1·u) = u·u = −1`. -/
theorem biMulFun_imag_negates_one (u : O Cut) (hsq : u * u = -1) :
    biMulFun u u ((0 : Cut), (0 : Cut), (1 : O Cut))
      = ((0 : Cut), (0 : Cut), -(1 : O Cut)) := by
  simp only [biMulFun, one_mul]
  rw [hsq]

/-- The half-turn NEGATES `u` itself: `biMulFun u u (0,0,u) = (0,0,−u)`, since `u·(u·u) = u·(−1) = −u`. -/
theorem biMulFun_imag_negates_self (u : O Cut) (hsq : u * u = -1) :
    biMulFun u u ((0 : Cut), (0 : Cut), u) = ((0 : Cut), (0 : Cut), -u) := by
  simp only [biMulFun]
  rw [hsq, mul_neg_one]

/-- ★ The half-turn FIXES every anticommuting `w` (`u·w = −(w·u)`): `biMulFun u u (0,0,w) = (0,0,w)`,
    since `u·(w·u) = u·(−(u·w)) = −(u·(u·w)) = −(−w) = w`. The 2-plane structure made local: negate
    the plane `span{1,u}` (the two lemmas above), fix the orthogonal complement (this lemma). -/
theorem biMulFun_imag_fixes_anticomm (u w : O Cut)
    (hL : ∀ z : O Cut, u * (u * z) = -z) (hac : u * w = -(w * u)) :
    biMulFun u u ((0 : Cut), (0 : Cut), w) = ((0 : Cut), (0 : Cut), w) := by
  simp only [biMulFun]
  have hwu : w * u = -(u * w) := by rw [hac, neg_neg]
  rw [hwu, mul_neg u (u * w), hL w, neg_neg]

/-! ## Membership in the extended generated isometry submonoid. -/

/-- The unit-imaginary half-turn lies in the extended generated isometry submonoid `genIsomMonoidC2`
    (it is a Born-unit bimultiplication `biMulFun u u` with `gFormC u u = 1`). -/
theorem biMulFun_imag_mem_gen2 (u : O Cut) (hu : gFormC u u = 1) :
    (biMulFun u u : Function.End STVC) ∈ genIsomMonoidC2 := by
  apply Submonoid.subset_closure
  apply Set.mem_union_right
  exact ⟨u, u, hu, hu, rfl⟩

/-! ## The CONCRETE `e₂` half-turn and its 2-plane non-vacuity (W8). -/

/-- The unit-imaginary square for the cascade's terminal generator `e₂`: `e₂·e₂ = −1` (from the
    banked `e2_alt` at `v = 1`, `e₂·(e₂·1) = −1`). -/
theorem biMulFun_e2_sq : (CD.e2 : O Cut) * (CD.e2 : O Cut) = -1 := by
  have h := e2_alt (1 : O Cut)
  rwa [mul_one] at h

/-- CONCRETE: the half-turn `biMulFun e₂ e₂` is an INVOLUTION over the derived ℝ `Cut` — the
    concrete order-2 2-plane rotation realised by the cascade's terminal imaginary generator. -/
theorem biMulFun_e2_involutive (p : STVC) :
    biMulFun (CD.e2 : O Cut) (CD.e2 : O Cut) (biMulFun (CD.e2 : O Cut) (CD.e2 : O Cut) p) = p :=
  biMulFun_imag_involutive (CD.e2 : O Cut) biMulFun_e2_sq e2_alt p

/-- ★ W8 NON-VACUITY / TEETH: the concrete two-sided half-turn around `e₂` FIXES the anticommuting
    unit `ιe₂ := iota (e₂ : H Cut)` — `biMulFun e₂ e₂ (0,0,ιe₂) = (0,0,ιe₂)`. The unit `ιe₂`
    anticommutes with `e₂` (`e₂·ιe₂ = −(ιe₂·e₂)`, a single octonion `ext`), so the half-turn fixes it
    by `biMulFun_imag_fixes_anticomm`. This is the distinguishing fact toward `SO(9)`: a WHOLE-block
    negation `−id` (which the SINGLE-unit circle half-turn `(rotFunC e₂)² = −id` produces) would send
    `ιe₂ ↦ −ιe₂ ≠ ιe₂`. The two-sided generator reaches a genuine 2-PLANE rotation the single-unit
    family does not. -/
theorem biMulFun_e2_fixes_j :
    biMulFun (CD.e2 : O Cut) (CD.e2 : O Cut)
        ((0 : Cut), (0 : Cut), (CD.iota (CD.e2 : H Cut) : O Cut))
      = ((0 : Cut), (0 : Cut), (CD.iota (CD.e2 : H Cut) : O Cut)) := by
  have hac : (CD.e2 : O Cut) * (CD.iota (CD.e2 : H Cut) : O Cut)
      = -((CD.iota (CD.e2 : H Cut) : O Cut) * (CD.e2 : O Cut)) := by
    ext <;> simp [CD.e2, CD.iota]
  exact biMulFun_imag_fixes_anticomm (CD.e2 : O Cut) (CD.iota (CD.e2 : H Cut) : O Cut) e2_alt hac

/-- The concrete `e₂` half-turn lies in the extended generated isometry submonoid `genIsomMonoidC2`. -/
theorem biMulFun_e2_mem_gen2 :
    (biMulFun (CD.e2 : O Cut) (CD.e2 : O Cut) : Function.End STVC) ∈ genIsomMonoidC2 :=
  biMulFun_imag_mem_gen2 (CD.e2 : O Cut) e2_gFormC_self

end

end Phys.Algebra
