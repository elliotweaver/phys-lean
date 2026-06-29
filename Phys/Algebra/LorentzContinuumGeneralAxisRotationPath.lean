/-
  Phys.Algebra.LorentzContinuumGeneralAxisRotationPath — N156: THE GENERAL-AXIS GIVENS-ROTATION
  BASE CASE for the `SO(9)` word-exhaustion (the genuinely-new per-factor lever discharging the
  `hword` hypothesis of N155's `bvIsom_joinedIdC_of_compact_word`).

  ===========================================================================
  CONTEXT — what N155 reduced the full path-connectedness to. N155
  (`LorentzContinuumCompactPathConnected`) reframed N154's non-composable path-FUNCTION into the
  COMPOSABLE preconnected-SET form `JoinedIdC g := ∃ Conn, IsPreconnected Conn ∧ 1 ∈ Conn ∧ g ∈
  Conn`, proved the identity component is a SUBMONOID (`joinedIdC_mul`/`joinedIdSubmonoid`), proved
  WORD-INDUCTION (`joinedIdC_listProd`: every finite product of `JoinedIdC` factors is `JoinedIdC`),
  and reduced the FULL `SO⁺(1,9)` path-connectedness to the SINGLE composable residual
  `bvIsom_joinedIdC_of_compact_word`: IF every compact `QvC`-isometry is a finite product of
  `JoinedIdC` factors (the `hword` hypothesis), THEN every `BvC`-isometry is `JoinedIdC`. The
  per-factor base case `joinedIdC_planeRotLin` covered ONLY the single REAL axis `e = 1`.

  ===========================================================================
  WHAT THIS NODE BANKS — the GENERAL-AXIS base case. The unconditional discharge of `hword` is the
  full `SO(9)` Cartan–Dieudonné exhaustion, measured HEAVY (W1/W9): N105 PROVED the literal
  residual FALSE for the `biMulLin` alphabet (the ninth-direction rotations are not reached); the
  reflection-route exhaustion `reflection_exhaustion_M_aniso` (N125) is itself conditional (on
  `haniso_exists`, childed N128) and a single Householder reflection has det = −1 (NOT in the
  identity component, NOT `JoinedIdC` — the connected `SO` part is the EVEN products = rotations),
  and the reflection-deformation route would need unbanked operator-continuity for `houseHolder`
  (only RIGHT-mult continuity `endOpC_mul_right_cont` is banked). THE ONE LAW (W5): the reflection
  route is the standard-math path that FIGHTS the trunk. The TRUNK-NATIVE route is that the compact
  factor is a ROTATION, reached by Givens 2-plane rotations `axisRotLin e c s`, each `JoinedIdC` by
  the SAME Cayley-chart path construction N153/N155 used — generalized from the single real axis to
  ANY unit octonion axis `e`. This is REQUIRED (not decorative): the N114 separator
  (`enlargedAxisNinth_ne_enlargedTwoPlaneNinth`) showed the single real-axis plane generates only
  the proper sub-sector `SO(8)·A`; the GENERAL axes are what reach the full `SO(9)`.

  ── WHAT THIS NODE BANKS ──
  `axisRotPath` — the general-axis rotation path `m ↦ axisRotLin e (cayleyC m) (cayleyS m)`.
  `axisRotPath_cont` — continuous in the operator topology `endOpC` (NO `cos`/`sin`/`exp`, NO
    posited angle: rational Cayley arithmetic over the derived ℝ `Cut`).
  `axisRotPath_zero` — `axisRotPath e 0 = 1` (starts at the identity).
  `axisRotPath_isQvIsomC` — for a UNIT axis, every point of the path is a `QvC`-isometry (the path
    lies IN the compact group — the general-axis analogue of N153's `rotPath_isQvIsomC`).
  `axisRotPath_reaches` — reaches an arbitrary general-axis rotation off the antipode.
  `axisRotPath_image_preconnected` — preconnected image.
  ★ `joinedIdC_axisRotLin` — THE GENERAL-AXIS BASE CASE: every Givens rotation `axisRotLin e c s`
    (circle point `c²+s²=1`, off the antipode `1+c≠0`) is `JoinedIdC` — for ANY axis `e` (the
    `JoinedIdC` reduction needs only the continuous path to id; the unit-axis isometry content is
    `axisRotPath_isQvIsomC`). Generalizes N155's real-axis-only `joinedIdC_planeRotLin`.
  ★ `joinedIdC_axisRotProd` — a FINITE PRODUCT of general-axis Givens rotations (MIXED axes, each
    off the antipode) is `JoinedIdC` (the base case fed through N155's `joinedIdC_listProd`). This
    is the exact form the `SO(9)` Givens/Euler decomposition produces.
  ★★ `bvIsom_joinedIdC_of_axisRotWord` — THE REFINED CONDITIONAL: IF every compact `QvC`-isometry
    is a finite product of unit-axis Givens rotations `axisRotLin e c s` (off the antipode), THEN
    every `BvC`-isometry is `JoinedIdC` — the full `SO⁺(1,9)` path-connectedness. Strictly sharper
    than N155's `bvIsom_joinedIdC_of_compact_word`: the residual is now the CONCRETE `SO(9)` Givens
    decomposition grounded in the banked base case, not an abstract `JoinedIdC`-word. The remaining
    gap (the childed N157 residual) is the standard Givens/Euler factorization of a compact
    isometry — a finite product of plane rotations, each at a unit octonion axis.
  W8 NON-VACUITY: `joinedIdC_axisRotLin_quarterTurn` + ★ `joinedIdC_axisRotLin_halfTurn` — the
    GENERAL-AXIS antipode half-turn `axisRotLin e (-1) 0` (NOT the real axis, NOT reachable by the
    single Cayley chart `1+(-1)=0`) IS `JoinedIdC`, as the product of two general-axis quarter-turns
    via the same-axis angle-addition law `axisRotLin_comp_same_axis` (needs the unit axis `he`). The
    lever genuinely extends reach in BOTH the axis direction (beyond `e = 1`) AND beyond the chart.

  ── HOW IT DESCENDS FROM THE TRUNK (UNBROKEN) ──
  Every object is DERIVED: `axisRotLin` / `axisRotLin_apply` / `axisRotLin_isQvIsomC` /
  `axisRotLin_one_zero` / `axisRotLin_comp_same_axis` (N113/N114 over the derived ℝ `Cut`); the
  rational Cayley parametrization `cayleyC` / `cayleyS` / `cayley_on_circle` / `cayley_surj` /
  `cayleyC_zero` / `cayleyS_zero` / `cayleyC_continuous` / `cayleyS_continuous` (N153); the operator
  topology `endOpC` / `endOpC_continuous_iff` (N152); the set-form engine `JoinedIdC` /
  `joinedIdC_mul` / `joinedIdC_listProd` and the conditional `bvIsom_joinedIdC_of_compact_word`
  (N155); the terminal algebra `O Cut`, the form `gFormC`, the indefinite isometry predicate
  `IsQvIsomC`, the derived ℝ `Cut`. `IsPreconnected.image` / `isPreconnected_uIcc` / `List.prod` /
  `List.map` / `Continuous.*` are MACHINERY on the derived objects. NO Mathlib ℝ/ℂ as content, NO
  posited rotation/angle/topology/connectedness/compact-group, NO bridge — the `hword`-shaped
  hypothesis of `bvIsom_joinedIdC_of_axisRotWord` is an HONESTLY-stated residual (a fully proved
  implication, not asserted), now in the concrete Givens form, with the general-axis half-turn an
  unconditional non-vacuity witness that the engine reaches off the single chart at a general axis.

  ── PHYSICS-WORDS-REMOVABLE ──
  Delete rotation/axis/Givens/isometry/path-connected/half-turn/quarter-turn/Cayley/circle/SO(9)/
  compact/word/Euler → over the derived complete ordered field `Cut`, `joinedIdC_axisRotLin` says
  the linear endomorphism `axisRotLin e c s` lies in a preconnected subset of the induced operator
  topology `endOpC` containing `1`, for any `e` and any `(c,s)` with `c²+s²=1`, `1+c≠0`; the set of
  such joined endomorphisms is closed under `1` and `*` (a submonoid), so a finite product of them
  is such. Pure topology over the derived field; no theorem statement needs a physics word.
-/
import Phys.Algebra.LorentzContinuumCompactPathConnected
import Phys.Algebra.LorentzContinuumGenerationExhaustionAssembly

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## The general-axis rotation path in the operator topology `endOpC`. -/

/-- THE GENERAL-AXIS ROTATION PATH: `axisRotPath e m := axisRotLin e (cayleyC m) (cayleyS m)` — the
    2-plane `span{x, e}` rotation steered by the rational circle parameter `m`. The general-axis
    generalization of N153's `rotPath` (the `e = 1` real-axis case). -/
def axisRotPath (e : O Cut) (m : Cut) : Module.End Cut STVC :=
  axisRotLin e (cayleyC m) (cayleyS m)

/-- ★ THE GENERAL-AXIS ROTATION PATH IS CONTINUOUS in the operator topology `endOpC`. By
    `endOpC_continuous_iff` it suffices that each coordinate evaluation `m ↦ (axisRotPath e m) v` is
    continuous; the explicit `axisRotLin` coordinate formula is a finite combination of the
    `Cut`-continuous `cayleyC`/`cayleyS`, the fixed scalar `gFormC v e`, and constants — continuous
    WITHOUT a continuous `exp`, WITHOUT a posited angle. -/
theorem axisRotPath_cont (e : O Cut) : Continuous (axisRotPath e) := by
  rw [endOpC_continuous_iff]
  intro v
  have hrw : (fun m => (axisRotPath e m) v)
      = (fun m => (v.1, cayleyC m * v.2.1 - cayleyS m * gFormC v.2.2 e,
          v.2.2 + (cayleyS m * v.2.1 + (cayleyC m - 1) * gFormC v.2.2 e) • e)) := by
    funext m; rw [axisRotPath, axisRotLin_apply]
  rw [hrw]
  apply Continuous.prodMk continuous_const
  apply Continuous.prodMk
  · exact (cayleyC_continuous.mul continuous_const).sub (cayleyS_continuous.mul continuous_const)
  · apply Continuous.add continuous_const
    apply Continuous.smul _ continuous_const
    exact (cayleyS_continuous.mul continuous_const).add
      ((cayleyC_continuous.sub continuous_const).mul continuous_const)

/-- `axisRotPath e 0 = 1`: the path starts at the identity (`cayleyC 0 = 1`, `cayleyS 0 = 0`,
    `axisRotLin e 1 0 = 1`). -/
theorem axisRotPath_zero (e : O Cut) : axisRotPath e 0 = 1 := by
  rw [axisRotPath, cayleyC_zero, cayleyS_zero, axisRotLin_one_zero]

/-- ★ EVERY POINT of the general-axis rotation path is a genuine `QvC`-isometry for a UNIT axis
    (`gFormC e e = 1`) — the path lies entirely IN the compact isometry group, because
    `(cayleyC m)² + (cayleyS m)² = 1` for every `m` (`cayley_on_circle`). The general-axis analogue
    of N153's `rotPath_isQvIsomC`. -/
theorem axisRotPath_isQvIsomC (e : O Cut) (he : gFormC e e = 1) (m : Cut) :
    IsQvIsomC (axisRotPath e m) := by
  rw [axisRotPath]
  exact axisRotLin_isQvIsomC e he (cayleyC m) (cayleyS m) (cayley_on_circle m)

/-- ★ THE PATH REACHES AN ARBITRARY GENERAL-AXIS ROTATION: for any circle point `(c,s)` with
    `c ≠ −1`, `axisRotPath e (s/(1+c)) = axisRotLin e c s` (the surjective parameter from
    `cayley_surj`). -/
theorem axisRotPath_reaches (e : O Cut) (c s : Cut) (h : c^2 + s^2 = 1) (hc : 1 + c ≠ 0) :
    axisRotPath e (s/(1+c)) = axisRotLin e c s := by
  obtain ⟨hC, hS⟩ := cayley_surj c s h hc
  rw [axisRotPath, hC, hS]

/-- The image of the general-axis rotation path on a closed (unordered) interval is preconnected in
    the operator topology — the continuous image of a preconnected interval of the derived `Cut`. -/
theorem axisRotPath_image_preconnected (e : O Cut) (m : Cut) :
    IsPreconnected (axisRotPath e '' (Set.uIcc 0 m)) :=
  (isPreconnected_uIcc).image _ (axisRotPath_cont e).continuousOn

/-! ## THE GENERAL-AXIS BASE CASE — the genuinely-new per-factor lever. -/

/-- ★ THE GENERAL-AXIS BASE CASE — every Givens 2-plane rotation `axisRotLin e c s` (circle point
    `c²+s²=1`, off the antipode `1+c≠0`) is `JoinedIdC` (joined to the identity in the operator
    topology `endOpC`). The general-axis rotation path supplies the preconnected witness set
    directly: it is continuous, starts at `1` (`axisRotPath_zero`), and reaches `axisRotLin e c s`
    (`axisRotPath_reaches`). Generalizes N155's real-axis-only `joinedIdC_planeRotLin` to ANY axis —
    the per-factor building block the full `SO(9)` exhaustion needs (the N114 separator showed the
    real axis alone generates only the proper sub-sector `SO(8)·A`). -/
theorem joinedIdC_axisRotLin (e : O Cut) (c s : Cut)
    (h : c^2 + s^2 = 1) (hc : 1 + c ≠ 0) : JoinedIdC (axisRotLin e c s) := by
  refine ⟨axisRotPath e '' (Set.uIcc 0 (s/(1+c))), axisRotPath_image_preconnected e _, ?_, ?_⟩
  · exact ⟨0, Set.left_mem_uIcc, axisRotPath_zero e⟩
  · exact ⟨s/(1+c), Set.right_mem_uIcc, axisRotPath_reaches e c s h hc⟩

/-! ## The Givens-word assembly — a finite product of general-axis rotations is `JoinedIdC`. -/

/-- ★ A FINITE PRODUCT of general-axis Givens rotations (MIXED axes, each off the antipode) is
    `JoinedIdC`. Each factor is `JoinedIdC` by `joinedIdC_axisRotLin`; the product is `JoinedIdC` by
    N155's word-induction `joinedIdC_listProd`. This is the exact form the `SO(9)` Givens/Euler
    decomposition of a compact isometry produces. -/
theorem joinedIdC_axisRotProd (L : List (O Cut × Cut × Cut))
    (hL : ∀ t ∈ L, (t.2.1)^2 + (t.2.2)^2 = 1 ∧ 1 + t.2.1 ≠ 0) :
    JoinedIdC ((L.map (fun t => axisRotLin t.1 t.2.1 t.2.2)).prod) := by
  apply joinedIdC_listProd
  intro g hg
  rw [List.mem_map] at hg
  obtain ⟨t, htL, hgt⟩ := hg
  obtain ⟨hcirc, hanti⟩ := hL t htL
  rw [← hgt]
  exact joinedIdC_axisRotLin t.1 t.2.1 t.2.2 hcirc hanti

/-! ## THE REFINED CONDITIONAL FULL `SO⁺(1,9)` PATH-CONNECTEDNESS (concrete Givens form). -/

/-- ★★ THE REFINED CONDITIONAL FULL PATH-CONNECTEDNESS — IF every compact `QvC`-isometry `k` is a
    finite product of unit-axis Givens rotations `axisRotLin e c s` (off the antipode), THEN every
    `BvC`-isometry `S` is `JoinedIdC`: the full `SO⁺(1,9)` path-connectedness. Strictly sharper than
    N155's `bvIsom_joinedIdC_of_compact_word`: the residual is now the CONCRETE `SO(9)` Givens
    decomposition (a finite product of plane rotations, each at a unit octonion axis) grounded in
    the banked base case `joinedIdC_axisRotLin`, not an abstract `JoinedIdC`-word. The remaining gap
    (childed N157) is the standard Givens/Euler factorization of a compact isometry. -/
theorem bvIsom_joinedIdC_of_axisRotWord {S : Module.End Cut STVC} (hS : IsBvIsomLin S)
    (hgivens : ∀ k : Module.End Cut STVC, IsQvIsomC k →
       ∃ L : List (O Cut × Cut × Cut),
         (∀ t ∈ L, (t.2.1)^2 + (t.2.2)^2 = 1 ∧ 1 + t.2.1 ≠ 0) ∧
         k = (L.map (fun t => axisRotLin t.1 t.2.1 t.2.2)).prod) :
    JoinedIdC S := by
  apply bvIsom_joinedIdC_of_compact_word hS
  intro k hk
  obtain ⟨L, hL, hkeq⟩ := hgivens k hk
  refine ⟨L.map (fun t => axisRotLin t.1 t.2.1 t.2.2), ?_, hkeq⟩
  intro g hg
  rw [List.mem_map] at hg
  obtain ⟨t, htL, hgt⟩ := hg
  obtain ⟨hcirc, hanti⟩ := hL t htL
  rw [← hgt]
  exact joinedIdC_axisRotLin t.1 t.2.1 t.2.2 hcirc hanti

/-! ## W8 NON-VACUITY — the GENERAL-AXIS antipode half-turn (off the single chart) IS `JoinedIdC`. -/

/-- The general-axis quarter-turn `axisRotLin e 0 1` is `JoinedIdC` (`c = 0`, so `1 + 0 ≠ 0`, on the
    circle `0² + 1² = 1`). -/
theorem joinedIdC_axisRotLin_quarterTurn (e : O Cut) :
    JoinedIdC (axisRotLin e (0:Cut) 1) := by
  apply joinedIdC_axisRotLin e
  · ring
  · norm_num

/-- ★ W8 NON-VACUITY — the GENERAL-AXIS antipode half-turn `axisRotLin e (-1) 0` IS `JoinedIdC`,
    even though it is NOT reachable by the single Cayley chart `axisRotPath` (`1 + (-1) = 0`,
    `halfTurn_antipode_not_cayley`): it is the PRODUCT of two general-axis quarter-turns
    (`axisRotLin e 0 1 * axisRotLin e 0 1 = axisRotLin e (-1) 0` by the same-axis angle-addition law
    `axisRotLin_comp_same_axis`, which requires the unit axis `gFormC e e = 1`), each `JoinedIdC`, so
    it is `JoinedIdC` by the engine. The lever genuinely EXTENDS reach in BOTH the axis direction
    (beyond N155's real axis `e = 1`) AND beyond the single chart. -/
theorem joinedIdC_axisRotLin_halfTurn (e : O Cut) (he : gFormC e e = 1) :
    JoinedIdC (axisRotLin e (-1:Cut) 0) := by
  have hmul : axisRotLin e (0:Cut) 1 * axisRotLin e (0:Cut) 1 = axisRotLin e (-1:Cut) 0 := by
    rw [axisRotLin_comp_same_axis e he]; congr 1 <;> ring
  rw [← hmul]
  exact joinedIdC_mul (joinedIdC_axisRotLin_quarterTurn e) (joinedIdC_axisRotLin_quarterTurn e)

end

end Phys.Algebra
