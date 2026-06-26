/-
  Phys.Algebra.LorentzContinuumExpIntegration — N52: THE GLOBAL EXP-INTEGRATION of the
  infinitesimal boost generator (N51) to the BOOST ONE-PARAMETER SUBGROUP over the DERIVED ℝ `Cut`.
  ===========================================================================
  THE NEXT FORCED NODE after the infinitesimal-Lie-algebra node (N51). N51 banked the TANGENT
  (infinitesimal) algebra `infIsomLieAlg ⊆ Module.End Cut STVC` over the derived ℝ `Cut`, with the
  infinitesimal boost generator `boostGenC : (t,x,v) ↦ (x,t,0)` proved form-skew and bracket-closed.
  N49 banked the GLOBAL boost `boostFunC a b : (t,x,v) ↦ (a t+b x, b t+a x, v)`, the isometry
  `boostC_isom`/`boostC_mem` (the unit-hyperbola condition `a²−b²=1`), and the continuum isometry
  monoid `qvIsomMonoidC : Submonoid (Function.End STVC)`. This node LIFTS the infinitesimal boost
  generator to the GLOBAL one-parameter subgroup and proves the exp-integration link.

  ── THE ONE LAW / W1 REFRAME — the cosh/sinh exp is the rapidity habit; the theory-native exp is
     the algebraic HYPERBOLA GROUP ──
  The classical statement of the boost one-parameter subgroup is `exp(s·boostGenC) =
  boostFunC (cosh s)(sinh s)`, parametrized by the rapidity `s` through the transcendental functions
  `cosh`/`sinh`. Over the derived ℝ `Cut` those analytic functions are NOT banked, and importing them
  from Mathlib would be exactly the forbidden Mathlib-ℝ content (the second posit) — moreover N49
  already DISSOLVED the rapidity into the algebraic hyperbola point. Returning to the trunk: the
  boost generator satisfies `boostGenC (boostGenC p) = (t,x,0)` (the time–space block projection),
  so `boostGenC³ = boostGenC` and its exponential CLOSES into a FINITE POLYNOMIAL in the generator,
  parametrized by the hyperbola point `(a,b)` (`a²−b²=1`) rather than the rapidity:

      boostFunC a b p = p + b • boostGenC p + (a−1) • boostGenC (boostGenC p)            [EXP-POLY]

  The one-parameter subgroup it sweeps is the abelian HYPERBOLA GROUP `{(a,b) | a²−b²=1}` under the
  algebraic group law `(a,b)·(a',b') = (a a'+b b', a b'+b a')`, which lands back on the hyperbola
  (`(aa'+bb')²−(ab'+ba')² = (a²−b²)(a'²−b'²)`, `boostParam_hyp_mul`), with identity `(1,0)`
  (`boostFunC 1 0 = id`) and inverse `(a,−b)`. The composition law `boostFunC a b ∘ boostFunC a' b' =
  boostFunC (aa'+bb')(ab'+ba')` (`boostFunC_comp`) is the theory-native one-parameter-subgroup law
  `exp((s+t)T) = exp(sT)·exp(tT)`: the group parameter is the hyperbola point, not the rapidity. No
  analysis, no transcendental, no Mathlib ℝ — pure field arithmetic over the derived `Cut`.

  WHAT IS PROVED (each a theorem, foundations-only, forward from the banked objects):
    boostFunC_comp        — ★★ THE COMPOSITION LAW (the one-parameter-subgroup law): two boosts
                            compose to a boost with the hyperbola-group product parameter.
    boostParam_hyp_mul    — ★ THE HYPERBOLA CLOSURE `(aa'+bb')²−(ab'+ba')² = (a²−b²)(a'²−b'²)`: the
                            group product of two hyperbola points is a hyperbola point.
    boostFunC_one         — the identity boost `boostFunC 1 0 = id`.
    boostFunC_inv         — the group inverse: `a²−b²=1 → boostFunC a b ∘ boostFunC a (−b) = id`.
    boostGenC_sq_apply    — `boostGenC (boostGenC p) = (t,x,0)`: the generator squared is the
                            time–space-block projection (so `boostGenC³ = boostGenC`).
    boostFunC_eq_gen_poly — ★★ THE EXP-POLY [EXP-POLY]: the GLOBAL boost is the finite polynomial
                            `id + b•G + (a−1)•G²` in the N51 infinitesimal generator `G = boostGenC`.
    boostOPS              — ★ THE BOOST ONE-PARAMETER SUBGROUP as a `Submonoid (Function.End STVC)`:
                            the hyperbola-parametrized boost family, closed under composition.
    boostOPS_le_isom      — ★ `boostOPS ≤ qvIsomMonoidC`: every boost in the subgroup preserves the
                            continuum Born form `QvC` (the integrated tangent is a global isometry).
    irrBoost_mem_boostOPS / boostOPS_ne_bot — ★ NON-VACUITY (W8): the irrational boost (N49) is a
                            genuine member, so the boost subgroup is not the trivial `{1}` group.
    boostExp              — the exponential of the generator as the EXP-POLY map (the `exp(sT)` object
                            with the hyperbola point as the group coordinate).
    boostExp_eq_boostFunC — `boostExp a b = boostFunC a b`: the exp object IS the global boost.
    boostExp_isom         — ★ `a²−b²=1 → boostExp a b ∈ qvIsomMonoidC`: the exponential of the
                            form-skew generator lands in the isometry monoid (THE EXP-INTEGRATION).
    boostExp_one          — `boostExp 1 0 = 1` (the exponential of the trivial parameter is identity).
    boostExp_comp         — ★★ THE ONE-PARAMETER-SUBGROUP LAW in exp form `exp(a,b)·exp(a',b') =
                            exp((a,b)·(a',b'))`: the exponential map is a homomorphism from the
                            hyperbola group, sweeping a one-parameter subgroup.

  WHAT IS CHILDED (N53, the heavy remainder). (i) The HEAVY core — that EVERY orientation/time-
  preserving continuum isometry of `QvC` is a FINITE PRODUCT of the boost + rotation one-parameter
  subgroups (the Cartan/polar KAK decomposition, the actual surjectivity onto the connected component
  `SO⁺(1,9)`) — a deep global Lie-group theorem (connectedness + polar decomposition + topology over
  the derived ℝ; Mathlib has no `SO⁺(1,9)`, no octonionic spinor cover, no Lie-group integration over
  `Cut`). (ii) The ROTATION one-parameter subgroup (the compact generator `rotFunC`): its naive
  composition `rotFunC u ∘ rotFunC u' = rotFunC (u·u')` FAILS by octonion non-associativity, a genuine
  subtlety needing alternativity/Moufang care — its own node. (iii) The LITERAL transcendental `exp`
  over a derived-ℝ analytic `cosh`/`sinh` (the rapidity coordinate), if ever wanted, needs the
  derived-ℝ exp series specialized to the hyperbolic case — a separate analytic node. All childed onto
  the chain tail; THIS node banks the boost one-parameter subgroup + the exp-integration of the boost
  generator.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). That the boost one-parameter subgroup of the
  octonionic Minkowski isometry group is the `exp` of the infinitesimal boost is standard (Sudbery,
  Manogue–Dray, Baez). Here the one-parameter subgroup, its composition/inverse laws, and the
  exp-integration of the N51 generator DESCEND from the banked continuum boost `boostFunC`/`boostC_mem`
  + the N51 generator `boostGenC` over the DERIVED ℝ `Cut` — NO posited Lorentz group, NO Mathlib ℝ/ℂ
  as content. The W1 reframe (the algebraic hyperbola group + the finite exp-polynomial, NOT the
  transcendental cosh/sinh rapidity) is exactly what lets the exp-integration re-ground over the
  continuum with no analysis.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Lorentz / boost / exp / one-parameter /
  subgroup / generator / isometry / SO⁺(1,9) / rapidity": what remains is the theorem that, over the
  derived complete ordered field `Cut` and the Cayley–Dickson double³ `O Cut`, the `Cut`-maps
  `(t,x,v) ↦ (a t+b x, b t+a x, v)` with `a²−b²=1` form a submonoid of `Function.End (Cut×Cut×O Cut)`
  under composition (composition law `(a,b)(a',b')=(aa'+bb',ab'+ba')`, unit `(1,0)`, inverse `(a,−b)`),
  contained in the submonoid preserving `t²−x²−gFormC v v`, and each equals the finite polynomial
  `id + b•G + (a−1)•G²` in the linear map `G : (t,x,v) ↦ (x,t,0)` (`G² : (t,x,v) ↦ (t,x,0)`). No
  theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge, NO Mathlib
  number-system content import (the continuum is the DERIVED `Cut`), NO posited Lorentz group.
-/
import Phys.Algebra.LorentzContinuumLieAlgebra

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section

/-! ## The boost composition law — the one-parameter-subgroup law (the algebraic hyperbola group). -/

/-- ★★ THE COMPOSITION LAW (the one-parameter-subgroup law): the global boosts compose to a global
    boost with the algebraic HYPERBOLA-GROUP product parameter `(a,b)·(a',b') = (a a'+b b', a b'+b a')`.
    This is the theory-native `exp((s+t)T) = exp(sT)·exp(tT)` — the group coordinate is the hyperbola
    point, not a transcendental rapidity. Pure field arithmetic over the derived ℝ. -/
theorem boostFunC_comp (a b a' b' : Cut) :
    boostFunC a b ∘ boostFunC a' b' = boostFunC (a*a'+b*b') (a*b'+b*a') := by
  funext p
  obtain ⟨t, x, v⟩ := p
  show boostFunC a b (a'*t+b'*x, b'*t+a'*x, v) = _
  show ((a*(a'*t+b'*x)+b*(b'*t+a'*x)), (b*(a'*t+b'*x)+a*(b'*t+a'*x)), v)
      = ((a*a'+b*b')*t+(a*b'+b*a')*x, (a*b'+b*a')*t+(a*a'+b*b')*x, v)
  refine Prod.ext ?_ (Prod.ext ?_ rfl)
  · show a*(a'*t+b'*x)+b*(b'*t+a'*x) = (a*a'+b*b')*t+(a*b'+b*a')*x; ring
  · show b*(a'*t+b'*x)+a*(b'*t+a'*x) = (a*b'+b*a')*t+(a*a'+b*b')*x; ring

/-- ★ THE HYPERBOLA CLOSURE: the group product of two hyperbola points lands back on the hyperbola.
    `(a a'+b b')² − (a b'+b a')² = (a²−b²)(a'²−b'²)`. With `a²−b²=1` and `a'²−b'²=1` the product is
    again a unit-hyperbola point — the boost family is closed under composition. -/
theorem boostParam_hyp_mul (a b a' b' : Cut) :
    (a*a'+b*b')^2 - (a*b'+b*a')^2 = (a^2-b^2)*(a'^2-b'^2) := by ring

/-- The identity boost `boostFunC 1 0 = id` — the group unit (the hyperbola point `(1,0)`). -/
theorem boostFunC_one : boostFunC (1:Cut) (0:Cut) = id := by
  funext p
  obtain ⟨t, x, v⟩ := p
  show ((1:Cut)*t+0*x, 0*t+1*x, v) = (t, x, v)
  refine Prod.ext ?_ (Prod.ext ?_ rfl) <;> simp

/-- The group inverse: on the unit hyperbola, `boostFunC a b ∘ boostFunC a (−b) = id` (the inverse
    hyperbola point is `(a,−b)`). Every boost in the subgroup is invertible. -/
theorem boostFunC_inv {a b : Cut} (h : a^2 - b^2 = 1) :
    boostFunC a b ∘ boostFunC a (-b) = id := by
  rw [boostFunC_comp]
  have ha : a*a + b*(-b) = 1 := by nlinarith [h]
  have hb : a*(-b) + b*a = 0 := by ring
  rw [ha, hb, boostFunC_one]

/-! ## The exp-polynomial — the global boost as a finite polynomial in the N51 infinitesimal generator. -/

/-- `boostGenC (boostGenC p) = (t,x,0)`: the infinitesimal boost generator squared is the projection
    onto the time–space `(t,x)` block (killing the space directions `v`). Hence `boostGenC³ =
    boostGenC`, so the generator's exponential closes into a FINITE polynomial — the key structural
    fact that dissolves the transcendental rapidity. -/
theorem boostGenC_sq_apply (p : STVC) :
    boostGenC (boostGenC p) = (p.1, p.2.1, (0 : O Cut)) := by
  obtain ⟨t, x, v⟩ := p
  rfl

/-- ★★ THE EXP-POLY: the GLOBAL boost is the finite polynomial `id + b•G + (a−1)•G²` in the N51
    infinitesimal generator `G = boostGenC`. This is the exp-integration of the form-skew generator:
    because `G² = (time–space block projection)` and `G³ = G`, the would-be transcendental
    `exp(s·G) = ∑ sⁿ Gⁿ/n!` collapses to this finite hyperbola-parametrized polynomial — the global
    flow of the infinitesimal boost, with NO transcendental, NO analysis, NO Mathlib ℝ. -/
theorem boostFunC_eq_gen_poly (a b : Cut) (p : STVC) :
    boostFunC a b p = p + b • (boostGenC p) + (a-1) • (boostGenC (boostGenC p)) := by
  obtain ⟨t, x, v⟩ := p
  show (a*t+b*x, b*t+a*x, v)
      = (t,x,v) + b • (x, t, (0:O Cut)) + (a-1) • (t, x, (0:O Cut))
  refine Prod.ext ?_ (Prod.ext ?_ ?_)
  · show a*t+b*x = t + b•x + (a-1)•t
    rw [smul_eq_mul, smul_eq_mul]; ring
  · show b*t+a*x = x + b•t + (a-1)•x
    rw [smul_eq_mul, smul_eq_mul]; ring
  · show v = v + b • (0:O Cut) + (a-1) • (0:O Cut)
    simp

/-! ## The boost one-parameter subgroup and the exp-integration into the isometry monoid. -/

/-- ★ THE BOOST ONE-PARAMETER SUBGROUP as a `Submonoid (Function.End STVC)`: the hyperbola-
    parametrized boost family `{T | ∃ a b, a²−b²=1 ∧ T = boostFunC a b}`, closed under composition
    (the hyperbola-group product, `boostFunC_comp` + `boostParam_hyp_mul`) with unit `boostFunC 1 0`.
    The integrated one-parameter subgroup whose tangent is the N51 infinitesimal boost generator. -/
def boostOPS : Submonoid (Function.End STVC) where
  carrier := {T | ∃ a b : Cut, a^2 - b^2 = 1 ∧ T = boostFunC a b}
  one_mem' := ⟨1, 0, by ring, boostFunC_one.symm⟩
  mul_mem' := by
    rintro S T ⟨a, b, hab, rfl⟩ ⟨a', b', hab', rfl⟩
    refine ⟨a*a'+b*b', a*b'+b*a', ?_, ?_⟩
    · rw [boostParam_hyp_mul, hab, hab']; ring
    · exact boostFunC_comp a b a' b'

@[simp] theorem mem_boostOPS {T : Function.End STVC} :
    T ∈ boostOPS ↔ ∃ a b : Cut, a^2 - b^2 = 1 ∧ T = boostFunC a b := Iff.rfl

/-- ★ THE EXP-INTEGRATION INTO THE ISOMETRY MONOID: `boostOPS ≤ qvIsomMonoidC`. Every boost in the
    one-parameter subgroup preserves the continuum Born form `QvC` — the integrated tangent (the
    exponential of the form-skew infinitesimal generator) is a global continuum isometry. -/
theorem boostOPS_le_isom : boostOPS ≤ qvIsomMonoidC := by
  rintro T ⟨a, b, hab, rfl⟩
  exact boostC_mem hab

/-- The irrational continuum boost (N49) is a genuine member of the boost one-parameter subgroup. -/
theorem irrBoost_mem_boostOPS :
    boostFunC ((3 * sqrt2)/4) (sqrt2/4) ∈ boostOPS :=
  ⟨(3 * sqrt2)/4, sqrt2/4, irr_hyperbola, rfl⟩

/-- ★ NON-VACUITY (W8): the boost one-parameter subgroup is NOT the trivial `{1}` group — it contains
    the irrational continuum boost (`irrBoost_ne_id`, a genuine time–space mix), so `boostOPS ≠ ⊥`. -/
theorem boostOPS_ne_bot : boostOPS ≠ ⊥ := by
  intro hbot
  have hmem : boostFunC ((3 * sqrt2)/4) (sqrt2/4) ∈ boostOPS := irrBoost_mem_boostOPS
  rw [hbot] at hmem
  have h1 : boostFunC ((3 * sqrt2)/4) (sqrt2/4) = (1 : Function.End STVC) :=
    (Submonoid.mem_bot (M := Function.End STVC)).mp hmem
  exact irrBoost_ne_id h1

/-! ## The exponential of the N51 generator (the literal exp object) and its homomorphism property. -/

/-- THE EXPONENTIAL OF THE N51 INFINITESIMAL BOOST GENERATOR, as the finite exp-polynomial map with
    the hyperbola point `(a,b)` as the group coordinate: `boostExp a b = id + b•G + (a−1)•G²` for
    `G = boostGenC`. The `exp(sT)` object of the boost flow, re-grounded over the derived ℝ with no
    transcendental. -/
def boostExp (a b : Cut) : Function.End STVC :=
  fun p => p + b • boostGenC p + (a-1) • boostGenC (boostGenC p)

/-- The exponential object IS the global boost (`boostExp a b = boostFunC a b`), by the exp-poly. -/
theorem boostExp_eq_boostFunC (a b : Cut) : boostExp a b = boostFunC a b := by
  funext p; rw [boostExp]; exact (boostFunC_eq_gen_poly a b p).symm

/-- ★ THE EXP-INTEGRATION: the exponential of the form-skew infinitesimal boost generator lands in
    the continuum isometry monoid when the parameter is on the unit hyperbola (`a²−b²=1`). The
    one-parameter exponential flow of the N51 tangent generator is a global `QvC`-isometry. -/
theorem boostExp_isom {a b : Cut} (h : a^2 - b^2 = 1) : boostExp a b ∈ qvIsomMonoidC := by
  rw [boostExp_eq_boostFunC]; exact boostC_mem h

/-- The exponential of the trivial hyperbola point `(1,0)` is the identity (`exp(0·G) = 1`). -/
theorem boostExp_one : boostExp 1 0 = (1 : Function.End STVC) := by
  rw [boostExp_eq_boostFunC, boostFunC_one]; rfl

/-- ★★ THE ONE-PARAMETER-SUBGROUP LAW in exp form: `boostExp a b · boostExp a' b' =
    boostExp ((a,b)·(a',b'))` for the hyperbola-group product. The exponential is a homomorphism from
    the abelian hyperbola group into `Function.End STVC`, sweeping the boost one-parameter subgroup —
    the theory-native `exp(sT)·exp(tT) = exp((s+t)T)`. -/
theorem boostExp_comp (a b a' b' : Cut) :
    boostExp a b * boostExp a' b' = boostExp (a*a'+b*b') (a*b'+b*a') := by
  rw [boostExp_eq_boostFunC, boostExp_eq_boostFunC, boostExp_eq_boostFunC]
  exact boostFunC_comp a b a' b'

end

end Phys.Algebra
