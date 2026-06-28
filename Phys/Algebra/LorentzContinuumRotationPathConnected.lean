/-
  Phys.Algebra.LorentzContinuumRotationPathConnected — N153: THE COMPACT-FACTOR (NINTH-DIRECTION
  ROTATION) PATH JOINED TO THE IDENTITY in the operator topology `endOpC` over the DERIVED ℝ `Cut`.

  ===========================================================================
  THE FORWARD FRONTIER (N153). N152 built the operator topology `endOpC` over the derived `Cut`
  (induced on `Module.End Cut STVC` from the function space `STVC → STVC`) and banked the BOOST/cone
  half of the path-connectedness of the `SO⁺(1,9)` identity component: the positive operator square
  root `p^{1/2}` is path-joined to the identity through the cone by a CONTINUOUS affine spectral path
  (`specPathOp_joins_id_sqrt`). The remaining open structure is the COMPACT factor — the
  ninth-direction 2-plane rotation `planeRotLin c s` (N105, the `SO(2)` of the circle `c²+s²=1`)
  must likewise be path-joined to the identity `planeRotLin 1 0 = 1` through a CONTINUOUS path in
  `endOpC` whose every point is a genuine isometry. That gap is what this node BUILDS.

  ★ THE ONE LAW reframe (the trunk-native dissolution — NO posited angle). A rotation "by angle
  `t·θ`" is the standard transcendental trap: it needs `cos`/`sin`/`exp`, none of which exist
  continuously over the derived `Cut`. RETURN TO THE TRUNK. The circle has a RATIONAL (Cayley /
  stereographic) parametrization:
      `cayleyC m = (1 − m²)/(1 + m²)`,   `cayleyS m = 2m/(1 + m²)`.
  It lies EXACTLY on the circle for every `m` (`cayley_on_circle`: `(cayleyC m)² + (cayleyS m)² = 1`,
  a field identity), its denominator `1 + m²` is never zero in the ordered field `Cut`, it is RATIONAL
  in `m` hence CONTINUOUS over `Cut` (`cayleyC_continuous` / `cayleyS_continuous`) WITHOUT any
  `cos`/`sin`/`exp`, it sends `m = 0` to the identity rotation `(1,0)` (`cayleyC_zero` / `cayleyS_zero`),
  and it is SURJECTIVE onto the circle minus the antipode `(−1,0)` (`cayley_surj`: `m = s/(1+c)`
  recovers `(c,s)`). This is the EXACT analogue of N152 dissolving the boost flow into AFFINE
  arithmetic — here the rotation flow dissolves into RATIONAL arithmetic, no posited angle.

  THE PAYOFF: the rotation path `rotPath m := planeRotLin (cayleyC m) (cayleyS m)` is CONTINUOUS in
  `endOpC` (`rotPath_cont`, each coordinate evaluation a `Cut`-rational/affine map), every point is a
  genuine `QvC`-isometry (`rotPath_isQvIsomC`, since `(cayleyC m)²+(cayleyS m)²=1`), it starts at the
  identity (`rotPath_zero : rotPath 0 = 1`), and it REACHES an arbitrary rotation `planeRotLin c s`
  (`rotPath_reaches`, via the surjective `m = s/(1+c)`). Hence for any circle point `(c,s)` with
  `c ≠ −1` the identity `1` and `planeRotLin c s` lie in a SINGLE PRECONNECTED subset of `endOpC`
  realised by a continuous path OF ISOMETRIES (`rotPath_joins_id_rotation`) — the compact-factor
  identity-component statement, parallel to N152's boost-factor one, WITHOUT Mathlib's ℝ
  `unitInterval`/`Path`, WITHOUT a continuous `exp`, WITHOUT a posited angle.

  Banked here (foundations-only `[propext, Classical.choice, Quot.sound]`):
    • `cayleyC` / `cayleyS` — the rational (Cayley/stereographic) circle parametrization over `Cut`;
    • `cayley_den_ne` — the denominator `1 + m²` is never zero in the ordered field;
    • `cayleyC_continuous` / `cayleyS_continuous` — both coordinates continuous over `Cut`;
    • `cayley_on_circle` — `(cayleyC m)² + (cayleyS m)² = 1` for every `m` (field identity);
    • `cayleyC_zero` / `cayleyS_zero` — `m = 0 ↦ (1,0)`, the identity rotation;
    • `cayley_surj` — `m = s/(1+c)` recovers `(c,s)` for `c ≠ −1` (surjective onto circle ∖ antipode);
    • `rotPath` — the rotation path `m ↦ planeRotLin (cayleyC m) (cayleyS m)`;
    • `rotPath_cont` — ★ the rotation path is CONTINUOUS in the operator topology `endOpC`;
    • `rotPath_zero` — `rotPath 0 = 1` (starts at the identity);
    • `rotPath_isQvIsomC` — ★ every point of the path is a genuine `QvC`-isometry (path IN the group);
    • `rotPath_reaches` — `rotPath (s/(1+c)) = planeRotLin c s` (reaches an arbitrary rotation);
    • `rotPath_image_preconnected` — the image on a `uIcc` is preconnected in `endOpC`;
    • `rotPath_joins_id_rotation` — ★★ THE PACKAGED CONNECTEDNESS: a continuous path of isometries in
      `endOpC` whose preconnected image contains both `1` and `planeRotLin c s`;
    • `endOpC_mul_right_cont` / `continuous_mul_right_path` — right-multiplication glue for the KAK
      product assembly (the boost factor on the right of the rotation factor), the next node;
    • `cayleyC_one` / `rotPath_quarter_read` — NON-VACUITY / W8: the concrete quarter turn genuinely
      rotates (`cayleyC 1 = 0`; the quarter turn sends the `x`-axis into the real octonion axis with
      reading `1`).

  DERIVED from the trunk (the rational circle parametrization over the derived `Cut`, the banked
  rotation `planeRotLin` / `planeRotLin_apply` / `planeRotLin_isQvIsomC` / `planeRotLin_one` (N105),
  the operator topology `endOpC` / `endOpC_continuous_iff` / `endOpC_eval_continuous` (N152); standard
  `Continuous.*` / `fun_prop` / `isPreconnected_uIcc` / `IsPreconnected.image` MACHINERY applied to the
  DERIVED objects, STANDARD §3), NOT a posited rotation flow / angle, NOT a posited connectedness, NOT
  a posited compact group / `SO(9)` / `Spin(9)`, NOT a posited Lorentz group, NOT Mathlib ℝ/ℂ as
  content (the field, the path parameter and the circle are ALL the derived `Cut`), NOT a fully proved
  implication asserted without a proof, NOT a bridge.
-/
import Phys.Algebra.LorentzContinuumOperatorTopology
import Phys.Algebra.LorentzContinuumGenerationNinthRotationCircle

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## The rational (Cayley / stereographic) circle parametrization over the derived `Cut`. -/

/-- The cosine-coordinate of the rational circle parametrization: `cayleyC m = (1 − m²)/(1 + m²)`. -/
def cayleyC (m : Cut) : Cut := (1 - m^2)/(1 + m^2)

/-- The sine-coordinate of the rational circle parametrization: `cayleyS m = 2m/(1 + m²)`. -/
def cayleyS (m : Cut) : Cut := (2*m)/(1 + m^2)

/-- The denominator `1 + m²` of the rational parametrization is never zero in the ordered field. -/
theorem cayley_den_ne (m : Cut) : (1 + m^2) ≠ 0 := by positivity

/-- `cayleyC` is continuous over the derived `Cut` (a quotient of polynomials with nonzero
    denominator) — NO `cos`/`sin`/`exp`. -/
theorem cayleyC_continuous : Continuous cayleyC := by
  unfold cayleyC
  fun_prop (disch := exact fun m => cayley_den_ne m)

/-- `cayleyS` is continuous over the derived `Cut` — NO `cos`/`sin`/`exp`. -/
theorem cayleyS_continuous : Continuous cayleyS := by
  unfold cayleyS
  fun_prop (disch := exact fun m => cayley_den_ne m)

/-- ★ THE PARAMETRIZATION STAYS EXACTLY ON THE CIRCLE for every `m`: `(cayleyC m)² + (cayleyS m)² = 1`.
    A pure field identity `((1−m²)² + (2m)²) = (1+m²)²`, so every point of the path is on the unit
    circle — hence (with `planeRotLin_isQvIsomC`) a genuine isometry. -/
theorem cayley_on_circle (m : Cut) : (cayleyC m)^2 + (cayleyS m)^2 = 1 := by
  unfold cayleyC cayleyS
  have hden : (1 + m^2) ≠ 0 := cayley_den_ne m
  field_simp
  ring

/-- `cayleyC 0 = 1`: the parameter origin is the identity rotation's cosine. -/
theorem cayleyC_zero : cayleyC 0 = 1 := by unfold cayleyC; norm_num

/-- `cayleyS 0 = 0`: the parameter origin is the identity rotation's sine. -/
theorem cayleyS_zero : cayleyS 0 = 0 := by unfold cayleyS; norm_num

/-- ★ SURJECTIVITY onto the circle minus the antipode `(−1,0)`: for any circle point `(c,s)` with
    `c ≠ −1`, the parameter `m = s/(1+c)` recovers it — `cayleyC m = c` and `cayleyS m = s`. So the
    rotation path reaches an arbitrary rotation (the antipode is reached as a limit / by a second
    chart, not needed for the connectedness statement). -/
theorem cayley_surj (c s : Cut) (h : c^2 + s^2 = 1) (hc : 1 + c ≠ 0) :
    cayleyC (s/(1+c)) = c ∧ cayleyS (s/(1+c)) = s := by
  have hden0 : (1+c)^2 ≠ 0 := pow_ne_zero 2 hc
  have hden : 1 + s^2/(1+c)^2 ≠ 0 := by positivity
  refine ⟨?_, ?_⟩
  · unfold cayleyC
    rw [div_pow, div_eq_iff hden]
    field_simp
    linear_combination (-(1+c)) * h
  · unfold cayleyS
    rw [div_pow, div_eq_iff hden]
    field_simp
    linear_combination (-s) * h

/-! ## The rotation path in the operator topology `endOpC`. -/

/-- THE ROTATION PATH: `rotPath m := planeRotLin (cayleyC m) (cayleyS m)` — the ninth-direction
    2-plane rotation steered by the rational circle parameter `m`. -/
def rotPath (m : Cut) : Module.End Cut STVC := planeRotLin (cayleyC m) (cayleyS m)

/-- ★ THE ROTATION PATH IS CONTINUOUS in the operator topology `endOpC`. By `endOpC_continuous_iff`
    it suffices that each coordinate evaluation `m ↦ (rotPath m) v` is continuous, and the explicit
    `planeRotLin` coordinate formula is a finite combination of the `Cut`-continuous `cayleyC`/`cayleyS`
    and constants — continuous WITHOUT a continuous `exp`. -/
theorem rotPath_cont : Continuous rotPath := by
  rw [endOpC_continuous_iff]
  intro v
  have hrw : (fun m => (rotPath m) v)
      = (fun m => (v.1, cayleyC m * v.2.1 - cayleyS m * reQC v.2.2,
          v.2.2 + (cayleyS m * v.2.1 + (cayleyC m - 1) * reQC v.2.2) • (1 : O Cut))) := by
    funext m; rw [rotPath, planeRotLin_apply]
  rw [hrw]
  apply Continuous.prodMk continuous_const
  apply Continuous.prodMk
  · exact (cayleyC_continuous.mul continuous_const).sub (cayleyS_continuous.mul continuous_const)
  · apply Continuous.add continuous_const
    apply Continuous.smul _ continuous_const
    exact (cayleyS_continuous.mul continuous_const).add
      ((cayleyC_continuous.sub continuous_const).mul continuous_const)

/-- `rotPath 0 = 1`: the path starts at the identity (`cayleyC 0 = 1`, `cayleyS 0 = 0`,
    `planeRotLin 1 0 = 1`). -/
theorem rotPath_zero : rotPath 0 = 1 := by
  rw [rotPath, cayleyC_zero, cayleyS_zero, planeRotLin_one]

/-- ★ EVERY POINT of the rotation path is a genuine `QvC`-isometry — the path lies entirely IN the
    isometry group, because `(cayleyC m)² + (cayleyS m)² = 1` for every `m` (`cayley_on_circle`).
    This is what makes it a path through the COMPACT group, not merely a path of operators. -/
theorem rotPath_isQvIsomC (m : Cut) : IsQvIsomC (rotPath m) := by
  rw [rotPath]
  exact planeRotLin_isQvIsomC (cayleyC m) (cayleyS m) (cayley_on_circle m)

/-- ★ THE ROTATION PATH REACHES AN ARBITRARY ROTATION: for any circle point `(c,s)` with `c ≠ −1`,
    `rotPath (s/(1+c)) = planeRotLin c s` (the surjective parameter from `cayley_surj`). -/
theorem rotPath_reaches (c s : Cut) (h : c^2 + s^2 = 1) (hc : 1 + c ≠ 0) :
    rotPath (s/(1+c)) = planeRotLin c s := by
  obtain ⟨hC, hS⟩ := cayley_surj c s h hc
  rw [rotPath, hC, hS]

/-- The image of the rotation path on a closed (unordered) interval `uIcc 0 m` is preconnected in the
    operator topology — the continuous image of a preconnected interval of the derived `Cut`. -/
theorem rotPath_image_preconnected (m : Cut) :
    IsPreconnected (rotPath '' (Set.uIcc 0 m)) :=
  (isPreconnected_uIcc).image _ rotPath_cont.continuousOn

/-- ★★ THE PACKAGED CONNECTEDNESS — for any circle point `(c,s)` with `c ≠ −1`, there is a CONTINUOUS
    path `γ` in the operator topology `endOpC` over the derived `Cut`, every point of which is a
    genuine `QvC`-isometry, whose image on `uIcc 0 (s/(1+c))` is a single PRECONNECTED subset of
    `Module.End Cut STVC` containing both the identity `1` and the rotation `planeRotLin c s`. The
    compact factor of the polar/KAK split is topologically path-joined to the identity through the
    circle — the compact-factor identity-component statement (parallel to N152's boost factor),
    realised WITHOUT Mathlib's ℝ `unitInterval`/`Path`, WITHOUT a continuous `exp`, WITHOUT a posited
    angle: pure rational arithmetic over the derived ℝ + the induced operator topology. -/
theorem rotPath_joins_id_rotation (c s : Cut) (h : c^2 + s^2 = 1) (hc : 1 + c ≠ 0) :
    ∃ γ : Cut → Module.End Cut STVC,
      Continuous γ ∧
      (∀ m, IsQvIsomC (γ m)) ∧
      IsPreconnected (γ '' (Set.uIcc 0 (s/(1+c)))) ∧
      (1 : Module.End Cut STVC) ∈ γ '' (Set.uIcc 0 (s/(1+c))) ∧
      planeRotLin c s ∈ γ '' (Set.uIcc 0 (s/(1+c))) := by
  refine ⟨rotPath, rotPath_cont, rotPath_isQvIsomC, rotPath_image_preconnected _, ?_, ?_⟩
  · exact ⟨0, Set.left_mem_uIcc, rotPath_zero⟩
  · exact ⟨s/(1+c), Set.right_mem_uIcc, rotPath_reaches c s h hc⟩

/-! ## Right-multiplication glue for the KAK product assembly (the next node). -/

/-- RIGHT-MULTIPLICATION by a fixed operator is continuous in `endOpC` — `(g * h) v = g (h v)` is the
    evaluation of `g` at the fixed vector `h v`. Feeds the KAK product `(rotation)·(boost)` assembly. -/
theorem endOpC_mul_right_cont (h : Module.End Cut STVC) :
    Continuous (fun g : Module.End Cut STVC => g * h) := by
  rw [endOpC_continuous_iff]
  intro v
  exact endOpC_eval_continuous (h v)

/-- Right-multiplying a CONTINUOUS path by a fixed operator stays continuous in `endOpC` — so
    `t ↦ (boost-path t)·(fixed)` and `t ↦ (rotation-path t)·(fixed boost)` are continuous, the glue
    that joins the two KAK factors into one path. -/
theorem continuous_mul_right_path {X : Type*} [TopologicalSpace X]
    (h : Module.End Cut STVC) (γ : X → Module.End Cut STVC) (hγ : Continuous γ) :
    Continuous (fun t => γ t * h) := by
  rw [endOpC_continuous_iff]
  intro v
  rw [endOpC_continuous_iff] at hγ
  exact hγ (h v)

/-! ## Non-vacuity (W8) — the concrete quarter turn genuinely rotates. -/

/-- `cayleyC 1 = 0`: the rational parameter `m = 1` is the quarter turn `(c,s) = (0,1)`. -/
theorem cayleyC_one : cayleyC 1 = 0 := by unfold cayleyC; norm_num

/-- ★ NON-VACUITY: the quarter turn `rotPath 1 = planeRotLin 0 1` genuinely rotates the `x`-axis
    `(0,1,0)` into the real octonion axis — the new real octonion component reads `1`. A concrete,
    nontrivial rotation, not a vacuous statement. -/
theorem rotPath_quarter_read :
    reQC ((rotPath 1 ((0:Cut), (1:Cut), (0:O Cut))).2.2) = 1 := by
  have hC : cayleyC 1 = 0 := cayleyC_one
  have hS : cayleyS 1 = 1 := by unfold cayleyS; norm_num
  rw [rotPath, hC, hS, planeRotLin_apply]
  show reQC ((0:O Cut) + (1 * 1 + (0 - 1) * reQC (0:O Cut)) • (1 : O Cut)) = 1
  rw [reQC_zero, zero_add]
  show reQC ((1 * 1 + (0 - 1) * 0) • (1 : O Cut)) = 1
  rw [reQC_smul, reQC_one]
  ring

end

end Phys.Algebra
