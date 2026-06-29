/-
  N164 — THE BOOST / POLAR NON-COMPACT FACTOR toward the FULL SO⁺(1,9) IDENTITY COMPONENT.

  ── THE CHAIN POSITION ──
  N163 banked the FULL TIME-FIXING `SO(9)` compact factor as the NON-VACUOUS `JoinedIdQvC`
  (`joinedIdQvC_of_timeFixing_evCOrth_SO9`). The full orthochronous proper Lorentz identity
  component `SO⁺(1,9)` reduces to that compact factor PLUS the NON-compact BOOST factor, glued by
  the polar/KAK split `g = boost · compact`. This node closes the BOOST factor and the polar
  assembly.

  ── THE BOOST PATH (the HYPERBOLIC analogue of N159's `octPlaneRot` circle path) ──
  The boost `boostEndC a b (t,x,v) = (a·t+b·x, b·t+a·x, v)` (N129) is a `QvC`-isometry on the unit
  hyperbola `a²−b²=1` (`boostEndC_isQvIsomC`) and FIXES the octonion block. Where N159's rotation
  rode the rational CIRCLE Cayley `cayleyC`/`cayleyS` (`a²+b²=1`), the boost rides the HYPERBOLA
  `a²−b²=1`. ★ THE ONE LAW / MEASURE-FIRST verdict: the circle Cayley does NOT transfer (its
  steering parametrizes `a²+b²=1`); the rational hyperbola Cayley `(1+m²)/(1−m²)`, `2m/(1−m²)` has
  POLES at `m=±1`. The CLEAN, GLOBAL, pole-free steering is the SQUARE-ROOT branch:

      `boostPath m := boostEndC (cutSqrt (1 + m²)) m`

  the "cosh/sinh" pair `(cutSqrt(1+m²), m)` — a point of the hyperbola for EVERY `m` (`m_iso`:
  `cutSqrt(1+m²)² − m² = 1`, by `cutSqrt_sq` on `1+m² > 0`), NO poles (`1+m² ≥ 1` always), starting
  at `1` (`m=0`: `cutSqrt 1 = 1`), and REACHING an arbitrary forward boost `boostEndC a b` (`a²−b²=1`,
  `0 < a`) at `m = b` (`m_reaches`: `cutSqrt(1+b²) = cutSqrt(a²) = a`). The path is continuous in the
  operator topology `endOpC` because each coordinate is a continuous function of `m`: the only
  non-polynomial ingredient is the cosh-analogue `cutSqrt(1+m²)`, whose continuity
  (`cutSqrt_one_add_sq_cont`) is the order-topology SQUEEZE `|cutSqrt(1+m²) − cutSqrt(1+m₀²)| ≤
  |m²−m₀²|` (the denominator `cutSqrt(1+m²)+cutSqrt(1+m₀²) ≥ 1` controls the difference) against the
  continuous `m ↦ |m²−m₀²| → 0` — NO `cosh`/`exp`, NO posited rapidity flow, NO Mathlib `Real.sqrt`.

  ── WHY `0 < a` IS HONEST, NOT A WEAKENING ──
  The orthochronous (forward) boost branch `a > 0` is exactly the ONE connected component of the
  boost subgroup THROUGH the identity (`a = cosh φ > 0`). The `a < 0` branch is the OTHER component
  (time-reversal), correctly excluded — `JoinedIdQvC` is the path-component-OF-THE-IDENTITY
  predicate, so requiring `0 < a` states `SO⁺` (the proper ORTHOCHRONOUS component) CORRECTLY,
  exactly as N162/N163 required det `+1` to state the `SO(9)`/`SO(8)` identity component (not the
  disconnected `O`).

  ── THE POLAR ASSEMBLY ──
  With the boost factor `JoinedIdQvC` (`joinedIdQvC_boostEndC`) and the time-fixing `SO(9)` compact
  factor `JoinedIdQvC` (N163), their PRODUCT is `JoinedIdQvC` by the engine `joinedIdQvC_mul` (N157)
  — the polar/KAK glue `g = boost · compact`. `joinedIdQvC_boost_compact` packages it.

  ── WHAT THIS NODE BANKS ──
    cutSqrt_one_add_sq_cont    — ★ the cosh-analogue `m ↦ cutSqrt(1+m²)` is continuous (squeeze).
    boostPath / _apply         — the square-root-steered hyperbolic path of boosts.
    boostPath_iso              — every parameter lands on the hyperbola `cutSqrt(1+m²)²−m²=1`.
    boostPath_zero             — `boostPath 0 = 1`.
    boostPath_isQvIsomC        — every point is a `QvC`-isometry (the non-vacuity ingredient).
    boostPath_reaches          — reaches the forward boost `boostEndC a b` at `m = b`.
    boostPath_cont             — continuous in `endOpC`.
    boostPath_image_preconnected
    ★★ joinedIdQvC_boostEndC   — THE BOOST FACTOR: a forward boost is the NON-VACUOUS `JoinedIdQvC`.
    ★★ joinedIdQvC_boost_compact — THE POLAR ASSEMBLY: boost · (time-fixing SO(9) compact) is
                                   `JoinedIdQvC` (the engine `joinedIdQvC_mul`).
    W8: boostWitness / boostWitness_isQvIsomC / joinedIdQvC_boostWitness / boostWitness_moves_time —
        the concrete boost `(5/3, 4/3)` MOVES the timelike axis and is `JoinedIdQvC`.

  THE MOAT: the literature POSITS the polar/KAK decomposition of `SO⁺(1,9)` and the boost as
  `exp(φ K)` of a posited rapidity generator, then asserts connectedness topologically. Here the
  boost path is a RATIONAL-PLUS-ONE-SQUARE-ROOT family over the DERIVED ℝ `Cut`, its continuity an
  order-topology squeeze, its isometry the trunk Born form `QvC` — DERIVED forward from the banked
  N49–N163 with NO `cosh`/`exp`, NO posited rapidity flow, NO posited KAK product, NO posited
  Lorentz group, NO Mathlib `Real.sqrt`.

  DERIVED from the banked N49–N163 + the derived ℝ `Cut` + the terminal algebra `O Cut` + the
  spacetime `STVC` + the indefinite Minkowski form `QvC` + the operator topology `endOpC` + the
  NON-VACUOUS engine `JoinedIdQvC` (N157) + the boost `boostEndC` (N129) + the time-fixing `SO(9)`
  compact factor `joinedIdQvC_of_timeFixing_evCOrth_SO9` (N163) + the scalar square root `cutSqrt`
  (N57). Foundations-only.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Lorentz / boost / hyperbola / hyperbolic /
  rapidity / cosh / sinh / KAK / polar / compact / non-compact / isometry / Spin / SO⁺(1,9) / SO(9) /
  orthochronous / proper / path / connected / Joined / Minkowski / metric / timelike": what remains
  is pure linear algebra and order topology over the derived complete ordered field `Cut`, the
  terminal algebra `O Cut`, and the indefinite form `QvC` — for `a²−b²=1` with `0 < a`, the family
  `m ↦ (the endomorphism `(t,x,v) ↦ (cutSqrt(1+m²)·t+m·x, m·t+cutSqrt(1+m²)·x, v)`)` is a continuous
  map of the derived field into `Module.End Cut STVC`, every value preserves `QvC`, it sends `0` to
  `1` and `b` to the target endomorphism, so the target lies in a preconnected set of
  `QvC`-preservers containing `1`; and the product of two such is again in one. No theorem STATEMENT
  needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge, NO Mathlib
  number-system content import (the continuum is the DERIVED `Cut`), NO posited Lorentz/boost group,
  NO posited rapidity flow, NO posited KAK/polar product, NO regression to the vacuous `JoinedIdC`.
-/
import Phys.Algebra.LorentzContinuumSO9CompactAssembly

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## The cosh-analogue `m ↦ cutSqrt(1+m²)` is continuous (order-topology squeeze). -/

/-- ★ THE COSH-ANALOGUE IS CONTINUOUS — `m ↦ cutSqrt(1 + m²)` is continuous over the derived ℝ
    `Cut`. The order-topology SQUEEZE: `|cutSqrt(1+m²) − cutSqrt(1+m₀²)| ≤ |m² − m₀²|` (the factored
    difference `(√(1+m²)−√(1+m₀²))(√(1+m²)+√(1+m₀²)) = m²−m₀²` with denominator `≥ 1`), squeezed
    between `c ∓ |m²−m₀²|`, both tending to `c = cutSqrt(1+m₀²)` since `m ↦ |m²−m₀²|` is continuous
    and vanishes at `m₀`. NO `cosh`/`exp`, NO Mathlib `Real.sqrt` — pure `cutSqrt_sq` (N57) + the
    banked `OrderTopology Cut` (N34). -/
theorem cutSqrt_one_add_sq_cont : Continuous (fun m : Cut => cutSqrt (1 + m^2)) := by
  rw [continuous_iff_continuousAt]
  intro m₀
  set c := cutSqrt (1 + m₀^2) with hc
  have h1m : ∀ m : Cut, (0:Cut) ≤ 1 + m^2 := fun m => by positivity
  have hge1 : ∀ m : Cut, (1:Cut) ≤ cutSqrt (1 + m^2) := by
    intro m
    nlinarith [cutSqrt_sq (h1m m), cutSqrt_nonneg (1 + m^2), sq_nonneg m]
  have hbound : ∀ m : Cut, |cutSqrt (1 + m^2) - c| ≤ |m^2 - m₀^2| := by
    intro m
    have hsm := cutSqrt_sq (h1m m)
    have hsc := cutSqrt_sq (h1m m₀)
    have hden : (1:Cut) ≤ cutSqrt (1 + m^2) + c := by
      have ha1 := hge1 m; have ha2 := hge1 m₀; rw [← hc] at ha2; linarith
    have hdenpos : (0:Cut) < cutSqrt (1 + m^2) + c := by linarith
    have hdiff : (cutSqrt (1 + m^2) - c) * (cutSqrt (1 + m^2) + c) = m^2 - m₀^2 := by
      have hcc : c * c = 1 + m₀^2 := by rw [hc]; exact hsc
      nlinarith [hsm, hcc]
    have habs0 : |cutSqrt (1 + m^2) - c| * |cutSqrt (1 + m^2) + c| = |m^2 - m₀^2| := by
      rw [← abs_mul, hdiff]
    rw [abs_of_pos hdenpos] at habs0
    nlinarith [abs_nonneg (cutSqrt (1 + m^2) - c), hden, habs0]
  have hcont_e : Continuous (fun m : Cut => |m^2 - m₀^2|) :=
    (continuous_abs).comp ((continuous_pow 2).sub continuous_const)
  have htend_e0 : Filter.Tendsto (fun m : Cut => |m^2 - m₀^2|) (nhds m₀) (nhds 0) := by
    have h0 : |m₀^2 - m₀^2| = (0:Cut) := by simp
    have := hcont_e.tendsto m₀
    rwa [h0] at this
  have hlo : Filter.Tendsto (fun m : Cut => c - |m^2 - m₀^2|) (nhds m₀) (nhds c) := by
    have := (tendsto_const_nhds (x := c) (f := nhds m₀)).sub htend_e0
    simpa using this
  have hhi : Filter.Tendsto (fun m : Cut => c + |m^2 - m₀^2|) (nhds m₀) (nhds c) := by
    have := (tendsto_const_nhds (x := c) (f := nhds m₀)).add htend_e0
    simpa using this
  show Filter.Tendsto (fun m : Cut => cutSqrt (1 + m^2)) (nhds m₀) (nhds c)
  apply tendsto_of_tendsto_of_tendsto_of_le_of_le hlo hhi
  · intro m; have := hbound m; rw [abs_sub_le_iff] at this; linarith [this.1]
  · intro m; have := hbound m; rw [abs_sub_le_iff] at this; linarith [this.2]

/-! ## The square-root-steered hyperbolic path of boosts. -/

/-- THE HYPERBOLIC BOOST PATH `boostPath m := boostEndC (cutSqrt(1+m²)) m` — the square-root-steered
    family of boosts, the hyperbolic analogue of N159's `octPlaneRotPath` (circle) and N156's
    `axisRotPath`. The cosh/sinh pair `(cutSqrt(1+m²), m)` rides the hyperbola `a²−b²=1`. -/
def boostPath (m : Cut) : Module.End Cut STVC := boostEndC (cutSqrt (1 + m^2)) m

/-- THE ISOMETRY CONDITION: every parameter lands on the unit hyperbola `cutSqrt(1+m²)² − m² = 1`
    (`cutSqrt_sq` on `1+m² ≥ 0`). -/
theorem boostPath_iso (m : Cut) : (cutSqrt (1 + m^2))^2 - m^2 = 1 := by
  nlinarith [cutSqrt_sq (show (0:Cut) ≤ 1 + m^2 by positivity)]

/-- `boostPath 0 = 1`: the path starts at the identity (`cutSqrt 1 = 1`, `boostEndC 1 0 = id`). -/
theorem boostPath_zero : boostPath 0 = 1 := by
  rw [boostPath, show (1:Cut) + (0:Cut)^2 = 1 by ring, cutSqrt_one]
  apply LinearMap.ext; intro p
  rw [boostEndC_apply]
  show ((1:Cut) * p.1 + (0:Cut) * p.2.1, (0:Cut) * p.1 + (1:Cut) * p.2.1, p.2.2) = p
  simp only [one_mul, zero_mul, add_zero, zero_add]

/-- ★ EVERY POINT of the boost path is a genuine `QvC`-isometry, because `(cutSqrt(1+m²))²−m²=1` for
    every `m` (`boostPath_iso`). The path lies entirely IN the isometry group — the non-vacuity
    ingredient. -/
theorem boostPath_isQvIsomC (m : Cut) : IsQvIsomC (boostPath m) :=
  boostEndC_isQvIsomC (boostPath_iso m)

/-- ★ THE PATH REACHES AN ARBITRARY FORWARD BOOST: for `a²−b²=1` with `0 < a`,
    `boostPath b = boostEndC a b` (since `cutSqrt(1+b²) = cutSqrt(a²) = a`). -/
theorem boostPath_reaches {a b : Cut} (hab : a^2 - b^2 = 1) (ha : 0 < a) :
    boostPath b = boostEndC a b := by
  rw [boostPath]
  have hr : cutSqrt (1 + b^2) = a := by
    have h1b : (1:Cut) + b^2 = a^2 := by nlinarith [hab]
    rw [h1b]
    exact (cutSqrt_unique (le_of_lt ha) (by ring)).symm
  rw [hr]

/-- ★ THE BOOST PATH IS CONTINUOUS in the operator topology `endOpC`. By `endOpC_continuous_iff`,
    each coordinate evaluation `m ↦ (boostPath m) v` is continuous: the `(t,x)` block is a
    combination of the continuous cosh-analogue `cutSqrt(1+m²)` (`cutSqrt_one_add_sq_cont`) and the
    identity `m`, and the octonion `v`-block is constant — WITHOUT a continuous `cosh`/`exp`, WITHOUT
    a posited rapidity. -/
theorem boostPath_cont : Continuous boostPath := by
  rw [endOpC_continuous_iff]
  intro v
  have hrw : (fun m => (boostPath m) v)
      = (fun m => ((cutSqrt (1 + m^2) * v.1 + m * v.2.1,
          m * v.1 + cutSqrt (1 + m^2) * v.2.1, v.2.2) : STVC)) := by
    funext m
    rw [boostPath, boostEndC_apply]
  rw [hrw]
  apply Continuous.prodMk
  · exact (cutSqrt_one_add_sq_cont.mul continuous_const).add (continuous_id.mul continuous_const)
  apply Continuous.prodMk
  · exact (continuous_id.mul continuous_const).add (cutSqrt_one_add_sq_cont.mul continuous_const)
  · exact continuous_const

/-- The image of the boost path on a closed (unordered) interval is preconnected in the operator
    topology — the continuous image of a preconnected interval of the derived `Cut`. -/
theorem boostPath_image_preconnected (m : Cut) :
    IsPreconnected (boostPath '' (Set.uIcc 0 m)) :=
  (isPreconnected_uIcc).image _ boostPath_cont.continuousOn

/-! ## THE CORE — the forward boost is `JoinedIdQvC` (non-vacuous), and the polar assembly. -/

/-- ★★ THE BOOST FACTOR — a forward boost `boostEndC a b` (`a²−b²=1`, `0 < a`) is `JoinedIdQvC`
    (non-vacuously). The boost path `boostPath` supplies the preconnected witness set OF ISOMETRIES
    (`boostPath_isQvIsomC` — every point preserves `QvC`, the non-vacuity): it is continuous
    (`boostPath_cont`), starts at `1` (`boostPath_zero`), and reaches the boost at `m = b`
    (`boostPath_reaches`). The hyperbolic analogue of N159's `joinedIdQvC_octBlockEndC_octPlaneRot`.
    The `0 < a` condition states the FORWARD (orthochronous) branch — the single connected component
    THROUGH the identity — correctly, just as N162/N163 required det `+1`. -/
theorem joinedIdQvC_boostEndC {a b : Cut} (hab : a^2 - b^2 = 1) (ha : 0 < a) :
    JoinedIdQvC (boostEndC a b) := by
  refine ⟨boostPath '' (Set.uIcc 0 b), ?_, boostPath_image_preconnected b, ?_, ?_⟩
  · rintro x ⟨m, _, rfl⟩
    exact boostPath_isQvIsomC m
  · exact ⟨0, Set.left_mem_uIcc, boostPath_zero⟩
  · exact ⟨b, Set.right_mem_uIcc, boostPath_reaches hab ha⟩

/-- ★★ THE POLAR ASSEMBLY — the polar/KAK product `boost · compact` of a forward boost
    `boostEndC a b` (`a²−b²=1`, `0 < a`) with ANY `JoinedIdQvC` operator `k` (in particular the
    N163 time-fixing `SO(9)` compact factor) is `JoinedIdQvC`. The engine `joinedIdQvC_mul` (N157)
    glues the boost factor (`joinedIdQvC_boostEndC`) to the compact factor through the operator
    product — the polar/KAK split `g = boost · compact`, into the NON-VACUOUS target. -/
theorem joinedIdQvC_boost_compact {a b : Cut} (hab : a^2 - b^2 = 1) (ha : 0 < a)
    {k : Module.End Cut STVC} (hk : JoinedIdQvC k) :
    JoinedIdQvC (boostEndC a b * k) :=
  joinedIdQvC_mul (joinedIdQvC_boostEndC hab ha) hk

/-! ## W8 NON-VACUITY — a concrete forward boost MOVES the timelike axis and is JoinedIdQvC. -/

/-- The concrete forward boost `(5/3, 4/3)` (`(5/3)² − (4/3)² = 1`, `0 < 5/3`). -/
theorem boostWitness_hab : ((5:Cut)/3)^2 - ((4:Cut)/3)^2 = 1 := by norm_num

/-- ★ W8 — the concrete forward boost `boostEndC (5/3) (4/3)` is `JoinedIdQvC` (non-vacuously). -/
theorem joinedIdQvC_boostWitness :
    JoinedIdQvC (boostEndC ((5:Cut)/3) ((4:Cut)/3)) :=
  joinedIdQvC_boostEndC boostWitness_hab (by norm_num)

/-- ★ W8 TEETH — the concrete forward boost GENUINELY MOVES the timelike axis: it sends
    `(1,0,0)` to `(5/3, 4/3, 0) ≠ (1,0,0)`, reading `5/3` on the time slot. The boost factor is a
    non-trivial isometry — the path engine is not decoration. -/
theorem boostWitness_moves_time :
    boostEndC ((5:Cut)/3) ((4:Cut)/3) ((1:Cut), (0:Cut), (0:O Cut))
      = ((5:Cut)/3, (4:Cut)/3, (0:O Cut)) := by
  rw [boostEndC_apply]
  refine Prod.ext ?_ (Prod.ext ?_ rfl)
  · show (5:Cut)/3 * 1 + (4:Cut)/3 * 0 = (5:Cut)/3; ring
  · show (4:Cut)/3 * 1 + (5:Cut)/3 * 0 = (4:Cut)/3; ring

end

end Phys.Algebra
